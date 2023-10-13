package com.hs.cm.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class Cm1700Service {

	@Autowired
	private SqlSession sqlSession;

	public List<HashMap<String, Object>> cm1700LogSel(Map<String, Object> param) {
		return sqlSession.selectList("cm1700Mapper.cm1700LogSel", param);
	}
}
