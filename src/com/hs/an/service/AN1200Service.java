package com.hs.an.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import com.hs.an.controller.AN1200Controller;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hs.home.controller.UserInfo;

@Service("an1200Service")
public class AN1200Service {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Inject
	private SqlSession sqlSession;

	/**
	 * 메소드 설명 : 휴가사용현황 조회
	 * -------------------------------------------------------------------
	 * 
	 * @param Map 		param 검색조건 (사용자ID)
	 * @return List 	list 휴가사용현황 목록
	 */
	public List<Map<String, Object>> an1200Sel(Map<String, Object> param) {

		try {
			return sqlSession.selectList("an1200Mapper.an1200Sel", param);
		} catch (Exception e) {
			throw new RuntimeException("날짜별 연차현황 조회 에러", e);
		}

	}

	public int an1200Count() {
		try {
			return sqlSession.selectOne("an1200Mapper.an1200count");
		} catch (Exception e) {
			throw new RuntimeException("날짜별 연차현황 사용/미사용 인원 체크 에러", e);
		}
	}
}
