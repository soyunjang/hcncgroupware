package com.hs.an.controller;

import com.hs.an.dto.An1000PrintDto;
import com.hs.an.service.An1000Service;
import com.hs.home.controller.UserInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/an1000")
public class An1000Controller {

    @Autowired
    private An1000Service an1000Service;

    @ModelAttribute("User")
    public UserInfo userInfo(HttpSession session) {
        return (UserInfo) session.getAttribute("User");
    }

    /**
     * 메소드 설명 : 연차등록 페이지로 이동
     */
    @RequestMapping(method = RequestMethod.GET)
    public String an1000(Model model, @ModelAttribute("User") UserInfo user) {
        model.addAttribute("Holiday", an1000Service.an1000InfoSel(null, user, null, null));
        model.addAttribute("HolidayOfficeInfo", an1000Service.an1000HolidayOfficeByUser(user));
        return "AN/AN1000";
    }

    /**
     * 휴가신청서 출력
     */
    @RequestMapping(value = "/print", method = RequestMethod.POST)
    public String an1000_print(An1000PrintDto dto, Model model, @ModelAttribute("User") UserInfo user) {
        model.addAttribute("HolidayPrintInfo", an1000Service.an1000PrintByUser(dto));
        return "AN/an1000Print";
    }

    /**
     * 메소드 설명 : 연차신청내역 조회
     *
     * @param param :	검색조건
     * @return 휴가 신청 내역
     */
    @ResponseBody
    @RequestMapping(value = "/list")
    public ResponseEntity an1000_SEL(@RequestBody Map<String, Object> param, @ModelAttribute("User") UserInfo user) {
        return new ResponseEntity<>(an1000Service.an1000Sel(param, user), HttpStatus.OK);
    }

    /**
     * 휴가 등록
     *
     * @param param : 휴가 등록 정보
     * @return : 휴가 신청 내역
     */
    @ResponseBody
    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity an1000_save(@RequestBody Map<String, Object> param, @ModelAttribute("User") UserInfo user) {
        an1000Service.an1000Save(param, user);
        return new ResponseEntity<>(an1000Service.an1000GetHolidayAfterSave(param), HttpStatus.OK);
    }

    /**
     * 휴가 수정
     *
     * @param param : 휴가 정보
     */
    @ResponseBody
    @RequestMapping(value="/updateHolidayInfo")
    public ResponseEntity an1000_updateHolidayInfo(@RequestBody Map<String, Object> param, @ModelAttribute("User") UserInfo user) {
        an1000Service.an1000UpdateHolidayInfo(param, user);
        return new ResponseEntity<>(an1000Service.an1000Sel(param, user), HttpStatus.OK);
    }

    /**
     * 휴가 취소
     *
     * @param param : 휴가 취소 정보
     */
    @ResponseBody
    @RequestMapping(method = RequestMethod.PATCH)
    public void an1000_update(@RequestBody Map<String, Object> param, @ModelAttribute("User") UserInfo user) {
        an1000Service.an1000Update(param, user);
    }

    /**
     * 휴가일수, 사용일수, 잔여일수, 공제일수 요청
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/holidayInfo", method = RequestMethod.GET)
    public ResponseEntity an1000_holidayInfoSel(@RequestParam(required = false) String targetId,
                                                @RequestParam(required = false) String holidayStart,
                                                @RequestParam(required = false) String holidayEnd,
                                                @ModelAttribute("User") UserInfo user) {
        return new ResponseEntity<>(an1000Service.an1000InfoSel(targetId, user, holidayStart, holidayEnd), HttpStatus.OK);
    }

    /**
     * 공휴일 조회
     *
     * @param startDate : 휴가 시작일
     * @param endDate   : 휴가 종료일
     * @return 휴가 시작일 ~ 휴가 종료일 기준 공휴일 List return
     */
    @ResponseBody
    @RequestMapping(value = "/publicHoliday", method = RequestMethod.GET)
    public ResponseEntity publicHolidayApi(String startDate, String endDate, @ModelAttribute UserInfo user) {
        return new ResponseEntity<>(an1000Service.an1000PublicHolidaySel(startDate, endDate), HttpStatus.OK);
    }

    /**
     * 메소드 설명 : 사용자정보 조회
     */
    @ResponseBody
    @RequestMapping(value = "/SelUser")
    public ResponseEntity AN1000_SEL_USER(@RequestBody Map<String, Object> param, @ModelAttribute UserInfo user) {
        return new ResponseEntity<>(an1000Service.an1000SelUser(param), HttpStatus.OK);
    }

}
