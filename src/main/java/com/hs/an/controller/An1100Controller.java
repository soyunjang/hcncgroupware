package com.hs.an.controller;

import com.hs.an.service.An1000Service;
import com.hs.an.service.An1100Service;
import com.hs.home.controller.UserInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping(value = "/an1100")
public class An1100Controller {

	@Autowired
	private An1000Service an1000Service;
	@Autowired
	private An1100Service an1100Service;

	@ModelAttribute("User")
	public UserInfo userInfo(HttpSession session) {
		return (UserInfo) session.getAttribute("User");
	}

	/**
   	 * 메소드 설명 : 휴가사용현황 페이지로 이동
   	 */
	@RequestMapping(method = RequestMethod.GET)
	public String an1100(@ModelAttribute("User") UserInfo user) {
		return "AN/an1100";
	}

	/**
   	 * 메소드 설명 : 휴가사용현황 조회
   	 */
	@ResponseBody
	@RequestMapping(value = "/list")
	public ResponseEntity AN1100_SEL(@RequestBody Map<String, Object> param, @ModelAttribute("User") UserInfo user) {
		return new ResponseEntity<>(an1100Service.an1100Sel(param, user), HttpStatus.OK);
	}
	
}
