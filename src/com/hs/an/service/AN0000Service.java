package com.hs.an.service;

import com.hs.an.dto.HolidayOfficeNotSubmitDto;
import com.hs.an.dto.UserAndHolidayInfoDto;
import com.hs.home.controller.UserInfo;
import com.hs.home.service.HomeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.Period;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

@Component
@Transactional
public class AN0000Service {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private HomeService homeService;

    @Autowired
    private AN1000Service an1000Service;

    /** 회사 휴무 미등록 시 해당 달 마지막 날에 자동 등록 */
//    @Scheduled(cron = "0 30 23 28-31 * *")
    @Scheduled(cron = "0 * * * * * ")
    public void holidayCompanyAutoSubmit() {
        try {
//            Calendar calendar = Calendar.getInstance();
//            if (calendar.get(Calendar.DATE) == calendar.getActualMaximum(Calendar.DATE)) {
                List<HolidayOfficeNotSubmitDto> dtos = homeService.holidayOfficeNotSubmitSelect();
                if (!dtos.isEmpty()) {
                    homeService.holidayOfficeNotSubmitSave(dtos);
//                    for (HolidayOfficeNotSubmitDto dto : dtos) {
//                        HashMap<String, Object> param = new HashMap<>();
//                        param.put("USER_ID", dto.getUSER_ID());
//                        param.put("HOLIDAY_CNT", "1");
//                        param.put("HOLIDAY_TYPE", "OFFICE01");
//                        UserInfo user = new UserInfo();
//                        user.setUSER_ID(dto.getUSER_ID());
//                        System.out.println("param = " + param);
//                        System.out.println("user = " + user);
//                        System.out.println("AN1000Service.Type.PLUS = " + AN1000Service.Type.PLUS);
//
//                        an1000Service.holidayInfoUpdate(param, user, AN1000Service.Type.PLUS);
//                    }
                } else {
                    logger.info("holidayCompanyAutoSubmit.dto.isEmpty()");
                }
//            }
        } catch (Exception e) {
            throw new RuntimeException("회사 휴무 자동 등록 오류", e);
        }
    }

    /** 입사일 기준 연차 계산 */
    @Scheduled(cron = "0 30 0 * * *")
    public void calculation() {
        try {
            List<UserAndHolidayInfoDto> dto = homeService.userAndHolidayInfo();
            if (!dto.isEmpty()) {
                dto.stream().filter(item -> {
                            //check1 = 근속 1년 미만 및 년월일 중 일이 같은 대상자
                            boolean check1 = Period.between(LocalDate.parse(item.getENTER_DT()), LocalDate.now()).getYears() < 1 &&
                                    LocalDate.parse(item.getENTER_DT()).getDayOfMonth() == LocalDate.now().getDayOfMonth();
                            //check2 = 년월일 중 월과 일이 같은 대상자(근속 1년 이상 대상)
                            boolean check2 = LocalDate.parse(item.getENTER_DT()).getMonth() == LocalDate.now().getMonth() &&
                                    LocalDate.parse(item.getENTER_DT()).getDayOfMonth() == LocalDate.now().getDayOfMonth();
                            return check1 || check2;
                        })
                        .collect(Collectors.toList())
                        .forEach(item -> {
                            byYears(item);
                        });
            } else {
                logger.info("calculation.dto.isEmpty");
            }
        } catch (Exception e) {
            throw new RuntimeException("연차 계산 오류", e);
        }
    }

    private void byYears(UserAndHolidayInfoDto item) {
        Period period = Period.between(LocalDate.parse(item.getENTER_DT()), LocalDate.now());
        int years = period.getYears();
        int months = period.getMonths();
        logger.info("ID={}", item.getUSER_ID());
        if (years < 1) {
            // 근속 1년 미만 대상자
            int holidayTotal = months;
            holidayRefresh(item, holidayTotal, years);
        } else if (years < 3) {
            // 근속 1년이상 3년 미만 대상자
            int holidayTotal = 15;
            holidayRefresh(item, holidayTotal, years);
        } else if (years >= 3 && years % 2 == 1) {
            // 근속 3년 이상이면서 연차 증가 대상자
            int holidayTotal = 15 + (years / 2);
            holidayRefresh(item, holidayTotal, years);
        } else if (years >= 3 && years % 2 == 0) {
            // 근속 3년 이상이면서 연차 미 증가 대상자
            float holidayTotal = item.getHOLIDAY_TOTAL();
            holidayRefresh(item, holidayTotal, years);
        } else {
            logger.info("byYears.else");
        }
    }

    private void holidayRefresh(UserAndHolidayInfoDto item, float holidayTotal, int years) {
        if (years < 1) { // 근속연수 1년 미만
            if (item.getHOLIDAY_DEDUCT().equals("0") || item.getHOLIDAY_DEDUCT().equals("0.0")) {
                float holidayRemainder = item.getHOLIDAY_REMAIN() + 1;
                homeService.holidayInfoUpdate(item.getUSER_ID(), holidayTotal, item.getHOLIDAY_USE(), holidayRemainder, (float) 0);
            } else {
                float holidayUse = item.getHOLIDAY_USE();
                float holidayDeduct = item.getHOLIDAY_DEDUCT();
                homeService.holidayInfoUpdate(item.getUSER_ID(), holidayTotal, holidayUse + holidayDeduct, item.getHOLIDAY_REMAIN(), (float) 0);
            }
        } else { // 근속연수 1년 이상
            if (item.getHOLIDAY_DEDUCT().equals("0") || item.getHOLIDAY_DEDUCT().equals("0.0")) {
                homeService.holidayInfoUpdate(item.getUSER_ID(), holidayTotal, (float) 0, holidayTotal, (float) 0);
            } else {
                float holidayDeduct = item.getHOLIDAY_DEDUCT();
                homeService.holidayInfoUpdate(item.getUSER_ID(), holidayTotal, holidayDeduct, holidayTotal - holidayDeduct, (float) 0);
            }
        }
    }

}
