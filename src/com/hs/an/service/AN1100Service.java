package com.hs.an.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.hs.home.controller.UserInfo;

@Service("an1100Service")
public class AN1100Service {

	@Inject
	private SqlSession sqlSession;

	/**
	 * 메소드 설명 : 휴가사용현황 조회
	 * -------------------------------------------------------------------
	 * 
	 * @param Map 		param 검색조건 (사용자ID)
	 * @return List 	list 휴가사용현황 목록
	 */
	public List<Map<String, Object>> an1100Sel(Map<String, Object> param, HttpSession session) {
		
		UserInfo vo = (UserInfo) session.getAttribute("User");
		param.put("USER_ID", vo.getUSER_ID());
		
		List<Map<String, Object>> rList = sqlSession.selectList("an1100Mapper.an1100Sel", param);
		
		return rList;
	}
	
}
