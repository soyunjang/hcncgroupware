package com.hs.co.controller;

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

import com.hs.co.service.CO1200Service;

@Controller
public class CO1200Controller {
	
	@Resource(name="co1200Service")
	private CO1200Service co1200Service;
	
	private static final Logger logger = LoggerFactory.getLogger(CO1200Controller.class);
	

	/**
   	 * 메소드 설명 : 판매품의서관리 페이지로 이동
   	 * -------------------------------------------------------------------
   	 * @param	Locale	locale 	
   	 * @param	Model 	model 	
   	 * @return	String 	result	판매품의서관리 페이지ID
   	 */
	@RequestMapping(value = "/co1200")
	public String co1200(Locale locale, Model model) {
		return "CO/CO1200";
	}

	/**
   	 * 메소드 설명 : 휴가사용현황 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 
   	 * @return	List	list	연차신청 목록
   	 */
	@RequestMapping(value = "/co1200Sel")
	public @ResponseBody List<Map<String, Object>> CO1200_SEL(@RequestBody Map<String, Object> param, HttpSession session) {
		
		List<Map<String, Object>> list = co1200Service.co1200Sel(param, session);
		return list;
	}
}
