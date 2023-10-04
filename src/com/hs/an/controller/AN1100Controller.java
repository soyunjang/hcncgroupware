package com.hs.an.controller;

import com.hs.an.service.AN1000Service;
import com.hs.an.service.AN1100Service;
import com.hs.home.controller.UserInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Slf4j
@Controller
public class AN1100Controller {

	@Autowired
	private AN1000Service an1000Service;
	@Autowired
	private AN1100Service an1100Service;

	@ModelAttribute("User")
	public UserInfo userInfo(HttpSession session) {
		return (UserInfo) session.getAttribute("User");
	}

	/**
   	 * 메소드 설명 : 휴가사용현황 페이지로 이동
   	 */
	@RequestMapping(value = "/an1100", method = RequestMethod.GET)
	public String an1100(Model model, @ModelAttribute("User") UserInfo user) {
		// 사용자 연차정보 조회
		Map<String,Object> holidayInfo = an1000Service.an1000InfoSel(null, user);
		
		model.addAttribute("Holiday", holidayInfo);
		
		return "AN/AN1100";
	}

	/**
   	 * 메소드 설명 : 휴가사용현황 조회
   	 */
	@ResponseBody
	@RequestMapping(value = "/an1100Sel")
	public ResponseEntity AN1100_SEL(@RequestBody Map<String, Object> param, @ModelAttribute("User") UserInfo user) {
		return new ResponseEntity<>(an1100Service.an1100Sel(param, user), HttpStatus.OK);
	}
	
}
