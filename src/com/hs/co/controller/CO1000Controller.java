package com.hs.co.controller;

import com.hs.co.service.CO1000Service;
import com.hs.home.controller.UserInfo;
import com.hs.util.Message;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import static com.hs.util.ResponseHttpHeaders.responseHeader;

@Slf4j
@Controller
public class CO1000Controller {
	
	@Autowired
	private CO1000Service co1000Service;
	
	@ModelAttribute("User")
	public UserInfo userInfo(HttpSession session) {
		return (UserInfo) session.getAttribute("User");
	}

	/**
   	 * 메소드 설명 : 판매품의서관리 페이지로 이동
   	 * -------------------------------------------------------------------
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
								  @ModelAttribute("User") UserInfo user,
								  Model model) {

		MultipartFile file = null;
      	Iterator<String> iterator = multiRequest.getFileNames();
        
      	if(iterator.hasNext()) {
            file = multiRequest.getFile(iterator.next());
        }

		model.addAttribute("insertCnt", co1000Service.co1000MergeData(file, user));
		return "jsonView";
	}

	@RequestMapping(value = "/co1000MergeDataSave", method = RequestMethod.POST)
	public String co1000MergeDataSave(@RequestParam Map<String, Object> param,
									  @ModelAttribute("User") UserInfo user,
									  Model model) {
		param.put("USER_ID", user.getUSER_ID());

		model.addAttribute("insertCnt", co1000Service.co1000MergeDataSave(param));
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
	public Map<String, Object> CO1000_DELETE(@RequestBody Map<String, Object> param,
											 @ModelAttribute("User") UserInfo user) {
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
	public ResponseEntity co1000SelectTagGet(@ModelAttribute("User") UserInfo user) {
		try {
			return new ResponseEntity<>(co1000Service.co1000SelectTagGet(user), HttpStatus.OK);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new ResponseEntity<>(Message.BAD_REQUEST, responseHeader(), HttpStatus.BAD_REQUEST);
		}
	}

	@ResponseBody
	@RequestMapping(value = "/co1000/select", method = RequestMethod.POST)
	public ResponseEntity co1000SelectGet(@RequestBody Map<String, Object> param, @ModelAttribute("User") UserInfo user) {
		try {
			return new ResponseEntity<>(co1000Service.co1000SelectGet(param, user), HttpStatus.OK);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new ResponseEntity<>(Message.BAD_REQUEST, responseHeader(), HttpStatus.BAD_REQUEST);
		}
	}

	@ResponseBody
	@RequestMapping(value = "/co1000/select", method = RequestMethod.DELETE)
	public ResponseEntity co1000SelectDelete(@RequestBody Map<String, Object> param, @ModelAttribute("User") UserInfo user) {
		try {
			return new ResponseEntity<>(co1000Service.co1000SelectDelete(param, user), HttpStatus.OK) ;
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new ResponseEntity<>(Message.BAD_REQUEST, responseHeader(), HttpStatus.BAD_REQUEST);
		}
	}
}
