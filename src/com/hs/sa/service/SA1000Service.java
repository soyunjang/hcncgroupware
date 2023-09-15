package com.hs.sa.service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hs.home.controller.UserInfo;
import com.hs.home.controller.UserInfoEncrypt;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("sa1000Service")
public class SA1000Service {

	private static final Logger logger = LoggerFactory.getLogger(SA1000Service.class);

	@Inject
	private SqlSession sqlSession;

	public List<Map<String, Object>> sa1000Sel(Map<String, Object> param) {
		return sqlSession.selectList("sa1000Mapper.sa1000Sel", param);
	}

	public List<Map<String, Object>> sa1001Sel(Map<String, Object> param) {
		return sqlSession.selectList("sa1000Mapper.sa1001Sel", param);
	}

	public List<Map<String, Object>> sa1002Sel(Map<String, Object> param) {
		return sqlSession.selectList("sa1000Mapper.sa1002Sel", param);
	}

	public List<Map<String, Object>> sa1003Sel(Map<String, Object> param) {
		return sqlSession.selectList("sa1000Mapper.sa1003Sel", param);
	}

	public List<Map<String, Object>> sa1004Sel(Map<String, Object> param) {
		return sqlSession.selectList("sa1000Mapper.sa1004Sel", param);
	}

	public List<Map<String, Object>> sa1005Sel(Map<String, Object> param) {
		return sqlSession.selectList("sa1000Mapper.sa1005Sel", param);
	}

	public List<Map<String, Object>> sa1006Sel(Map<String, Object> param) {
		return sqlSession.selectList("sa1000Mapper.sa1006Sel", param);
	}

	public List<Map<String, Object>> sa1007Sel(Map<String, Object> param) {
		return sqlSession.selectList("sa1000Mapper.sa1007Sel", param);
	}
	
