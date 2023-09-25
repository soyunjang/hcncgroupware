package com.hs.cm.controller;

import com.hs.cm.service.CM1300Service;
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
public class CM1300Controller {

	@Autowired
	private CM1300Service cm1300Service;
	
	/**
   	 * 메소드 설명 : 권한그룹관리 페이지로 이동
   	 * -------------------------------------------------------------------
   	 * @return	String 	result	권한그룹관리 페이지ID
   	 */
	@RequestMapping(value = "/cm1300")
	public String cm1300() {
		return "CM/CM1300";
	}
	
	/**
   	 * 메소드 설명 : 권한분류코드 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (권한분류명/사용유무)
   	 * @return	List	list	권한분류코드 목록
   	 */
	@ResponseBody
	@RequestMapping(value = "/cm1300HeadSel")
	public List<Map<String, Object>> cm1300HeadSel(@RequestBody Map<String, Object> param) {
		return cm1300Service.cm1300HeadSel(param);
	}

	/**
   	 * 메소드 설명 : 세부코드 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (권한분류명/사용유무)
   	 * @return	List	list	세부코드 목록
   	 */
	@ResponseBody
	@RequestMapping(value = "/cm1300DetailSel")
	public List<Map<String, Object>> cm1300DetailSel(@RequestBody Map<String, Object> param) {
		return cm1300Service.cm1300DetailSel(param);
	}
	
	/**
   	 * 메소드 설명 : 권한분류코드 중복확인
   	 * -------------------------------------------------------------------
   	 * @param	Map	param	검색조건 (권한분류코드)
   	 * @return	Map map		중복 갯수
   	 */
	@ResponseBody
	@RequestMapping(value = "/cm1300HeadCnt")
	public Map<String, Object> cm1300HeadCnt(@RequestBody Map<String, Object> param) {
		
		Map<String, Object> rtnMap = new HashMap<>();
		rtnMap.put("cnt", cm1300Service.cm1300HeadCnt(param).get("CNT"));
		return rtnMap;
	}
	
	/**
   	 * 메소드 설명 : 세부코드 중복확인
   	 * -------------------------------------------------------------------
   	 * @param	List	param	검색조건 (권한분류코드/메뉴ID/기능분류코드(버튼코드)
   	 * @return	Map 	map		중복 갯수
   	 */
	@ResponseBody
	@RequestMapping(value = "/cm1300DetailCnt")
	public Map<String, Object> cm1300DetailCnt(@RequestBody List<Map<String, Object>> param) {
		
		Map<String, Object> rtnMap = new HashMap<>();
		
		try {
			for(int i=0;i<param.size();i++) {
				if(Integer.parseInt(cm1300Service.cm1300DetailCnt(param.get(i)).get("CNT").toString()) == 1) {
					rtnMap.put("cnt", 1);
					return rtnMap;
				}
			}
			rtnMap.put("param", param);
		} catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
		
		return rtnMap;
	}

	/**
   	 * 메소드 설명 : 메뉴목록 조회(팝업)
   	 * -------------------------------------------------------------------
   	 * @param	Map			param	검색조건 (메뉴명/사용유무/법인코드)
   	 * @param	HttpSession	session	로그인한 사용자ID
   	 * @return	List		list	메뉴 목록
   	 */
	@ResponseBody
	@RequestMapping(value = "/cm1300PopMenuSel")
	public List<Map<String, Object>> cm1300PopMenuSel(@RequestBody Map<String, Object> param, HttpSession session) {
		return cm1300Service.cm1300PopMenuSel(param, session);
	}

	/**
   	 * 메소드 설명 : 버튼목록 조회(팝업)
   	 * -------------------------------------------------------------------
   	 * @param	Map			param	검색조건 (권한분류코드/메뉴ID/사용유무)
   	 * @return	List		list	메뉴 목록
   	 */
	@ResponseBody
	@RequestMapping(value = "/cm1300PopButtonSel")
	public List<Map<String, Object>> cm1300PopButtonSel(@RequestBody Map<String, Object> param) {
		return cm1300Service.cm1300PopButtonSel(param);
	}	

	/**
   	 * 메소드 설명 : 권한분류코드 추가
   	 * -------------------------------------------------------------------
   	 * @param	List		param		추가할 정보(권한분류코드/권한분류명/사용유무/비고)
   	 * @param	HttpSession	session		로그인한 사용자ID
   	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
   	 */
	@ResponseBody
	@RequestMapping(value = "/cm1300HeadSave")
	public Map<String, Object> cm1300HeadSave(@RequestBody Map<String, Object> param, HttpSession session) {
		
		Map<String, Object> rtnMap = new HashMap<>();
		
		try {
			rtnMap = cm1300Service.cm1300HeadSave(param, session);
		} catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
		
		return rtnMap;
	}

	/**
   	 * 메소드 설명 : 세부코드 추가
   	 * -------------------------------------------------------------------
   	 * @param	List		param		추가할 정보(권한분류코드/메뉴ID/메뉴명/기능분류코드/기능분류명/사용유무/비고)
   	 * @param	HttpSession	session		로그인한 사용자ID
   	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
   	 */
	@ResponseBody
	@RequestMapping(value = "/cm1300DetailSave")
	public Map<String, Object> cm1300DetailSave(@RequestBody List<Map<String, Object>> param, HttpSession session) {
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		try {
			rtnMap = cm1300Service.cm1300DetailSave(param, session);
		} catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
		
		return rtnMap;
	}
}