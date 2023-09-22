package com.hs.an.controller;

import com.hs.an.dto.An1000PrintDto;
import com.hs.an.service.AN1000Service;
import com.hs.home.controller.UserInfo;
import com.hs.util.Message;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/an1000")
public class AN1000Controller {

	@Autowired
	private AN1000Service an1000Service;
	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@ModelAttribute("User")
	public UserInfo userInfo(HttpSession session) {
		return (UserInfo) session.getAttribute("User");
	}

	/**
   	 * 메소드 설명 : 연차등록 페이지로 이동
   	 */
	@RequestMapping(method = RequestMethod.GET)
	public String an1000(Model model, @ModelAttribute("User") UserInfo user) {
		try {
			model.addAttribute("Holiday", an1000Service.an1000InfoSel(null, user));
			model.addAttribute("HolidayOffice", an1000Service.an1000HolidayOfficeSel());
			model.addAttribute("Count", an1000Service.an1000HolidayOfficeByUser(user));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return "AN/AN1000";
	}

	/**
	 * 휴가신청서 출력
	 */
	@RequestMapping(value = "/print", method = RequestMethod.POST)
	public String an1000_print(An1000PrintDto dto, Model model, @ModelAttribute("User") UserInfo user) {
		try {
			if (user == null) {
				return null;
			}
			model.addAttribute("HolidayPrintInfo", an1000Service.an1000PrintByUser(dto));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return "AN/AN1000Print";
	}

	/**
	 * 메소드 설명 : 연차신청내역 조회
	 * @param param :	검색조건
	 * @return 휴가 신청 내역
	 */
	@ResponseBody
	@RequestMapping(value = "/list")
	public ResponseEntity an1000_SEL(@RequestBody Map<String, Object> param, @ModelAttribute("User") UserInfo user) {
		try {
			if (user == null) {
				return new ResponseEntity<>(Message.BAD_REQUEST_USER, HttpStatus.BAD_REQUEST);
			}
			return new ResponseEntity<>(an1000Service.an1000Sel(param, user), HttpStatus.OK);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new ResponseEntity<>(Message.BAD_REQUEST, HttpStatus.BAD_REQUEST);
		}
	}

	/**
	 * 휴가 등록
	 * @param param : 휴가 등록 정보
	 * @return : 휴가 신청 내역
	 */
	@ResponseBody
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity an1000_save(@RequestBody Map<String, Object> param, @ModelAttribute("User") UserInfo user) {
		try {
			if (user == null) {
				return new ResponseEntity<>(Message.BAD_REQUEST_USER, HttpStatus.BAD_REQUEST);
			}
			an1000Service.an1000Save(param, user);
			return new ResponseEntity<>(an1000Service.an1000GetHolidayAfterSave(param), HttpStatus.OK);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new ResponseEntity<>(Message.BAD_REQUEST, HttpStatus.BAD_REQUEST);
		}
	}

	/**
	 * 휴가 취소
	 * @param param : 휴가 취소 정보
	 * @return : 휴가 신청 내역
	 */
	@ResponseBody
	@RequestMapping(method = RequestMethod.PATCH)
	public void an1000_update(@RequestBody Map<String, Object> param, @ModelAttribute("User") UserInfo user) {
		try {
			if (user == null) {
				return;
			}
			an1000Service.an1000Update(param, user);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}

	/**
	 * 휴가일수, 사용일수, 잔여일수, 공제일수 요청
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/holidayInfo", method = RequestMethod.GET)
	public ResponseEntity an1000_holidayInfoSel(@RequestParam(required = false) String targetId, @ModelAttribute("User") UserInfo user) {
		try {
			if (user == null) {
				return new ResponseEntity<>(Message.BAD_REQUEST_USER, HttpStatus.BAD_REQUEST);
			}
			return new ResponseEntity<>(an1000Service.an1000InfoSel(targetId, user), HttpStatus.OK);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new ResponseEntity(Message.BAD_REQUEST, HttpStatus.BAD_REQUEST);
		}
	}

	/**
	 * 공휴일 조회
	 * @param startDate : 휴가 시작일
	 * @param endDate : 휴가 종료일
	 * @return 휴가 시작일 ~ 휴가 종료일 기준 공휴일 List return
	 */
	@ResponseBody
	@RequestMapping(value = "/publicHoliday", method = RequestMethod.GET)
	public ResponseEntity publicHolidayApi(String startDate, String endDate, @ModelAttribute UserInfo user) {
		try {
			if (user == null) {
				return new ResponseEntity<>(Message.BAD_REQUEST_USER, HttpStatus.BAD_REQUEST);
			}
			return new ResponseEntity<>(an1000Service.an1000PublicHolidaySel(startDate, endDate), HttpStatus.OK);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new ResponseEntity<>(Message.BAD_REQUEST, HttpStatus.BAD_REQUEST);
		}
	}

	/**
	 * 메소드 설명 : 사용자정보 조회
	 */
	@ResponseBody
	@RequestMapping(value = "/SelUser")
	public ResponseEntity AN1000_SEL_USER(@RequestBody Map<String, Object> param, @ModelAttribute UserInfo user) {
		try {
			if (user == null) {
				return new ResponseEntity<>(Message.BAD_REQUEST_USER, HttpStatus.BAD_REQUEST);
			}
			return new ResponseEntity<>(an1000Service.an1000SelUser(param), HttpStatus.OK);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new ResponseEntity<>(Message.BAD_REQUEST, HttpStatus.BAD_REQUEST);
		}
	}

}
