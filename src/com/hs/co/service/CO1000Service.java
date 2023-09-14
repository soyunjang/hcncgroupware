package com.hs.co.service;

import com.hs.home.controller.UserInfo;
import org.apache.ibatis.session.SqlSession;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.*;

@Service("co1000Service")
@Transactional
public class CO1000Service {

	@Autowired
	private SqlSession sqlSession;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	/**
	 * 메소드 설명 : 법인카드 사용내역 조회
	 * -------------------------------------------------------------------
	 * 
	 * @param Map param 검색조건 (파일명)
	 * @return List list 법인카드 사용현황 목록
	 */
	public List<Map<String, Object>> co1000SelTemp(Map<String, Object> param) {
		String replace = param.get("FILE_NM").toString().replace(" ", "_");
		param.replace("FILE_NM", replace);
		return sqlSession.selectList("co1000Mapper.co1000SelTemp", param);
	}

	public Map<String, Object> co1000Delete(Map<String, Object> param) {

		Map<String, Object> rtnMap = new HashMap<>();

		try {
			sqlSession.delete("co1000Mapper.co1000Delete", param);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}

		return rtnMap;
	}

	public int co1000MergeDataSave(Map<String, Object> param) {
		return sqlSession.insert("co1000Mapper.co1000Ins", param);
	}

	public int co1000MergeData(MultipartFile excelFile, UserInfo user) {

		int insertCnt = 0;

		try {
			String fileType = getFileType(excelFile.getOriginalFilename());
			insertCnt = tempDataInsert(excelFile, fileType, user);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return insertCnt;
	}

	private int tempDataInsert(MultipartFile excelFile, String fileType, UserInfo user) {
		
		Workbook workbook;
		HSSFSheet hSFSheet = null;
		XSSFSheet xSSFSheet = null;

		int insertCnt = 0;
		String[] wordArray = new String[]{
				"COMPANY", "CARD_NUM" , "USE_DATE", "APPROVAL_NUM", "ACCOUNT", "APPROVAL"
		};

		try {
			if (fileType.equals("xlsx")) {
				workbook = new XSSFWorkbook(excelFile.getInputStream());
				// 첫번째 시트 불러오기
				xSSFSheet = (XSSFSheet) workbook.getSheetAt(0);
			} else if (fileType.equals("xls")) {
				workbook = new HSSFWorkbook(excelFile.getInputStream());
				// 첫번째 시트 불러오기
				hSFSheet = (HSSFSheet) workbook.getSheetAt(0);
			}

			List<Map<String, Object>> mapList = new ArrayList<>();

			for (Row cells : hSFSheet != null ? hSFSheet : xSSFSheet) {
				int index = 0;
				Map<String, Object> map = new HashMap<>();
				for (Cell cell : cells) {
					if (cell.getRowIndex() > 0 && cell.getColumnIndex() < 6) { //EXCEL 2행부터 시작하고 6열까지만 저장
						Object value = null;
						switch (cell.getCellType()) {
							case 0 : // 숫자로 들어올때
								if (wordArray[index].equals("USE_DATE")) {
									String replace = new DecimalFormat().format(cell.getNumericCellValue()).replace(",", "");
									value = dataFormatter(replace);
								} else {
									value = cell.getNumericCellValue();
								}
								break;
							case 1 : // 문자로 들어올때
								if (wordArray[index].equals("USE_DATE")) {
									int length = cell.getStringCellValue().length();
									if (length == 8) {
										value = dataFormatter(cell.getStringCellValue());
									} else {
										value = cell.getStringCellValue().replace(".", "-");
									}
								} else if (wordArray[index].equals("APPROVAL")) {
									value = cell.getStringCellValue()
											.replace(",", "")
											.replaceAll(" ", "");
								} else {
									value = cell.getStringCellValue();
								}
								break;
						}
						map.put(wordArray[index], value);
					}
					index++;
				}
				if (map.size() > 0) {
					map.put("FILE_NM", excelFile.getOriginalFilename().replace(" ","_"));
					map.put("REG_ID", user.getUSER_ID());
					mapList.add(map);
				}
				if (mapList.size() == 100) {
					insertCnt += sqlSession.insert("co1000Mapper.co1000InsTmp", mapList);
					mapList.clear();
				}
			}
			insertCnt += sqlSession.insert("co1000Mapper.co1000InsTmp", mapList);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return insertCnt;
	}

	private String dataFormatter(String date) {
		return LocalDate.parse(new StringBuilder()
				.append(date.substring(0, 4)).append("-")
				.append(date.substring(4, 6)).append("-")
				.append(date.substring(6, 8))
		).toString();
	}

	private String getFileType(String fileName) {
		// fileName을 . 으로 토튼을 설정하면 가장 뒤에 토튼이 확장자가 된다.
		StringTokenizer stFileName = new StringTokenizer(fileName, ".");
		String fileType = "";
		while (stFileName.hasMoreTokens()) {
			fileType = stFileName.nextToken();
		}
		return fileType;
	}

	public List<Map<String, Object>> co1000SelectTagGet(UserInfo user) {
		return sqlSession.selectList("co1000Mapper.co1000SelectTagGet", user.getUSER_ID());
	}

	public List<Map<String, Object>> co1000SelectGet(Map<String, Object> param, UserInfo user) {
		param.put("REG_ID", user.getUSER_ID());
		return sqlSession.selectList("co1000Mapper.co1000SelectGet", param);
	}

	public Map<String, Object> co1000SelectDelete(Map<String, Object> param, UserInfo user) {
		param.put("REG_ID", user.getUSER_ID());
		int count = sqlSession.selectOne("co1000Mapper.co1000SelectCheck", param); // 작성된게 있는지 확인
		if (count == 0) {
			sqlSession.delete("co1000Mapper.co1000SelectDelete", param);
			param.put("DELETE", "Y");
		} else {
			param.put("DELETE", "N");
		}
		return param;
	}
}
