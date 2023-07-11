package com.hs.cm.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.hs.cm.service.CM1600Service;

@Controller
public class CM1600Controller {
	
	@Resource(name="cm1600Service")
	private CM1600Service cm1600Service;
	
	private static final Logger logger = LoggerFactory.getLogger(CM1600Controller.class);

	/**
   	 * 메소드 설명 : 메시지관리 페이지로 이동
   	 * -------------------------------------------------------------------
   	 * @param	Locale	locale 	
   	 * @param	Model 	model 	
   	 * @return	String 	result	메시지관리 페이지ID
   	 */
	@RequestMapping(value = "/cm1600")
	public String cm1600(Locale locale, Model model) {
		return "CM/CM1600";
	}

	/**
   	 * 메소드 설명 : 메시지관리 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (한글명/영문명/중문명)
   	 * @return	List	list	메시지관리 목록
   	 */
	@RequestMapping(value = "/cm1600HeadSel")
	public @ResponseBody List<Map <String, Object>> CM1600_HeadSel(@RequestBody Map<String, Object> param) {
		
		List<Map<String,Object>> list = cm1600Service.cm1600HeadSel(param);
		return list;
	}

	/**
   	 * 메소드 설명 : 메시지 추가
   	 * -------------------------------------------------------------------
   	 * @param	Map			param		추가할 정보(순번/구분/고유ID/한글명/영문명/중문명/사용유무/비고)
   	 * @param	HttpSession	session		로그인한 사용자ID
   	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
   	 */
	@RequestMapping(value = "/cm1600HeadSave")
	public @ResponseBody Map <String, Object> cm1600HeadSave(@RequestBody Map<String, Object> param, HttpSession session) {
		
		Map <String, Object> rtnMap = new HashMap<String, Object>();
		
		try {
			rtnMap = cm1600Service.cm1600HeadSave(param, session);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
		return rtnMap;
	}
}