package com.hs.cm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hs.home.controller.UserInfo;

@Service("cm1800Service")
public class CM1800Service {
	
	@Inject
	private SqlSession sqlSession; 

	/**
   	 * �޼ҵ� ���� : �������� ��ȸ
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	�˻����� (������ȣ/�ۼ���)
   	 * @return	List	list	�������� ���
   	 */
	public List<Map<String, Object>> cm1800HeadSel(Map<String, Object> param){
		
		List<Map<String,Object>> rList = sqlSession.selectList("cm1800Mapper.cm1800HeadSel", param);
		return rList;
	}

	/* Detail Table ��ȸ */
	public List<Map<String, Object>> cm1800HeadDetailSel(Map<String, Object> param){
		
		List<Map<String,Object>> rList = sqlSession.selectList("cm1800Mapper.cm1800HeadDetailSel", param);
		return rList;
	}

	/**
   	 * �޼ҵ� ���� : �������� ����
   	 * -------------------------------------------------------------------
   	 * @param	Map			param		�߰��� ����(������ȣ/����������/����������/����/����/�����ڵ�/�ۼ���ID/�ۼ��ڸ�/ǥ�ÿ���)
   	 * @param	HttpSession	session		�α����� �����ID
   	 * @return	Map 		rtnMap		�߰� ����/���� Ȯ��(0:����/1:����)
   	 */
	@Transactional
	public Map<String, Object> cm1800HeadSave(Map<String, Object> param, HttpSession session){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		UserInfo vo = (UserInfo) session.getAttribute("User");
		
		try {
			param.put("REG_ID", vo.getUSER_ID());
			sqlSession.update("cm1800Mapper.cm1800HeadSave", param);
		}catch (Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "������ �߻��Ͽ����ϴ�.");
			rtnMap.put("Errstate", -1);
		}
		
		return rtnMap;
	}
}