package com.hs.co.controller;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.hs.home.controller.UserInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hs.co.service.CO1000Service;

@Controller
public class CO1000Controller {
	
	@Resource(name="co1000Service")
	private CO1000Service co1000Service;
	
	private static final Logger logger = LoggerFactory.getLogger(CO1000Controller.class);

	@ModelAttribute("User")
	public UserInfo userInfo(HttpSession session) {
		return (UserInfo) session.getAttribute("User");
	}

	/**
   	 * 메소드 설명 : 판매품의서관리 페이지로 이동
   	 * -------------------------------------------------------------------
   	 * @param	Locale	locale 	
   	 * @param	Model 	model 	
   	 * @return	String 	result	판매품의서관리 페이지ID
   	 */
	@RequestMapping(value = "/co1000", method = RequestMethod.GET)
	public String co1000() {
		return "CO/CO1000";
	}

	/**
   	 * 메소드 설명 : 카드사별 사용내역 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (파일명)
   	 * @return	List	list	카드사별 사용내역 목록
   	 */
	@ResponseBody
	@RequestMapping(value = "/co1000SelTemp")
	public List<Map<String, Object>> CO1000_SEL_TEMP(@RequestBody Map<String, Object> param) {
		return co1000Service.co1000SelTemp(param);
	}
	
	@RequestMapping(value = "/co1000MergeData", method = RequestMethod.POST)
	public String co1000MergeData(final MultipartHttpServletRequest multiRequest,
								  @RequestParam Map<String, Object> param, ModelMap model,
								  @ModelAttribute("User") UserInfo user) {
		logger.debug("PopupController > co1000MergeData :: {}", param);

		MultipartFile file = null;
      	Iterator<String> iterator = multiRequest.getFileNames();
        
      	if(iterator.hasNext()) {
            file = multiRequest.getFile(iterator.next());
        }
        
        int insertCnt = co1000Service.co1000MergeData(file, param, user);
		model.addAttribute("insertCnt", insertCnt);
		return "jsonView";
	}

	@RequestMapping(value = "/co1000MergeDataSave", method = RequestMethod.POST)
	public String co1000MergeDataSave(final MultipartHttpServletRequest multiRequest,
									  @RequestParam Map<String, Object> param, ModelMap model,
									  @ModelAttribute("User") UserInfo user) {
		logger.debug("PopupController > co1000MergeDataSave :: {}", param);

		param.put("USER_ID", user.getUSER_ID());

		MultipartFile file = null;
		Iterator<String> iterator = multiRequest.getFileNames();

		if(iterator.hasNext()) {
			file = multiRequest.getFile(iterator.next());
		}

		int insertCnt = co1000Service.co1000MergeDataSave(file, param);
		model.addAttribute("insertCnt", insertCnt);
		return "jsonView";
	}

	/**
	 * 메소드 설명 : 카드별 사용내역 저장
	 * -------------------------------------------------------------------
	 * @param	Map			param		추가할 정보(카드사/카드번호/사용일자/거래처/승인금액/취소금액)
	 * @param	HttpSession	session		로그인한 사용자ID
	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
	 */

	@ResponseBody
	@RequestMapping(value = "/co1000Delete", method = RequestMethod.POST)
	public Map<String, Object> CO1000_DELETE(@RequestBody Map<String, Object> param, @ModelAttribute("User") UserInfo user) {

		Map<String, Object> rtnMap = new HashMap<>();
		param.put("USER_ID", user.getUSER_ID());
		try {
			rtnMap = co1000Service.co1000Delete(param);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}

		return rtnMap;
	}

	@ResponseBody
	@RequestMapping(value = "/co1000/selects", method = RequestMethod.GET)
	public List<Map<String, Object>> co1000SelectTagGet(@ModelAttribute("User") UserInfo user) {
		return co1000Service.co1000SelectTagGet(user);
	}

	@ResponseBody
	@RequestMapping(value = "/co1000/select", method = RequestMethod.POST)
	public List<Map<String, Object>> co1000SelectGet(@RequestBody Map<String, Object> param, @ModelAttribute("User") UserInfo user) {
		return co1000Service.co1000SelectGet(param, user);
	}

	@ResponseBody
	@RequestMapping(value = "/co1000/select", method = RequestMethod.DELETE)
	public Map<String, Object> co1000SelectDelete(@RequestBody Map<String, Object> param, @ModelAttribute("User") UserInfo user) {
		return co1000Service.co1000SelectDelete(param, user);
	}
}
