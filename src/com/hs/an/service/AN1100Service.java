package com.hs.an.service;

import com.hs.home.controller.UserInfo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("an1100Service")
public class AN1100Service {

	@Autowired
	private SqlSession sqlSession;

	/**
	 * 메소드 설명 : 휴가사용현황 조회
	 * -------------------------------------------------------------------
	 * 
	 * @param Map 		param 검색조건 (사용자ID)
	 * @return List 	list 휴가사용현황 목록
	 */
	public List<Map<String, Object>> an1100Sel(Map<String, Object> param, UserInfo user) {
		
		param.put("USER_ID", user.getUSER_ID());

		return sqlSession.selectList("an1100Mapper.an1100Sel", param);
	}
	
}
