package com.hs.co.service;

import java.io.IOException;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hs.home.controller.UserInfo;

@Service("co1000Service")
public class CO1000Service {

	@Inject
	private SqlSession sqlSession;

	/**
	 * 메소드 설명 : 법인카드 사용내역 조회
	 * -------------------------------------------------------------------
	 * 
	 * @param Map param 검색조건 (파일명)
	 * @return List list 법인카드 사용현황 목록
	 */
	public List<Map<String, Object>> co1000SelTemp(Map<String, Object> param, HttpSession session) {

		List<Map<String, Object>> rList = sqlSession.selectList("co1000Mapper.co1000SelTemp", param);

		return rList;
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

	public int co1000MergeData(MultipartFile excelFile, @RequestParam Map<String, Object> param) {

		int insertCnt = 0;

		try {
			String fileType = getFileType(excelFile.getOriginalFilename());

			if (fileType.equals("xlsx")) {
				insertCnt = getXSSF(excelFile, param);
			} else if (fileType.equals("xls")) {
				insertCnt = getHSSF(excelFile, param);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return insertCnt;
	}

	public int co1000MergeDataSave(MultipartFile excelFile, @RequestParam Map<String, Object> param) {

		int insertCnt = 0;

		try {
			String fileType = getFileType(excelFile.getOriginalFilename());

			if (fileType.equals("xlsx")) {
				insertCnt = getXSSFSave(excelFile, param);
			} else if (fileType.equals("xls")) {
				insertCnt = getHSSFSave(excelFile, param);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return insertCnt;
	}

	public int getXSSF(MultipartFile excelFile, @RequestParam Map<String, Object> param) {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		Workbook workbook;
		int insertCnt = 0;
		
		try {
			workbook = new XSSFWorkbook(excelFile.getInputStream());
			// 첫번째 시트 불러오기
			XSSFSheet sheet = (XSSFSheet) workbook.getSheetAt(0);
	
			for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
				XSSFRow row = sheet.getRow(i);
	
				// 행이 존재하기 않으면 패스
				if (null == row) {
					continue;
				}

				XSSFCell cell = row.getCell(0);	// 행의 1번째 열(카드사)
				if (null != cell)
					paramMap.put("COMPANY", cell.getStringCellValue());

				cell = row.getCell(1);	// 행의 2번째 열(카드번호)
				if (null != cell)
				paramMap.put("CARD_NUM", cell.getStringCellValue());

				cell = row.getCell(2);	// 행의 3번째 열(거래일자)
				if (null != cell) {
//					String yyyy = cell.getStringCellValue().substring(0, 4);
//					String mm = Integer.parseInt(cell.getStringCellValue().substring(6, 7)) < 10 ? "0" + cell.getStringCellValue().substring(6, 7) : cell.getStringCellValue().substring(6, 7);
//					String dd = Integer.parseInt(cell.getStringCellValue().substring(9, 10)) < 10 ? "0" + cell.getStringCellValue().substring(9, 10) : cell.getStringCellValue().substring(9, 10);
//					paramMap.put("USE_DATE", yyyy + "-" + mm + "-" + dd);
					paramMap.put("USE_DATE", cell.getStringCellValue());
				}

				cell = row.getCell(3);	// 행의 4번째 열(승인번호)
				if (null != cell)
					paramMap.put("APPROVAL_NUM", cell.getStringCellValue());


				cell = row.getCell(4);	// 행의 5번째 열(거래처)
				if (null != cell)
					paramMap.put("ACCOUNT", cell.getStringCellValue());

				cell = row.getCell(5);	// 행의 6번째 열(승인금액)
				if (null != cell)
					paramMap.put("APPROVAL", cell.getNumericCellValue() == 0 ? '0' : cell.getNumericCellValue());

				cell = row.getCell(6);	// 행의 7번째 열(취소금액)
				if (null != cell)
					paramMap.put("REFUND", cell.getNumericCellValue() == 0 ? '0' : cell.getNumericCellValue());

				paramMap.put("FILE_NM", excelFile.getOriginalFilename());
									
				sqlSession.insert("co1000Mapper.co1000InsTmp", paramMap);
				insertCnt++;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return insertCnt;
	}
	
	public int getHSSF(MultipartFile excelFile, @RequestParam Map<String, Object> param) {
		
		Workbook workbook;
		int insertCnt = 0;

		try {
			workbook = new HSSFWorkbook(excelFile.getInputStream());
			// 첫번째 시트 불러오기
			HSSFSheet sheet = (HSSFSheet) workbook.getSheetAt(0);

			for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
				Map<String, Object> paramMap = new HashMap<String, Object>();
				HSSFRow row = sheet.getRow(i);
	
				// 행이 존재하기 않으면 패스
				if (null == row) {
					continue;
				}

				HSSFCell cell = row.getCell(0);	// 행의 1번째 열(카드사)
				if (null != cell) 
					paramMap.put("COMPANY", cell.getStringCellValue());
				
				cell = row.getCell(1);	// 행의 2번째 열(카드번호)
				if (null != cell)
					paramMap.put("CARD_NUM", cell.getStringCellValue());
								
				cell = row.getCell(2);	// 행의 3번째 열(사용일자)
				if (null != cell){
//					String yyyy = cell.getStringCellValue().substring(0, 4);
//					String mm = Integer.parseInt(cell.getStringCellValue().substring(6, 7)) < 10 ? "0" + cell.getStringCellValue().substring(6, 7) : cell.getStringCellValue().substring(6, 7);
//					String dd = Integer.parseInt(cell.getStringCellValue().substring(9, 10)) < 10 ? "0" + cell.getStringCellValue().substring(9, 10) : cell.getStringCellValue().substring(9, 10);
//					paramMap.put("USE_DATE", yyyy + "-" + mm + "-" + dd);
					paramMap.put("USE_DATE", cell.getStringCellValue());
				}

				cell = row.getCell(3);	// 행의 4번째 열(승인번호)
				if (null != cell)
					paramMap.put("APPROVAL_NUM", cell.getStringCellValue());


				cell = row.getCell(4);	// 행의 5번째 열(거래처)
				if (null != cell)
					paramMap.put("ACCOUNT", cell.getStringCellValue());
									
				cell = row.getCell(5);	// 행의 6번째 열(승인금액)
				if (null != cell)
					paramMap.put("APPROVAL", cell.getNumericCellValue() == 0 ? '0' : cell.getNumericCellValue());

				cell = row.getCell(6);	// 행의 7번째 열(취소금액)
				if (null != cell)
					paramMap.put("REFUND", cell.getNumericCellValue() == 0 ? '0' : cell.getNumericCellValue());

				paramMap.put("FILE_NM", excelFile.getOriginalFilename());
									
				sqlSession.insert("co1000Mapper.co1000InsTmp", paramMap);
				insertCnt++;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return insertCnt;
	}

	public int getXSSFSave(MultipartFile excelFile, @RequestParam Map<String, Object> param) {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		Workbook workbook;
		int insertCnt = 0;

		try {
			workbook = new XSSFWorkbook(excelFile.getInputStream());
			// 첫번째 시트 불러오기
			XSSFSheet sheet = (XSSFSheet) workbook.getSheetAt(0);

			for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
				XSSFRow row = sheet.getRow(i);

				// 행이 존재하기 않으면 패스
				if (null == row) {
					continue;
				}

				XSSFCell cell = row.getCell(0);	// 행의 1번째 열(카드사)
				if (null != cell)
					paramMap.put("COMPANY", cell.getStringCellValue());

				cell = row.getCell(1);	// 행의 2번째 열(카드번호)
				if (null != cell)
					paramMap.put("CARD_NUM", cell.getStringCellValue());

				cell = row.getCell(2);	// 행의 3번째 열(거래일자)
				if (null != cell) {
//					String yyyy = cell.getStringCellValue().substring(0, 4);
//					String mm = Integer.parseInt(cell.getStringCellValue().substring(6, 7)) < 10 ? "0" + cell.getStringCellValue().substring(6, 7) : cell.getStringCellValue().substring(6, 7);
//					String dd = Integer.parseInt(cell.getStringCellValue().substring(9, 10)) < 10 ? "0" + cell.getStringCellValue().substring(9, 10) : cell.getStringCellValue().substring(9, 10);
//					paramMap.put("USE_DATE", yyyy + "-" + mm + "-" + dd);
					paramMap.put("USE_DATE", cell.getStringCellValue());
				}

				cell = row.getCell(3);	// 행의 4번째 열(승인번호)
				if (null != cell)
					paramMap.put("APPROVAL_NUM", cell.getStringCellValue());


				cell = row.getCell(4);	// 행의 5번째 열(거래처)
				if (null != cell)
					paramMap.put("ACCOUNT", cell.getStringCellValue());

				cell = row.getCell(5);	// 행의 6번째 열(승인금액)
				if (null != cell)
					paramMap.put("APPROVAL", cell.getNumericCellValue() == 0 ? '0' : cell.getNumericCellValue());

				cell = row.getCell(6);	// 행의 7번째 열(취소금액)
				if (null != cell)
					paramMap.put("REFUND", cell.getNumericCellValue() == 0 ? '0' : cell.getNumericCellValue());

				paramMap.put("FILE_NM", excelFile.getOriginalFilename());

				sqlSession.insert("co1000Mapper.co1000Ins", paramMap);
				insertCnt++;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return insertCnt;
	}

	public int getHSSFSave(MultipartFile excelFile, @RequestParam Map<String, Object> param) {

		Workbook workbook;
		int insertCnt = 0;

		try {
			workbook = new HSSFWorkbook(excelFile.getInputStream());
			// 첫번째 시트 불러오기
			HSSFSheet sheet = (HSSFSheet) workbook.getSheetAt(0);

			for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
				Map<String, Object> paramMap = new HashMap<String, Object>();
				HSSFRow row = sheet.getRow(i);

				// 행이 존재하기 않으면 패스
				if (null == row) {
					continue;
				}

				HSSFCell cell = row.getCell(0);	// 행의 1번째 열(카드사)
				if (null != cell)
					paramMap.put("COMPANY", cell.getStringCellValue());

				cell = row.getCell(1);	// 행의 2번째 열(카드번호)
				if (null != cell)
					paramMap.put("CARD_NUM", cell.getStringCellValue());

				cell = row.getCell(2);	// 행의 3번째 열(사용일자)
				if (null != cell){
//					String yyyy = cell.getStringCellValue().substring(0, 4);
//					String mm = Integer.parseInt(cell.getStringCellValue().substring(6, 7)) < 10 ? "0" + cell.getStringCellValue().substring(6, 7) : cell.getStringCellValue().substring(6, 7);
//					String dd = Integer.parseInt(cell.getStringCellValue().substring(9, 10)) < 10 ? "0" + cell.getStringCellValue().substring(9, 10) : cell.getStringCellValue().substring(9, 10);
//					paramMap.put("USE_DATE", yyyy + "-" + mm + "-" + dd);
					paramMap.put("USE_DATE", cell.getStringCellValue());
				}

				cell = row.getCell(3);	// 행의 4번째 열(승인번호)
				if (null != cell)
					paramMap.put("APPROVAL_NUM", cell.getStringCellValue());


				cell = row.getCell(4);	// 행의 5번째 열(거래처)
				if (null != cell)
					paramMap.put("ACCOUNT", cell.getStringCellValue());

				cell = row.getCell(5);	// 행의 6번째 열(승인금액)
				if (null != cell) {
					paramMap.put("APPROVAL", cell.getNumericCellValue() == 0 ? '0' : cell.getNumericCellValue());
				}
				cell = row.getCell(6);	// 행의 7번째 열(취소금액)
				if (null != cell)
					paramMap.put("REFUND", cell.getNumericCellValue() == 0 ? '0' : cell.getNumericCellValue());

				paramMap.put("FILE_NM", excelFile.getOriginalFilename());

				sqlSession.insert("co1000Mapper.co1000Ins", paramMap);
				insertCnt++;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return insertCnt;
	}

	public Map<String, Object> co1000Save(Map<String, Object> param, HttpSession session) {

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		UserInfo vo = (UserInfo) session.getAttribute("User");

		try {
			param.put("REG_ID", vo.getUSER_ID());

			sqlSession.insert("co1000Mapper.co1000Save", param);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}

		return rtnMap;
	}

	public Map<String, Object> co1000Delete(Map<String, Object> param) {

		Map<String, Object> rtnMap = new HashMap<String, Object>();

		try {
			sqlSession.delete("co1000Mapper.co1000Delete", param);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}

		return rtnMap;
	}
}
