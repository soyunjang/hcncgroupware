package com.hs.main.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hs.common.service.CommonService;
import com.hs.home.controller.UserInfo;
import com.hs.main.service.MainService;

@Controller
public class MainController {
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@Resource(name="commonService")
	private CommonService commonService;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = "/main")
	public ModelAndView main(Locale locale, Model model, HttpSession session, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		UserInfo vo = (UserInfo) session.getAttribute("User");
		
		mv.setViewName("main");
		mv.addObject("USER", vo);
		
		return mv;
	}
	
	@RequestMapping(value = "/sessionExtend")
	public @ResponseBody Map <String, Object> sessionExtend(HttpSession session){
		Map <String, Object> rtnMap = new HashMap<String, Object>();
		
		session.setMaxInactiveInterval(session.getMaxInactiveInterval() + 600);
		
		if(session.getMaxInactiveInterval() > 1800) {
			session.setMaxInactiveInterval(1800);
		}
		
		rtnMap.put("sessionTime", session.getMaxInactiveInterval() - (System.currentTimeMillis() - session.getLastAccessedTime()) / 1000);
		return rtnMap;
	}
	
	@RequestMapping(value = "/logout")
	public void logout(@RequestBody Map<String, Object> param, HttpSession session, HttpServletResponse response) throws IOException {
		session.invalidate();
		
		if(!param.isEmpty()) {
			response.sendError(999);
		}
	}
}
