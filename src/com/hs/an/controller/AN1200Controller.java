package com.hs.an.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.hs.home.controller.UserInfo;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.hs.an.service.AN1000Service;
import com.hs.an.service.AN1200Service;

@Controller
public class AN1200Controller {
	
	@Autowired
	private AN1000Service an1000Service;

	@Autowired
	private AN1200Service an1200Service;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	

	/**
   	 * 메소드 설명 : 휴가사용현황 페이지로 이동
   	 * -------------------------------------------------------------------
   	 * @return	String 	result	휴가사용현황 페이지ID
   	 */
	@RequestMapping(value = "/an1200", method = RequestMethod.GET)
	public String an1200(Model model) {
		model.addAttribute("UsersCount", an1200Service.an1200Count());
		return "AN/AN1200";
	}

	/**
   	 * 메소드 설명 : 휴가사용현황 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 
   	 * @return	List	list	연차신청 목록
   	 */
	@ResponseBody
	@RequestMapping(value = "/an1200Sel")
	public  List<Map<String, Object>> AN1200_SEL(@RequestBody Map<String, Object> param) {
		return an1200Service.an1200Sel(param);
	}
	
}
