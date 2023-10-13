package com.hs.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class MainController {
	
	@RequestMapping(value = "/main")
	public ModelAndView main(HttpSession session, ModelAndView mv){

		mv.setViewName("main");
		mv.addObject("USER", session.getAttribute("User"));
		
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/sessionExtend")
	public Map <String, Object> sessionExtend(HttpSession session){
		Map <String, Object> rtnMap = new HashMap<>();
		
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
