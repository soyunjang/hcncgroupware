package com.hs.home.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service("homeService")
public class HomeService {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeService.class);
	
	@Inject
	private SqlSession sqlSession; 
	
	/* 사용자 정보 조회 */
	public Map<String,Object> loginCheck(Map<String, Object> param) {
		
		Map<String,Object> rMap = new HashMap<String, Object>();
		
		rMap = sqlSession.selectOne("homeMapper.loginCheck", param);
		return rMap;
	}
	
	/* 사용자 권한별 메뉴 조회 */
	public List<Map<String,Object>> userMenuList(Map<String, Object> param, String id){
		
		param.put("USER_ID", id);
		logger.debug("HomeService > userMenuList ::::::::::::::::::::::::::::::::::::::: {}", param);	
		List<Map<String,Object>> rList = sqlSession.selectList("homeMapper.userMenuList", param);
		return rList;
	}

	/* 접속 정보 저장 */
	public void insertConnectInfo(Map<String, Object> param){
		sqlSession.insert("homeMapper.insertConnectInfo", param);
	}
}