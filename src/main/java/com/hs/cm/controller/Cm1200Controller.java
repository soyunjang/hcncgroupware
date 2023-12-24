package com.hs.cm.controller;

import com.hs.cm.service.Cm1200Service;
import com.hs.home.controller.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class Cm1200Controller {

	@Autowired
	private Cm1200Service cm1200Service;

	@ModelAttribute("User")
	public UserInfo userInfo(HttpSession session) {
		return (UserInfo) session.getAttribute("User");
	}

	/**
   	 * 메소드 설명 : 사용자관리마스터 페이지로 이동
   	 * -------------------------------------------------------------------
   	 * @return	String 	result	사용자관리마스터 페이지ID
   	 */
	@RequestMapping(value = "/cm1200")
	public String cm1200() {
		return "CM/CM1200";
	}
	
	/**
   	 * 메소드 설명 : 사용자정보 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (사용자ID/사용자명)
   	 * @return	List	list	사용자정보 목록
   	 */
	@ResponseBody
	@RequestMapping(value = "/cm1200Sel")
	public List<Map<String, Object>> CM1200_SEL(@RequestBody Map<String, Object> param) {
		return cm1200Service.cm1200Sel(param);
	}
	
	/**
   	 * 메소드 설명 : 부서-사용자정보 조회(팝업)
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (법인코드/부서코드)
   	 * @return	List	list	부서-사용자정보 목록
   	 */
	@ResponseBody
	@RequestMapping(value = "/cm1200DeptSel")
	public List<HashMap<String, Object>> CM1200_DEPT_SEL(@RequestBody Map<String, Object> param) {
		return cm1200Service.cm1200DeptSel(param);
	}
	
	/**
   	 * 메소드 설명 : 권한그룹 조회(팝업)
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (권한코드)
   	 * @return	List	list	권한그룹 목록
   	 */
	@ResponseBody
	@RequestMapping(value = "/cm1200AuthSel")
	public  List<HashMap<String, Object>> CM1200_AUTH_SEL(@RequestBody Map<String, Object> param) {
		return cm1200Service.cm1200AuthSel(param);
	}

	/**
   	 * 메소드 설명 : 사용자ID 중복확인
   	 * -------------------------------------------------------------------
   	 * @param	Map	 param	검색조건 (사용자ID)
   	 * @return	List list	중복 갯수
   	 */
	@ResponseBody
	@RequestMapping(value = "/cm1200Verification")
	public List<Map<String, Object>> cm1200Varification(@RequestBody Map<String, Object> param){
		return cm1200Service.cm1200Verification(param);
	}
	
	/**
   	 * 메소드 설명 : 사용자정보 저장
   	 * -------------------------------------------------------------------
   	 * @param	Map			param		추가할 정보(법인코드/사번/사용자ID/비밀번호/부서코드/권한적용일/권한만료일/권한코드/사용유무/비고)
   	 * @param	HttpSession	session		로그인한 사용자ID
   	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
   	 */
	@ResponseBody
	@RequestMapping(value = "/cm1200Save")
	public  Map<String, Object> CM1200_SAVE(@RequestBody Map<String, Object> param, @ModelAttribute("User") UserInfo user) {
		
		Map<String, Object> rtnMap = new HashMap<>();

		try {
			rtnMap = cm1200Service.cm1200Save(param, user);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
		
		return rtnMap;
	}

	/**
	 * 메소드 설명 : 사용자정보 삭제
	 * -------------------------------------------------------------------
	 * @param	Map			param		추가할 정보(법인코드/사번/사용자ID/비밀번호/부서코드/권한적용일/권한만료일/권한코드/사용유무/비고)
	 * @param	HttpSession	session		로그인한 사용자ID
	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
	 */
	@ResponseBody
	@RequestMapping(value = "/cm1200Delete")
	public  Map<String, Object> CM1200_DELETE(@RequestBody Map<String, Object> param, @ModelAttribute("User") UserInfo user) {

		Map<String, Object> rtnMap = new HashMap<>();

		try {
			rtnMap = cm1200Service.cm1200Delete(param, user);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}

		return rtnMap;
	}
}