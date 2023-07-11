package com.hs.cm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hs.cm.service.CM1800Service;
import com.hs.home.controller.UserInfo;

@Controller
public class CM1800Controller {
	
	@Resource(name="cm1800Service")
	private CM1800Service cm1800Service;
	
	private static final Logger logger = LoggerFactory.getLogger(CM1800Controller.class);

	/**
   	 * �޼ҵ� ���� : �������װ��� �������� �̵�
   	 * -------------------------------------------------------------------
   	 * @param	Locale	locale 	
   	 * @param	Model 	model 	
   	 * @return	String 	result	�������װ��� ������ID
   	 */
	@RequestMapping(value = "/cm1800")
	public String cm1800(Locale locale, Model model) {
		return "CM/CM1800";
	}

	/**
   	 * �޼ҵ� ���� : �������� ��ȸ
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	�˻����� (������ȣ/�ۼ���)
   	 * @return	List	list	�������� ���
   	 */
	@RequestMapping(value = "/cm1800HeadSel")
	public @ResponseBody List<Map <String, Object>> CM1800_HeadSel(@RequestBody Map<String, Object> param, HttpSession session) {
		
		UserInfo vo = (UserInfo)session.getAttribute("User");
		List<Map<String,Object>> list = cm1800Service.cm1800HeadSel(param);
		return list;
	}

	/* Detail Table ��ȸ */
	@RequestMapping(value = "/cm1800HeadDetailSel")
	public @ResponseBody List<Map <String, Object>> CM1800_HeadDetailSel(@RequestBody Map<String, Object> param) {
		
		List<Map<String,Object>> list = cm1800Service.cm1800HeadDetailSel(param);
		return list;
	}

	/**
   	 * �޼ҵ� ���� : �������� ����
   	 * -------------------------------------------------------------------
   	 * @param	Map			param		�߰��� ����(������ȣ/����������/����������/����/����/�����ڵ�/�ۼ���ID/�ۼ��ڸ�/ǥ�ÿ���)
   	 * @param	HttpSession	session		�α����� �����ID
   	 * @return	Map 		rtnMap		�߰� ����/���� Ȯ��(0:����/1:����)
   	 */
	@RequestMapping(value = "/cm1800HeadSave")
	public @ResponseBody Map <String, Object> cm1800HeadSave(@RequestBody Map<String, Object> param, HttpSession session) {
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		try {
			rtnMap = cm1800Service.cm1800HeadSave(param, session);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "������ �߻��Ͽ����ϴ�.");
			rtnMap.put("Errstate", -1);
		}
		
		return rtnMap;
	}
}
