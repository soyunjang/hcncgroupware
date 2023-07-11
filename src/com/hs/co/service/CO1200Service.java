package com.hs.co.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.hs.home.controller.UserInfo;

@Service("co1200Service")
public class CO1200Service {

	@Inject
	private SqlSession sqlSession;

	/**
	 * 메소드 설명 : 법인카드 사용내역 조회
	 * -------------------------------------------------------------------
	 * 
	 * @param Map 		param 검색조건 (조회기간, 판품번호, 성명, 부서)
	 * @return List 	list 법인카드 사용현황 목록
	 */
	public List<Map<String, Object>> co1200Sel(Map<String, Object> param, HttpSession session) {
		
		UserInfo vo = (UserInfo) session.getAttribute("User");
		param.put("USER_ID", vo.getUSER_ID());
		
		List<Map<String, Object>> rList = sqlSession.selectList("co1200Mapper.co1200Sel", param);
		
		return rList;
	}
}
