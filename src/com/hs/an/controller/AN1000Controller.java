package com.hs.an.controller;

import com.hs.an.service.AN1000Service;
import com.hs.home.controller.UserInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller
public class AN1000Controller {

	@Resource(name="an1000Service")
	private AN1000Service an1000Service;

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	/**
   	 * 메소드 설명 : 연차등록 페이지로 이동
   	 * -------------------------------------------------------------------
   	 * @param	Locale	locale
   	 * @param	Model 	model
   	 * @return	String 	result	연차등록 페이지ID
   	 */
	@RequestMapping(value = "/an1000", method = RequestMethod.GET)
	public String an1000(Locale locale, Model model, HttpSession session) {

		UserInfo user = (UserInfo) session.getAttribute("User");

		// 사용자 연차정보 조회
		Map<String,Object> holidayInfo = an1000Service.an1000InfoSel(user);

		model.addAttribute("Holiday", holidayInfo);

		return "AN/AN1000";
	}

	/**
	 * 메소드 설명 : 연차신청내역 조회
	 * -------------------------------------------------------------------
	 * @param	Map		param	검색조건
	 * @return	List	list	연차신청 목록
	 */
	@RequestMapping(value = "/an1000Sel")
	public @ResponseBody List<Map<String, Object>> AN1000_SEL(@RequestBody Map<String, Object> param, HttpSession session) {

		UserInfo user = (UserInfo) session.getAttribute("User");

		List<Map<String, Object>> list = an1000Service.an1000Sel(param, user);

		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/an1000", method = RequestMethod.POST)
	public String an1000_save(@RequestBody Map<String, Object> param, HttpSession session) {

		UserInfo user = (UserInfo) session.getAttribute("User");

		an1000Service.an1000Save(param, user);

		return null;
	}

	@ResponseBody
	@RequestMapping(value = "/an1000", method = RequestMethod.DELETE)
	public String an1000_delete(@RequestBody Map<String, Object> param, HttpSession session) {

		logger.info("들어오니??");

		return null;
	}

}
