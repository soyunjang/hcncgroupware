package com.hs.an.service;

import com.hs.home.controller.UserInfo;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("an1000Service")
public class AN1000Service {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Inject
	private SqlSession sqlSession;

	/**
	 * 메소드 설명 : 사용자 연차정보 조회
	 * -------------------------------------------------------------------
	 * 
	 * @param Map 		param 검색조건 (사용자ID)
	 * @return List 	Map 연차정보 목록
	 */
	public Map<String,Object> an1000InfoSel(UserInfo user) {
		
		Map<String, Object> param = new HashMap();
		param.put("USER_ID", user.getUSER_ID());
		
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
	public List<Map<String, Object>> an1000Sel(Map<String, Object> param, UserInfo user) {

		param.put("USER_ID", user.getUSER_ID());

		List<Map<String, Object>> rList = sqlSession.selectList("an1000Mapper.an1000Sel", param);
		
		return rList;
	}

	public void an1000Save(Map<String, Object> param, UserInfo user) {
		param.put("USER_ID", user.getUSER_ID());
		param.put("REG_ID", user.getUSER_ID());
		param.put("REG_DT", LocalDate.now());
		param.put("DEPT_CD", user.getDEPT_CD());
		param.put("POST_CD", user.getGRADE_CD());
		logger.info(param.toString());
		sqlSession.insert("an1000Mapper.an1000Save", param);
	}
}
