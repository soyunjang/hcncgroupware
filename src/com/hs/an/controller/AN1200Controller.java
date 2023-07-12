package com.hs.an.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.hs.home.controller.UserInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hs.an.service.AN1000Service;
import com.hs.an.service.AN1200Service;

@Controller
public class AN1200Controller {
	
	@Resource(name="an1000Service")
	private AN1000Service an1000Service;
	
	@Resource(name="an1200Service")
	private AN1200Service an1200Service;
	
	private static final Logger logger = LoggerFactory.getLogger(AN1200Controller.class);
	

	/**
   	 * 메소드 설명 : 휴가사용현황 페이지로 이동
   	 * -------------------------------------------------------------------
   	 * @param	Locale	locale 	
   	 * @param	Model 	model 	
   	 * @return	String 	result	휴가사용현황 페이지ID
   	 */
	@RequestMapping(value = "/an1200")
	public String an1200(Locale locale, Model model, HttpSession session) {

		UserInfo user = (UserInfo) session.getAttribute("User");

		// 사용자 연차정보 조회
		Map<String,Object> holidayInfo = an1000Service.an1000InfoSel(user);
		
		model.addAttribute("Holiday", holidayInfo);
		
		return "AN/AN1200";
	}

	/**
   	 * 메소드 설명 : 휴가사용현황 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 
   	 * @return	List	list	연차신청 목록
   	 */
	@RequestMapping(value = "/an1200Sel")
	public @ResponseBody List<Map<String, Object>> AN1200_SEL(@RequestBody Map<String, Object> param, HttpSession session) {
		
		List<Map<String, Object>> list = an1200Service.an1200Sel(param, session);
		return list;
	}
	
}
