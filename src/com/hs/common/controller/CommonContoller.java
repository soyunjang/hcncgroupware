package com.hs.common.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hs.common.service.CommonService;
import com.hs.home.controller.UserInfo;

@Controller
public class CommonContoller {

	private static final Logger logger = LoggerFactory.getLogger(CommonContoller.class);

	@Resource(name="commonService")
	private CommonService commonService;
	
	/* 공지사항 테스트 페이지로 이동 */
	@RequestMapping(value = "/common")
	public String main(Locale locale, Model model, HttpSession session){
		
		return "sample/common";
	}
	
	/* 다국어 조회 */
	@RequestMapping(value = "/getLangCode")
	public @ResponseBody List<Map<String, Object>> getLangCode(@RequestBody Map<String, Object> param){
		
		List<Map<String, Object>> rtnList = commonService.getLangCode(param);
		return rtnList;
	}
	
	/* 공통코드 조회 */
	@RequestMapping(value = "/getCommonCode")
	public @ResponseBody List<Map<String, Object>> getCommonCode(@RequestBody Map<String, Object> param){
		
		List<Map<String, Object>> rtnList = commonService.getCommonCode(param);
		return rtnList;
	}

	/* 공통코드 조회(SORT) */
	@RequestMapping(value = "/getCommonCodeEsc")
	public @ResponseBody List<Map<String, Object>> getCommonCodeEsc(@RequestBody Map<String, Object> param){
		
		List<Map<String, Object>> rtnList = commonService.getCommonCodeEsc(param);
		return rtnList;
	}

	/* 사용자별 카드정보 조회 */
	@RequestMapping(value = "/getCommonCodeCard")
	public @ResponseBody List<Map<String, Object>> getCommonCodeCard(@RequestBody Map<String, Object> param, HttpSession session){

		List<Map<String, Object>> rtnList = commonService.getCommonCodeCard(param, session);
		return rtnList;
	}

	/* 권한분류 조회 */
	@RequestMapping(value = "/getAuthCode")
	public @ResponseBody List<Map<String, Object>> getAuthCode() {
		
		List<Map<String, Object>> list = commonService.getAuthCode();
		return list;
	}

	@RequestMapping(value = "/insertExceptionLog")
	public void insertExceptionLog(@RequestBody Map<String, Object> param, HttpServletRequest request, Exception ex){
		
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
	}
	
	@RequestMapping(value = "/insertAuthChange")
	public void insertAuthChange(@RequestBody Map<String, Object> param, HttpServletRequest request) throws UnknownHostException{

		HttpSession session = request.getSession(false);
		
		if(session.getAttribute("User") != null) {
			UserInfo vo = (UserInfo) request.getSession(false).getAttribute("User");
			param.put("USER_ID", vo.getUSER_ID());
			param.put("USER_IP", vo.getUSER_IP());
			param.put("HOST_NM", InetAddress.getLocalHost().getHostName());
			param.put("DEPT_CD", vo.getDEPT_CD());
			logger.debug("CommonContoller > insertAuthChange :: {}", param);
			
			commonService.insertAuthChange(param);
		}
	}	

	/* 시스템코드 목록 */
	@RequestMapping(value = "/selectLists")
	public @ResponseBody List<Map<String, Object>> selectLists(@RequestParam Map<String, Object> params) {
		logger.debug("CommonController >> selectLists :: {}", params);

		List<Map<String, Object>> list = commonService.selectLists(params);
		return list;
	}

	@RequestMapping(value = "/selectSalesNum")
	public @ResponseBody List<Map<String, Object>> selectSalesNum(@RequestParam Map<String, Object> params, HttpSession session) {
		logger.debug("CommonController >> selectSalesNum :: {}", params);

		List<Map<String, Object>> list = commonService.selectSalesNum(params, session);
		return list;
	}
}