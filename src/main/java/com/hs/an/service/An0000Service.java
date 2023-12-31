package com.hs.an.service;

import com.hs.an.dto.HolidayInfoInsertDto;
import com.hs.an.dto.HolidayOfficeNotSubmitDto;
import com.hs.an.dto.HolidayPublicDto;
import com.hs.an.dto.UserAndHolidayInfoDto;
import com.hs.an.repository.An0000Repository;
import com.hs.common.service.CommonService;
import com.hs.home.controller.UserInfo;
import com.hs.util.ExceptionLogDto;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;
import java.time.Period;
import java.util.*;
import java.util.stream.Collectors;

import static java.lang.String.valueOf;
import static java.util.Arrays.stream;

@Slf4j
@Component
@Transactional
public class An0000Service {
    private final String HOLIDAY_TYPE = "OFFICE01";
    private final String HOLIDAY_CNT = "1";
    @Autowired
    private An1000Service an1000Service;
    @Autowired
    private CommonService commonService;
    @Autowired
    private An0000Repository an0000Repository;

    /** 회사 휴무 미등록 시 해당 달 마지막 날에 자동 등록 */
//    @Scheduled(cron = "0 30 23 28-31 * *")
    public void holidayCompanyAutoSubmit() {
        try {
            Calendar calendar = Calendar.getInstance();
            if (calendar.get(Calendar.DATE) == calendar.getActualMaximum(Calendar.DATE)) {
                List<HolidayOfficeNotSubmitDto> dtos = an0000Repository.holidayOfficeNotSubmitSelect();
                if (!dtos.isEmpty()) {
                    an0000Repository.holidayOfficeNotSubmitSave(dtos);
                    for (HolidayOfficeNotSubmitDto dto : dtos) {
                        HashMap<String, Object> param = new HashMap<>();
                        param.put("USER_ID", dto.getUSER_ID());
                        param.put("HOLIDAY_CNT", HOLIDAY_CNT);
                        param.put("HOLIDAY_TYPE", HOLIDAY_TYPE);
                        UserInfo user = new UserInfo();
                        user.setUSER_ID(dto.getUSER_ID());
                        an1000Service.holidayInfoUpdate(param, user, An1000Service.Type.PLUS);
                    }
                } else {
                    log.info("holidayCompanyAutoSubmit.dto.isEmpty()");
                }
            }
        } catch (Exception e) {
            log.error(this.getClass().getName() + ".holidayCompanyAutoSubmit : 회사 휴무 자동 등록 오류", e);
            logInsert(e.getCause() == null ? "" : e.getCause().toString(), e.getMessage());
        }
    }

