package com.hs.common.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hs.common.service.CommonService;
import com.hs.home.controller.UserInfo;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{

	@Resource(name="commonService")
	private CommonService commonService;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();

		if(request.getRequestURI().equals("/logout")) {
			response.sendError(999);
			session.invalidate();
			return false;
		}

		if(request.getRequestURI().equals("/selectLists") ||
		   request.getRequestURI().equals("/downloadFile.do")) {
			return true;
		}
		
		if(session.getAttribute("User") == null){
			if(isAjaxRequest(request)){
				response.sendError(999);
				session.invalidate();
				return false;
			}
			else{
				response.sendRedirect("/");
				session.invalidate();
				return false;
			}
		}
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws UnknownHostException{
		
		if(modelAndView != null) {
			if(!isAjaxRequest(request)) {
				Map <String, Object> param = new HashMap<>();
				String view = "";
				String viewNM = modelAndView.getViewName();
				if(viewNM.equals("main")) {
					view = "main";
				} else if(viewNM.split("/")[1].equals("SA1000Print")) {
					view = "sa1000";
				} else if(viewNM.split("/")[1].equals("CO1100Print")) {
					view = "co1100";
				} else {
					view = viewNM.split("/")[1];
				}
				
				UserInfo vo = (UserInfo) request.getSession(false).getAttribute("User");
				param.put("SYS_ID", "HCNC");
				param.put("USER_ID", vo.getUSER_ID());
				param.put("MENU_ID", view);
				param.put("USER_IP", vo.getUSER_IP());
				param.put("HOST_NM", InetAddress.getLocalHost().getHostName());
				param.put("DEPT_CD", vo.getDEPT_CD());
				
				commonService.insertMenuLog(param);
			}
		}
	}
	
	private boolean isAjaxRequest(HttpServletRequest req) {
		
		if ("true".equals(req.getHeader("AJAX"))){
			return true;
		}
		else{
			return false;
		}
	}
}