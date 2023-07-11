package com.hs.cm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hs.cm.service.CM1700Service;

@Controller
public class CM1700Controller {
	
	@Resource(name="cm1700Service")
	private CM1700Service cm1700Service;
	
	private static final Logger logger = LoggerFactory.getLogger(CM1700Controller.class);

	/**
   	 * 메소드 설명 : 로그조회 페이지로 이동
   	 * -------------------------------------------------------------------
   	 * @param	Locale	locale 	
   	 * @param	Model 	model 	
   	 * @return	String 	result	로그조회 페이지ID
   	 */
	@RequestMapping(value = "/cm1700")
	public String cm1700(Locale locale, Model model){
		return "CM/CM1700";
	}

	/**
   	 * 메소드 설명 : 접속조회, 메뉴접근조회, 권한그룹변경조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (검색시간)
   	 * @return	List	list	접속 목록, 메뉴접근 목록, 권한그룹변경 목록
   	 */
	@RequestMapping(value = "/cm1700LogSel")
	public @ResponseBody List < HashMap<String, Object>> cm1700LogSel(@RequestBody Map<String, Object> param){
		
		List<HashMap<String, Object>> rList = cm1700Service.cm1700LogSel(param);
		return rList;
	}
}