    /** 입사일 기준 연차 계산 */
    @Scheduled(cron = "0 30 0 * * *")
    public void calculation() {
        try {
            List<UserAndHolidayInfoDto> dto = an0000Repository.userAndHolidayInfo();
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
                log.info("calculation.dto.isEmpty");
            }
        } catch (Exception e) {
            log.error(this.getClass().getName() + ".calculation : 연차 계산 오류", e);
            logInsert(e.getCause() == null ? "" : e.getCause().toString(), e.getMessage());
        }
    }

    private void byYears(UserAndHolidayInfoDto item) {

        log.info("ID={}", item.getUSER_ID());

        Period period = Period.between(LocalDate.parse(item.getENTER_DT()), LocalDate.now());
        int years = period.getYears();
        int months = period.getMonths();
        int defaultHoliday = 15;
        int standardYears = 3;
        float holidayTotal;

        if (years < 1) {
            // 근속 1년 미만 대상자
            holidayTotal = months;
        } else if (years < standardYears) {
            // 근속 1년이상 3년 미만 대상자
            holidayTotal = defaultHoliday;
        } else if (years >= standardYears && years % 2 == 1) {
            // 근속 3년 이상이면서 연차 증가 대상자
            holidayTotal = defaultHoliday + (years / 2);
        } else if (years >= standardYears && years % 2 == 0) {
            // 근속 3년 이상이면서 연차 미 증가 대상자
//            holidayTotal = item.getHOLIDAY_TOTAL();
            holidayTotal = defaultHoliday + (years / 2) - 1;
        } else {
            throw new RuntimeException("byYears.else");
        }
        holidayRefresh(item, holidayTotal, years);
    }

    private void holidayRefresh(UserAndHolidayInfoDto item, float holidayTotal, int years) {

        boolean check = (item.getHOLIDAY_DEDUCT() == 0);

        if (years < 1) { // 근속연수 1년 미만
            if (check) {
                float increaseDay = holidayTotal - (item.getHOLIDAY_USE() + item.getHOLIDAY_REMAIN());
                float holidayRemainder = item.getHOLIDAY_REMAIN() + increaseDay;
                an0000Repository.holidayInfoUpdate(item.getUSER_ID(), holidayTotal, item.getHOLIDAY_USE(), holidayRemainder, (float) 0);

            } else {
                float useDeduct = item.getHOLIDAY_USE() + item.getHOLIDAY_DEDUCT();
                an0000Repository.holidayInfoUpdate(item.getUSER_ID(), holidayTotal, holidayTotal, item.getHOLIDAY_REMAIN(), useDeduct - holidayTotal);
            }
        } else { // 근속연수 1년 이상

            Map<String, Object> useStartAndEnd = getUseStartAndEnd(item);

            if (check) {
                an0000Repository.holidayInfoInsert(
                        HolidayInfoInsertDto.builder()
                                .userId(item.getUSER_ID())
                                .useStart(String.valueOf(useStartAndEnd.get("useStart")))
                                .useEnd(String.valueOf(useStartAndEnd.get("useEnd")))
                                .holidayTotal(holidayTotal)
                                .holidayUse((float) 0)
                                .holidayRemain(holidayTotal)
                                .holidayDeduct((float) 0)
                                .build()
                );
            } else {
                float holidayDeduct = item.getHOLIDAY_DEDUCT();
                an0000Repository.holidayInfoInsert(
                        HolidayInfoInsertDto.builder()
                                .userId(item.getUSER_ID())
                                .useStart(String.valueOf(useStartAndEnd.get("useStart")))
                                .useEnd(String.valueOf(useStartAndEnd.get("useEnd")))
                                .holidayTotal(holidayTotal)
                                .holidayUse(holidayDeduct)
                                .holidayRemain(holidayTotal - holidayDeduct)
                                .holidayDeduct((float) 0)
                                .build()
                );
            }
        }
    }

    /**
     * 연차 적용 날짜 찾기
     */
    private Map<String, Object> getUseStartAndEnd(UserAndHolidayInfoDto item) {
        Map<String, Object> param = new HashMap<>();
        LocalDate enterDate = LocalDate.parse(item.getENTER_DT());
        for (int i = 0; i < 100; i++) {
            LocalDate useStart = enterDate.plusYears(i);
            LocalDate useEnd = enterDate.plusYears(1 + i).minusDays(1);
            boolean useStartCheck = LocalDate.now().isAfter(useStart) || LocalDate.now().isEqual(useStart);
            boolean useEndCheck = LocalDate.now().isBefore(useEnd) || LocalDate.now().isEqual(useEnd);
            if (useStartCheck && useEndCheck) {
                param.put("useStart", useStart);
                param.put("useEnd", useEnd);
                param.put("userId", item.getUSER_ID());
                break;
            }
        }
        return param;
    }

    /**
     * 공휴일 조회(12개월) 및 저장
     */
    @Scheduled(cron = "0 0 6 1 * *")
    public void publicHolidayApi() {
        try {
            int searchCount = 12;
            int year = LocalDate.now().getYear();
            int month = LocalDate.now().getMonthValue();
            String[] yearArray = new String[searchCount];
            String[] monthArray = new String[searchCount];

            yearAndMonthArray(year, month, yearArray, monthArray);
            List<HolidayPublicDto> result = getHolidayList(yearArray, monthArray);
            log.info(result.toString());
            an1000Service.an1000PublicHolidaySave(result);
        } catch (Exception e) {
            log.error(this.getClass().getName() + ".publicHolidayApi", e);
            logInsert(e.getCause() == null ? "" : e.getCause().toString(), e.getMessage());
        }
    }

    private void yearAndMonthArray(int year, int month, String[] yearArray, String[] monthArray) {
        for (int i = 0; i < monthArray.length; i++) {
            monthArray[i] = month + i < 10 ?
                    "0" + (month + i) : (month + i) % 13 < 10 ? "0" + ((month + i + 1) % 13)
                    : valueOf((month + i) % 13);
            yearArray[i] = (i == 0) ? valueOf(year) : (Integer.parseInt(monthArray[0]) > Integer.parseInt(monthArray[i]) ? valueOf(year + 1) : valueOf(year));
        }
    }

    /**
     * Open API (한국천문연구원) : 공휴일 정보 조회
     * Open API URL : https://www.data.go.kr/data/15012690/openapi.do
     */
    private List<HolidayPublicDto> getHolidayList(String[] yearArray, String[] monthArray) {
        List<HolidayPublicDto> list = new ArrayList<>();
        for (int i = 0; i < monthArray.length; i++) {
            String serviceKey = "lpOOxR6f66DvlhdWlXJNJrm51ltklSeiRdySDssS3VuClfK9hAMDNwLRqAVnR4T2ijXHuAXxXgOW%2Fe67Lumx1g%3D%3D";
            String type = "json";
            String apiUrl = "http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo?ServiceKey=" + serviceKey + "&solYear=" + yearArray[i] + "&solMonth=" + monthArray[i] + "&_type=" + type;
            String result = "";

            try {
                URL url = new URL(apiUrl);
                HttpURLConnection con = (HttpURLConnection) url.openConnection();
                con.setRequestMethod("GET");
                int responseCode = con.getResponseCode();
                BufferedReader br;
                if (responseCode >= 200 && responseCode <= 300) {
                    br = new BufferedReader(new InputStreamReader(con.getInputStream()));
                } else {
                    br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
                }
                result = br.readLine();

                JSONParser jsonParser = new JSONParser();
                JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
                JSONObject response = (JSONObject) jsonObject.get("response");
                JSONObject body = (JSONObject) response.get("body");
                String totalCount = valueOf(body.get("totalCount"));

                if (Integer.parseInt(totalCount) == 1) {
                    JSONObject items = (JSONObject) body.get("items");
                    JSONObject item = (JSONObject) items.get("item");
                    list.add(new HolidayPublicDto(valueOf(item.get("dateName")), valueOf(item.get("locdate"))));

                } else if (Integer.parseInt(totalCount) > 1) {
                    JSONObject items = (JSONObject) body.get("items");
                    JSONArray item = (JSONArray)items.get("item");
                    for (int j = 0; j < item.size(); j++) {
                        JSONObject sequence = (JSONObject) item.get(j);
                        list.add(new HolidayPublicDto(valueOf(sequence.get("dateName")), valueOf(sequence.get("locdate"))));
                    }
                }
            } catch (Exception e) {
                throw new RuntimeException("공휴일(Open API : 한국천문연구원) 조회 중 에러 발생");
            }
        }
        // 근로자의날 추가
        if (stream(monthArray).anyMatch("05"::equals)) {
            stream(yearArray).distinct().collect(Collectors.toList())
                    .forEach(item -> {
                        boolean check = Integer.valueOf(monthArray[0]) > 5 && LocalDate.now().getYear() == Integer.valueOf(item);
                        if (!check) {
                            list.add(new HolidayPublicDto("근로자의날", item + "0501"));
                        }
                    });
        }
        return list;
    }

    /**
     * 에러 내용 DB 저장
     */
    private void logInsert(String eCause, String eMessage) {
        UserInfo user = new UserInfo("SYSTEM");
        user.setUSER_IP("127.0.0.1");
        commonService.insertExceptionLog(
                ExceptionLogDto.builder()
                        .user(user)
                        .eventCd("")
                        .eventNm(eCause)
                        .eventDetail(eMessage)
                        .eventSvry("")
                        .progNm("")
                        .hostNm("SYSTEM")
                        .build()
        );
    }
}
