package com.hs.cm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hs.home.controller.UserInfo;

@Service("cm1400Service")
public class CM1400Service {
	
	@Inject
	private SqlSession sqlSession; 

	/**
   	 * 메소드 설명 : 메뉴마스터목록 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (법인코드명/메뉴ID/메뉴명/메뉴유형/프로그램ID/프로그램경로/사용유무)
   	 * @return	List	list	시스템코드 목록
   	 */
	public List<Map<String, Object>> cm1400Sel(Map<String, Object> param){
		
		List<Map<String,Object>> rList = sqlSession.selectList("cm1400Mapper.cm1400Sel", param);
		return rList;
	}

	/**
   	 * 메소드 설명 : 메뉴마스터정보 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (메뉴ID/법인코드명)
   	 * @return	List	list	시스템코드 목록
   	 */
	public List<Map<String, Object>> cm1400Save(Map<String, Object> param, HttpSession session){
		
		UserInfo vo = (UserInfo) session.getAttribute("User");
		
		param.put("USER_ID", vo.getUSER_ID());
		
		List<Map<String,Object>> rList = sqlSession.selectList("cm1400Mapper.cm1400Save", param);
		return rList;
	}

	/**
   	 * 메소드 설명 : 메뉴ID 중복확인
   	 * -------------------------------------------------------------------
   	 * @param	Map	 param	검색조건 (메뉴ID/법인코드명)
   	 * @return	List map	중복 갯수
   	 */
	public List<Map<String, Object>> cm1400Verification(Map<String, Object> param){
		
		List<Map<String,Object>> rList = sqlSession.selectList("cm1400Mapper.cm1400Verification", param);
		return rList;
	}

	/**
   	 * 메소드 설명 : 메뉴마스터 추가
   	 * -------------------------------------------------------------------
   	 * @param	Map			param		추가할 정보(법인코드/메뉴ID/메뉴유형/메뉴명/메뉴설명/프로그램ID/프로그램경로/사용유무/비고)
   	 * @param	HttpSession	session		로그인한 사용자ID
   	 * @return	HashMap		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
   	 */
	@Transactional
	public HashMap<String, Object> cm1400DetailSave(Map<String, Object> param, HttpSession session){
		
		HashMap<String, Object> rtnMap = new HashMap<String, Object>();		
		UserInfo vo = (UserInfo) session.getAttribute("User");
		
		try {
			param.put("USER_ID", vo.getUSER_ID());		
			sqlSession.update("cm1400Mapper.cm1400DetailSave", param);
		}catch (Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
			
		return rtnMap;
	}
}