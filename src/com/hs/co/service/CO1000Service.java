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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
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

	public int co1000MergeDataSave(MultipartFile excelFile, @RequestParam Map<String, Object> param) {
		return sqlSession.insert("co1000Mapper.co1000Ins", param);
	}

	public int co1000MergeData(MultipartFile excelFile, @RequestParam Map<String, Object> param, UserInfo user) {

		int insertCnt = 0;

		try {
			String fileType = getFileType(excelFile.getOriginalFilename());
			insertCnt = tempDataInsert(excelFile, param, fileType, user);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return insertCnt;
	}

	private int tempDataInsert(MultipartFile excelFile, @RequestParam Map<String, Object> param, String fileType, UserInfo user) {
		
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
					if (cell.getRowIndex() > 0) {
						map.put(wordArray[index], cell.getCellType() == 0 ? cell.getNumericCellValue() : cell.getStringCellValue());
					}
					index++;
				}
				if (map.size() > 0) {
					map.put("FILE_NM", excelFile.getOriginalFilename());
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

	private String getFileType(String fileName) {
		// fileName을 . 으로 토튼을 설정하면 가장 뒤에 토튼이 확장자가 된다.
		StringTokenizer stFileName = new StringTokenizer(fileName, ".");
		String fileType = "";
		while (stFileName.hasMoreTokens()) {
			fileType = stFileName.nextToken();
		}
		return fileType;
	}

}
