package com.hs.cm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

@Service("cm1700Service")
public class CM1700Service {

	@Inject
	private SqlSession sqlSession;

	/**
   	 * 메소드 설명 : 접속조회, 메뉴접근조회, 권한그룹변경조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (검색시간)
   	 * @return	List	list	접속 목록, 메뉴접근 목록, 권한그룹변경 목록
   	 */
	public List<HashMap<String, Object>> cm1700LogSel(Map<String, Object> param) {
		
		List<HashMap<String, Object>> rList = sqlSession.selectList("cm1700Mapper.cm1700LogSel", param);
		return rList;
	}
}
