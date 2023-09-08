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

	public List<HashMap<String, Object>> cm1700LogSel(Map<String, Object> param) {
		return sqlSession.selectList("cm1700Mapper.cm1700LogSel", param);
	}
}
