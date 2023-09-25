package com.hs.cm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hs.cm.service.CM1500Service;

@Controller
public class CM1500Controller {
	
	@Resource(name="cm1500Service")
	private CM1500Service cm1500Service;


	/**
   	 * 메소드 설명 : 카드관리 페이지로 이동
   	 * -------------------------------------------------------------------
   	 * @return	String 	result	카드관리 페이지ID
   	 */
	@RequestMapping(value = "/cm1500")
	public String cm1500() {
		return "CM/CM1500";
	}

	/**
   	 * 메소드 설명 : 카드목록 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (지점구분, 카드사, 카드번호, 사용자)
   	 * @return	List	list	카드 목록
   	 */
	@RequestMapping(value = "/cm1500Sel")
	public @ResponseBody List < HashMap<String, Object>> cm1500Sel(@RequestBody Map<String, Object> param){
		return cm1500Service.cm1500Sel(param);
	}

	/**
   	 * 메소드 설명 : 사용자 조회(팝업)
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (사용자명)
   	 * @return	List	list	사용자 목록
   	 */
	@RequestMapping(value = "/cm1500UserSel")
	public @ResponseBody List < HashMap<String, Object>> cm1500UserSel(@RequestBody Map<String, Object> param){
		return cm1500Service.cm1500UserSel(param);
	}

	/**
   	 * 메소드 설명 : 카드정보 저장
   	 * -------------------------------------------------------------------
   	 * @param	Map			param		추가할 정보(사업장/사용자ID/카드사/카드번호/CVS/한도금액/유효기간/발급일자/지급일자/회수일자/비고)
   	 * @param	HttpSession	session		로그인한 사용자ID
   	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
   	 */
	@RequestMapping(value = "/cm1500Save")
	public @ResponseBody Map<String, Object> cm1500Save(@RequestBody Map<String, Object> param, HttpSession session){
		
		Map <String, Object> rtnMap = new HashMap<>();
		
		try {
			rtnMap = cm1500Service.cm1500Save(param, session);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
		
		return rtnMap;
	}
}