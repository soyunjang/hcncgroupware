package com.hs.an.controller;

import com.hs.an.dto.An1000PrintDto;
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
import java.util.Map;

@Controller
public class AN1000Controller {

	@Resource(name="an1000Service")
	private AN1000Service an1000Service;

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	/**
   	 * 메소드 설명 : 연차등록 페이지로 이동
   	 */
	@RequestMapping(value = "/an1000", method = RequestMethod.GET)
	public String an1000(Model model, HttpSession session) {

		UserInfo user = (UserInfo) session.getAttribute("User");

		model.addAttribute("Holiday", an1000Service.an1000InfoSel(user));
		model.addAttribute("HolidayOffice", an1000Service.an1000HolidayOfficeSel());
		model.addAttribute("Count", an1000Service.an1000HolidayOfficeByUser(user));

		return "AN/AN1000";
	}


	/**
	 *
	 * @return
	 */
	@RequestMapping(value = "/an1000/print", method = RequestMethod.POST)
	public String an1000_print(An1000PrintDto dto, Model model, HttpSession session) {

		UserInfo user = (UserInfo) session.getAttribute("User");

		model.addAttribute("HolidayPrintInfo", an1000Service.an1000PrintByUser(dto, user));

		return "AN/AN1000Print";
	}


	/**
	 * 메소드 설명 : 연차신청내역 조회
	 * @param param :	검색조건
	 * @return 휴가 신청 내역
	 */
	@ResponseBody
	@RequestMapping(value = "/an1000Sel")
	public List<Map<String, Object>> an1000_SEL(@RequestBody Map<String, Object> param, HttpSession session) {

		UserInfo user = (UserInfo) session.getAttribute("User");

		return an1000Service.an1000Sel(param, user);
	}

	/**
	 * 휴가 등록
	 * @param param : 휴가 등록 정보
	 * @return : 휴가 신청 내역
	 */
	@ResponseBody
	@RequestMapping(value = "/an1000", method = RequestMethod.POST)
	public List<Map<String, Object>> an1000_save(@RequestBody Map<String, Object> param, HttpSession session) {

		UserInfo user = (UserInfo) session.getAttribute("User");

		an1000Service.an1000Save(param, user);

		return an1000Service.an1000Sel(param, user);
	}

	/**
	 * 휴가 취소
	 * @param param : 휴가 취소 정소
	 * @return : 휴가 신청 내역
	 */
	@ResponseBody
	@RequestMapping(value = "/an1000", method = RequestMethod.PATCH)
	public List<Map<String, Object>> an1000_update(@RequestBody Map<String, Object> param, HttpSession session) {

		UserInfo user = (UserInfo) session.getAttribute("User");

		an1000Service.an1000Update(param, user);

		return an1000Service.an1000Sel(param, user);
	}

	/**
	 * 휴가일수, 사용일수, 잔여일수, 공제일수 요청
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/an1000/holidayInfo", method = RequestMethod.GET)
	public Map<String, Object> an1000_holidayInfoSel(HttpSession session) {
		UserInfo user = (UserInfo) session.getAttribute("User");
		return an1000Service.an1000InfoSel(user);
	}

	/**
	 * 공휴일 조회
	 * @param startDate : 휴가 시작일
	 * @param endDate : 휴가 종료일
	 * @return 휴가 시작일 ~ 휴가 종료일 기준 공휴일 List return
	 */
	@ResponseBody
	@RequestMapping(value = "/an1000/publicHoliday", method = RequestMethod.GET)
	public List publicHolidayApi(String startDate, String endDate) {
		return an1000Service.an1000PublicHolidaySel(startDate, endDate);
	}

}
