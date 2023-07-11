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
   	 * �޼ҵ� ���� : ������ȸ, �޴�������ȸ, ���ѱ׷캯����ȸ
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	�˻����� (�˻��ð�)
   	 * @return	List	list	���� ���, �޴����� ���, ���ѱ׷캯�� ���
   	 */
	public List<HashMap<String, Object>> cm1700LogSel(Map<String, Object> param) {
		
		List<HashMap<String, Object>> rList = sqlSession.selectList("cm1700Mapper.cm1700LogSel", param);
		return rList;
	}
}
