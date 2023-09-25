package com.hs.common.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerExceptionResolverComposite;

import com.hs.common.service.CommonService;
import com.hs.home.controller.UserInfo;

@Component
public class ExceptionHandler extends HandlerExceptionResolverComposite {
	
	@Resource(name="commonService")
	private CommonService commonService;
	
	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
		
		Map<String, Object> param = new HashMap<>();
		HttpSession session = request.getSession(false);
		
		if(session.getAttribute("User") != null) {
			UserInfo vo = (UserInfo) session.getAttribute("User"); 
			param.put("USER_ID", vo.getUSER_ID());
			param.put("USER_IP", vo.getUSER_IP());
			param.put("EVNT_CD", "임시에러코드");
			param.put("EVNT_NM", "임시에러명");
			param.put("EVNT_DETAIL", ex.getMessage());
			param.put("EVNT_SVRY", "임시이벤트심각도");
			param.put("PROG_NM", "");
			
			try {
				param.put("HOST_NM", InetAddress.getLocalHost().getHostName());
			} catch (UnknownHostException e) {
				e.printStackTrace();
			}
			
//			commonService.insertExceptionLog(param);
		}
		
		return super.resolveException(request, response, handler, ex);
	}
}