	/**
   	 * 메소드 설명 : 환율 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건(계약일자)
   	 * @return	List	list	환율 목록
   	 */
	public List<Map<String, Object>> sa1000SelExchange(Map<String, Object> param) throws IOException {
		
		List<Map<String, Object>> rList = new ArrayList<>();
		
		StringBuilder builder = new StringBuilder("https://www.koreaexim.go.kr/site/program/financial/exchangeJSON");
		builder.append("?authkey=" + "fCf0P4WdNYuhdkI8kVhucTxJYHGq3RXp");
		
		String contractDt = param.get("CONTRACT_DT").toString();
		builder.append("&searchdate=" + contractDt);
		builder.append("&data=" + "AP01");
		
		URL url;
		try {
			url = new URL(builder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code : " + conn.getResponseCode());
			
			BufferedReader rd;
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			
			StringBuilder sb = new StringBuilder();
			String line;
			while((line = rd.readLine()) != null) {
				sb.append(line);
			}
			
			rList = new ObjectMapper().readValue(sb.toString(), new TypeReference<List<Map<String, Object>>>(){});
			
			rd.close();
			conn.disconnect();
						
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		
		return rList;
	}
	
	/**
   	 * 메소드 설명 : 판매품의서 번호 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건(사업장)
   	 * @return	String	string	판매품의서 번호
   	 */
	public String sa1000SelSalesNum(Map<String, Object> param) {
		return sqlSession.selectOne("sa1000Mapper.sa1000SelSalesNum", param);
	}

	public void sa1000Delete(Map<String, Object> param) {
		for (String key : param.keySet()) {
			List<Map<String, Object>> dataList = (List<Map<String, Object>>) param.get(key);
			for (int j = 0; j < dataList.size(); j++) {
				Map<String, Object> dataMap = dataList.get(j);

				if(key == "table2") {
					sqlSession.delete("sa1000Mapper.sa1001Delete", dataMap);
				} else if(key == "table3") {
					sqlSession.delete("sa1000Mapper.sa1002Delete", dataMap);
				} else if(key == "table4") {
					sqlSession.delete("sa1000Mapper.sa1003Delete", dataMap);
				} else if(key == "table5") {
					sqlSession.delete("sa1000Mapper.sa1004Delete", dataMap);
				} else if(key == "table6") {
					sqlSession.delete("sa1000Mapper.sa1005Delete", dataMap);
				} else if(key == "table7") {
					sqlSession.delete("sa1000Mapper.sa1006Delete", dataMap);
				}
			}
		}
	}

	@SuppressWarnings("unchecked")
	public int sa1000MergeData(Map<String, Object> param) {
		logger.debug("sa1000Service > sa1000MergeData :: {}", param);

		int resultCnt = 0;
		sa1000Delete(param);

		for (String key : param.keySet()) {
			List<Map<String, Object>> dataList = (List<Map<String, Object>>) param.get(key);
			for (int j = 0; j < dataList.size(); j++) {
				Map<String, Object> dataMap = dataList.get(j);

				if (dataMap.get("action").equals("C") || dataMap.get("action").equals("U")) {
					if(key == "table2") {
						sqlSession.insert("sa1000Mapper.sa1001Save", dataMap);
						resultCnt++;
					} else if(key == "table3") {
						sqlSession.insert("sa1000Mapper.sa1002Save", dataMap);
						resultCnt++;
					} else if(key == "table4") {
						sqlSession.insert("sa1000Mapper.sa1003Save", dataMap);
						resultCnt++;
					} else if(key == "table5") {
						sqlSession.insert("sa1000Mapper.sa1004Save", dataMap);
						resultCnt++;
					} else if(key == "table6") {
						sqlSession.insert("sa1000Mapper.sa1005Save", dataMap);
						resultCnt++;
					} else if(key == "table7") {
						sqlSession.insert("sa1000Mapper.sa1006Save", dataMap);
						resultCnt++;
					} else if(key == "table8") {
						sqlSession.update("sa1000Mapper.sa1007Update", dataMap);
						resultCnt++;
					}
				}
			}
		}

		return resultCnt;
	}

	/**
   	 * 메소드 설명 : 판매품의서 정보 저장
   	 * -------------------------------------------------------------------
   	 * @param	Map			param		추가할 정보(사업장/판매품의서번호/프로젝트명/거래처명/영업담당자/계약일자/품목/수량/PM/프로젝트기간/변경사유/단가/판매금액/마진/최종마진)
   	 * @param	HttpSession	session		로그인한 사용자ID
   	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
   	 */
	@Transactional
	public Map<String, Object> sa1000Save(Map<String, Object> param, HttpSession session) {
		
		Map<String, Object> rtnMap = new HashMap<>();
		UserInfo vo = (UserInfo) session.getAttribute("User");
		
		try {
			param.put("REG_ID", vo.getUSER_ID().toString());
			sqlSession.insert("sa1000Mapper.sa1000Save", param);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
		
		return rtnMap;
	}

	/**
	 * 메소드 설명 : 판매품의서 정보 수정
	 * -------------------------------------------------------------------
	 * @param	Map			param		추가할 정보(사업장/판매품의서번호/프로젝트명/거래처명/영업담당자/계약일자/품목/수량/PM/프로젝트기간/변경사유/단가/판매금액/마진/최종마진)
	 * @param	HttpSession	session		로그인한 사용자ID
	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
	 */
	@Transactional
	public Map<String, Object> sa1000Update(Map<String, Object> param, HttpSession session) {

		Map<String, Object> rtnMap = new HashMap<>();
		UserInfo vo = (UserInfo) session.getAttribute("User");

		try {
			param.put("REG_ID", vo.getUSER_ID().toString());
			sqlSession.update("sa1000Mapper.sa1000Update", param);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}

		return rtnMap;
	}

	/**
   	 * 메소드 설명 : 판매품의서 정보 확정
   	 * -------------------------------------------------------------------
   	 * @param	Map			param		확정할 정보(사업장/판매품의서번호/프로젝트명/거래처명/영업담당자/계약일자/품목/수량/PM/프로젝트기간/변경사유/단가/판매금액/마진/최종마진)
   	 * @param	HttpSession	session		로그인한 사용자ID
   	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
   	 */
	public Map<String, Object> sa1000Confirm(Map<String, Object> param, HttpSession session) {
		
		Map<String, Object> rtnMap = new HashMap<>();
		UserInfo vo = (UserInfo) session.getAttribute("User");
		
		try {
			param.put("REG_ID", vo.getUSER_ID());
			sqlSession.update("sa1000Mapper.sa1000UpdateConfirm", param);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}

		return rtnMap;
	}

	public Map<String, Object> sa1000UpVersoin(Map<String, Object> param, HttpSession session) {

		Map<String, Object> rtnMap = new HashMap<>();
		UserInfo vo = (UserInfo) session.getAttribute("User");

		String nextRevision = nextRevisionAdd((String) param.get("REVISION"));
		param.put("NEXT_REVISION", nextRevision);
		int count = sqlSession.selectOne("sa1000Mapper.sa1000ConfirmCheck", param);

		try {
			if (count == 0) {
				param.put("REG_ID", vo.getUSER_ID());
				sqlSession.update("sa1000Mapper.sa1000UpdateVersion", param);
				sqlSession.insert("sa1000Mapper.sa1000Confirm", param);
				sqlSession.insert("sa1000Mapper.sa1001Confirm", param);
				sqlSession.insert("sa1000Mapper.sa1002Confirm", param);
				sqlSession.insert("sa1000Mapper.sa1003Confirm", param);
				sqlSession.insert("sa1000Mapper.sa1004Confirm", param);
				sqlSession.insert("sa1000Mapper.sa1005Confirm", param);
				sqlSession.insert("sa1000Mapper.sa1006Confirm", param);
			}
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}

		return rtnMap;
	}

	private String nextRevisionAdd(String revision) {
		String result;
		int nextRevision = Integer.parseInt(revision) + 1;
		if (nextRevision < 10) {
			result = "0" + nextRevision;
		} else {
			result = String.valueOf(nextRevision);
		}
		return result;
	}

	/**
   	 * 메소드 설명 : 판매품의서 정보 복사
   	 * -------------------------------------------------------------------
   	 * @param	Map			param		복사할 정보(사업장/판매품의서번호/프로젝트명/거래처명/영업담당자/계약일자/품목/수량/PM/프로젝트기간/변경사유/단가/판매금액/마진/최종마진)
   	 * @param	HttpSession	session		로그인한 사용자ID
   	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
   	 */
	public Map<String, Object> sa1001Copy(Map<String, Object> param, HttpSession session) {
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		UserInfo vo = (UserInfo) session.getAttribute("User");
		
		try {
			param.put("REG_ID", vo.getUSER_ID());
			sqlSession.insert("sa1000Mapper.sa1000Copy", param);
			sqlSession.insert("sa1000Mapper.sa1001Copy", param);
			sqlSession.insert("sa1000Mapper.sa1002Copy", param);
			sqlSession.insert("sa1000Mapper.sa1003Copy", param);
			sqlSession.insert("sa1000Mapper.sa1004Copy", param);
			sqlSession.insert("sa1000Mapper.sa1005Copy", param);
			sqlSession.insert("sa1000Mapper.sa1006Copy", param);
			sqlSession.insert("sa1000Mapper.sa1007Copy", param);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}

		return rtnMap;
	}

	public Map<String, Object> selectSA1000List(Map<String, Object> param) {
		logger.debug("sa1000Service > selectSA1000List :: {}", param);
		return sqlSession.selectOne("sa1000Mapper.sa1000SelList", param);
	}

	public List<Map<String, Object>> selectSA1002List(Map<String, Object> param) {
		logger.debug("sa1000Service > selectSA1002List :: {}", param);
		return sqlSession.selectList("sa1000Mapper.sa1002SelList", param);
	}

	public List<Map<String, Object>> selectSA1003List(Map<String, Object> param) {
		logger.debug("sa1000Service > selectSA1003List :: {}", param);
		return sqlSession.selectList("sa1000Mapper.sa1003SelList", param);
	}
	
	public List<Map<String, Object>> selectSA1004List(Map<String, Object> param) {
		logger.debug("sa1000Service > selectSA1004List :: {}", param);
		return sqlSession.selectList("sa1000Mapper.sa1004SelList", param);
	}
	
	public List<Map<String, Object>> selectSA1005List(Map<String, Object> param) {
		logger.debug("sa1000Service > selectSA1005List :: {}", param);
		return sqlSession.selectList("sa1000Mapper.sa1005Sel", param);
	}
	
	public List<Map<String, Object>> selectSA1006List(Map<String, Object> param) {
		logger.debug("sa1000Service > selectSA1006List :: {}", param);
		return sqlSession.selectList("sa1000Mapper.sa1006Sel", param);
	}
	
	public List<Map<String, Object>> selectSA1007List(Map<String, Object> param) {
		logger.debug("sa1000Service > selectSA1007List :: {}", param);
		return sqlSession.selectList("sa1000Mapper.sa1007Sel", param);
	}

	public void sa1000DeleteByConfirmN(Map<String, Object> param) {
		sqlSession.delete("sa1000Mapper.sa100DeleteByConfirmN", param);
	}
}
