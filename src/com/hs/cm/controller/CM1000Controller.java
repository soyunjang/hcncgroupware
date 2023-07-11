package com.hs.cm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hs.cm.service.CM1000Service;

@Controller
public class CM1000Controller {
	
	@Resource(name="cm1000Service")
	private CM1000Service cm1000Service;
	
	private static final Logger logger = LoggerFactory.getLogger(CM1000Controller.class);
	
	/**
   	 * 메소드 설명 : 공통코드관리 페이지로 이동
   	 * -------------------------------------------------------------------
   	 * @param	Locale	locale 	
   	 * @param	Model 	model 	
   	 * @return	String 	result	공통코드관리 페이지ID
   	 */
	@RequestMapping(value = "/cm1000")
	public String cm1000(Locale locale, Model model){
		return "CM/CM1000";
	}

	/**
   	 * 메소드 설명 : 시스템코드 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (시스템코드/시스템명/사용유무)
   	 * @return	List	list	시스템코드 목록
   	 */
	@RequestMapping(value = "/cm1000HeadSel")
	public @ResponseBody List<Map<String, Object>> cm1000HeadSel(@RequestBody Map<String, Object> param) {

		List<Map<String,Object>> list = cm1000Service.cm1000HeadSel(param);
		return list;
	}

	/**
   	 * 메소드 설명 : 세부코드 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (시스템코드/사용유무)
   	 * @return	List 	list	세부코드 목록
   	 */
	@RequestMapping(value = "/cm1000DetailSel")
	public @ResponseBody List<Map<String, Object>> cm1000DetailSel(@RequestBody Map<String, Object> param) {
		
		List<Map<String,Object>> list = cm1000Service.cm1000DetailSel(param);
		return list;
	}

	/**
   	 * 메소드 설명 : 시스템코드 중복확인
   	 * -------------------------------------------------------------------
   	 * @param	Map	param	검색조건 (시스템코드)
   	 * @return	Map map		중복 갯수
   	 */
	@RequestMapping(value = "/cm1000HeadCnt")
	public @ResponseBody Map<String, Object> cm1000HeadCnt(@RequestBody Map<String, Object> param) {
		
		Map<String,Object> map = cm1000Service.cm1000HeadCnt(param);
		return map;
	}

	/**
   	 * 메소드 설명 : 세부코드 중복확인
   	 * -------------------------------------------------------------------
   	 * @param	Map	param	검색조건 (시스템코드/세부코드)
   	 * @return	Map map		중복 갯수
   	 */
	@RequestMapping(value = "/cm1000DetailCnt")
	public @ResponseBody Map<String, Object> cm1000DetailCnt(@RequestBody Map<String, Object> param) {
		
		Map<String,Object> map = cm1000Service.cm1000DetailCnt(param);
		return map;
	}

	/**
   	 * 메소드 설명 : 시스템코드 추가
   	 * -------------------------------------------------------------------
   	 * @param	Map			param		추가할 정보(시스템코드/시스템명/사용유무/비고)
   	 * @param	HttpSession	session		로그인한 사용자ID
   	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
   	 */
	@RequestMapping(value = "/cm1000HeadSave")
	public @ResponseBody Map<String, Object> cm1000HeadSave(@RequestBody Map<String, Object> param, HttpSession session) {
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		try {
			rtnMap = cm1000Service.cm1000HeadSave(param, session);
			System.out.println("cm1000HeadSave 성공/실패 여부 : " + rtnMap);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
		
		return rtnMap;
	}

	/**
   	 * 메소드 설명 : 세부코드 추가
   	 * -------------------------------------------------------------------
   	 * @param	Map			param		추가할 정보(시스템코드/세부코드/세부코드명/사용유무/비고)
   	 * @param	HttpSession	session		로그인한 사용자ID
   	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
   	 */
	@RequestMapping(value = "/cm1000DetailSave")
	public @ResponseBody Map<String, Object> cm1000DetailSave(@RequestBody Map<String, Object> param, HttpSession session) {
		
		Map <String, Object> rtnMap = new HashMap<String, Object>();
		
		try {
			rtnMap = cm1000Service.cm1000DetailSave(param, session);
			System.out.println("cm1000DetailSave 성공/실패 여부 : " + rtnMap);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
		
		return rtnMap;
	}
}