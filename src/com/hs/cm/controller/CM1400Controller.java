package com.hs.cm.controller;

import com.hs.cm.service.CM1400Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CM1400Controller {
	
	@Autowired
	private CM1400Service cm1400Service;

	/**
   	 * 메소드 설명 : 메뉴마스터관리 페이지로 이동
   	 * -------------------------------------------------------------------
   	 * @return	String 	result	메뉴마스터관리 페이지ID
   	 */
	@RequestMapping(value = "/cm1400")
	public String cm1400() {
		return "CM/CM1400";
	}

	/**
   	 * 메소드 설명 : 메뉴마스터목록 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (법인코드명/메뉴ID/메뉴명/메뉴유형/프로그램ID/프로그램경로/사용유무)
   	 * @return	List	list	시스템코드 목록
   	 */
	@ResponseBody
	@RequestMapping(value = "/cm1400Sel")
	public List<Map <String, Object>> CM1400_SELECT(@RequestBody Map<String, Object> param) {
		return cm1400Service.cm1400Sel(param);
	}

	/**
   	 * 메소드 설명 : 메뉴마스터정보 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (메뉴ID/법인코드명)
   	 * @return	List	list	시스템코드 목록
   	 */
	@ResponseBody
	@RequestMapping(value = "/cm1400Save")
	public List<Map <String, Object>> cm1400Save(@RequestBody Map<String, Object> param, HttpSession session) {
		return cm1400Service.cm1400Save(param, session);
	}

	/**
   	 * 메소드 설명 : 메뉴ID 중복확인
   	 * -------------------------------------------------------------------
   	 * @param	Map	 param	검색조건 (메뉴ID/법인코드명)
   	 * @return	List map	중복 갯수
   	 */
	@ResponseBody
	@RequestMapping(value = "/cm1400Verification")
	public List<Map <String, Object>> cm1400Verification(@RequestBody Map<String, Object> param) {
		return cm1400Service.cm1400Verification(param);
	}

	/**
   	 * 메소드 설명 : 메뉴마스터 추가
   	 * -------------------------------------------------------------------
   	 * @param	Map			param		추가할 정보(법인코드/메뉴ID/메뉴유형/메뉴명/메뉴설명/프로그램ID/프로그램경로/사용유무/비고)
   	 * @param	HttpSession	session		로그인한 사용자ID
   	 * @return	HashMap		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
   	 */
	@ResponseBody
	@RequestMapping(value = "/cm1400DetailSave")
	public HashMap<String, Object> cm1400DetailSave(@RequestBody Map<String, Object> param, HttpSession session) {
		return cm1400Service.cm1400DetailSave(param, session);
	}
}