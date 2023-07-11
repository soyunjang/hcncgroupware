package com.hs.an.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.hs.home.controller.UserInfo;

@Service("an1000Service")
public class AN1000Service {

	@Inject
	private SqlSession sqlSession;

	/**
	 * 메소드 설명 : 사용자 연차정보 조회
	 * -------------------------------------------------------------------
	 * 
	 * @param Map 		param 검색조건 (사용자ID)
	 * @return List 	Map 연차정보 목록
	 */
	public Map<String,Object> an1000InfoSel(HttpSession session) {
		
		Map<String, Object> param = new HashMap();
		UserInfo vo = (UserInfo) session.getAttribute("User");
		param.put("USER_ID", vo.getUSER_ID());
		
		Map<String, Object> rMap = sqlSession.selectOne("an1000Mapper.an1000InfoSel", param);
		
		return rMap;
	}
	
	/**
	 * 메소드 설명 : 연차신청내역 조회
	 * -------------------------------------------------------------------
	 * 
	 * @param Map 		param 검색조건 (사용자ID)
	 * @return List 	list 사용자정보 목록
	 */
	public List<Map<String, Object>> an1000Sel(Map<String, Object> param, HttpSession session) {
		
		UserInfo vo = (UserInfo) session.getAttribute("User");
		param.put("USER_ID", vo.getUSER_ID());
		
		List<Map<String, Object>> rList = sqlSession.selectList("an1000Mapper.an1000Sel", param);
		
		return rList;
	}
	
}
