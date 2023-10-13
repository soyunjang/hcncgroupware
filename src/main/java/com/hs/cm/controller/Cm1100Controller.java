package com.hs.cm.controller;

import com.hs.cm.service.Cm1100Service;
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
public class Cm1100Controller {
	
	@Autowired
	private Cm1100Service cm1100Service;

	@ModelAttribute("User")
	public UserInfo userInfo(HttpSession session) {
		return (UserInfo) session.getAttribute("User");
	}

	/**
   	 * 메소드 설명 : 부서관리 페이지로 이동
   	 * -------------------------------------------------------------------
   	 * @return	String 	result	부서-사용자관리마스터 페이지ID
   	 */
	@RequestMapping(value = "/cm1100")
	public String cm1100(){
		return "CM/CM1100";
	}
	
	/**
   	 * 메소드 설명 : 부서 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (부서명)
   	 * @return	List	list	부서-사용자 목록
   	 */
	@ResponseBody
	@RequestMapping(value = "/cm1100Sel")
	public List<Map<String, Object>> cm1100_SELECT(@RequestBody Map<String, Object> param) {
		return cm1100Service.cm1100Sel(param);
	}
	
	/**
   	 * 메소드 설명 : 부서코드 중복확인
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (법인코드/사용자ID)
   	 * @return	List	list	중복 갯수
   	 */
	@ResponseBody
	@RequestMapping(value = "/cm1100Verification")
	public List<Map<String, Object>> cm1100Varification(@RequestBody Map<String, Object> param){
		return cm1100Service.cm1100Verification(param);
	}
	
	/**
   	 * 메소드 설명 : 부서정보 저장
   	 * -------------------------------------------------------------------
   	 * @param	Map			param		추가할 정보(법인코드/부서코드/사번/사용자명/직급코드/직무내용/재직여부/사용유무/전화번호/이메일/비고)
   	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
   	 */
	@ResponseBody
	@RequestMapping(value = "/cm1100Save")
	public Map<String, Object> cm1100Save(@RequestBody Map<String, Object> param, @ModelAttribute("User") UserInfo user) {
		
		Map<String, Object> rtnMap = new HashMap<>();
		
		try {
			rtnMap = cm1100Service.cm1100Save(param, user);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
		
		return rtnMap;
	}
}