package com.hs.co.controller;

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

import com.hs.co.service.CO1100Service;

@Controller
public class CO1100Controller {
	
	@Resource(name="co1100Service")
	private CO1100Service co1100Service;
	
	private static final Logger logger = LoggerFactory.getLogger(CO1100Controller.class);
	

	/**
   	 * 메소드 설명 : 판매품의서관리 페이지로 이동
   	 * -------------------------------------------------------------------
   	 * @param	Locale	locale 	
   	 * @param	Model 	model 	
   	 * @return	String 	result	판매품의서관리 페이지ID
   	 */
	@RequestMapping(value = "/co1100")
	public String co1100(Locale locale, Model model) {
		return "CO/CO1100";
	}

	/**
   	 * 메소드 설명 : 휴가사용현황 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 
   	 * @return	List	list	연차신청 목록
   	 */
	@RequestMapping(value = "/co1100Sel")
	public @ResponseBody List<Map<String, Object>> CO1100_SEL(@RequestBody Map<String, Object> param, HttpSession session) {
		
		List<Map<String, Object>> list = co1100Service.co1100Sel(param, session);
		return list;
	}

	@RequestMapping(value = "/co1100SelProject")
	public @ResponseBody List<Map<String, Object>> CO1100_SEL_PROJECT(@RequestBody Map<String, Object> param) {

		List<Map<String, Object>> list = co1100Service.co1100SelProject(param);
		return list;
	}

	@RequestMapping(value = "/co1100Save")
	public @ResponseBody Map<String, Object> CO1100_SAVE(@RequestBody Map<String, Object> param, HttpSession session) {

		Map<String, Object> rtnMap = new HashMap<String, Object>();

		try {
			rtnMap = co1100Service.co1100Save(param, session);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}

		return rtnMap;
	}
}
