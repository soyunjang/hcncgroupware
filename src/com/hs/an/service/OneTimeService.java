package com.hs.an.service;

import com.hs.home.controller.UserInfo;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

@Slf4j
@Service
public class OneTimeService {
    @Autowired
    private AN1000Service an1000Service;

    @Autowired
    private SqlSession sqlSession;

//    @PostConstruct
    public void test() {
        sqlSession.<Map<String, Object>>selectList("oneTimeMapper.testSelect")
                .forEach(item -> {
                    sqlSession.update("oneTimeMapper.testUpdate", item.get("USER_ID"));
                    HashMap<String, Object> param = new HashMap<>();
                    param.put("USER_ID", item.get("USER_ID"));
                    param.put("HOLIDAY_CNT", String.valueOf(item.get("HOLIDAY_CNT")));
                    param.put("HOLIDAY_TYPE", item.get("HOLIDAY_TYPE"));
                    UserInfo user = new UserInfo();
                    user.setUSER_ID((String) item.get("USER_ID"));
                    an1000Service.holidayInfoUpdate(param, user, AN1000Service.Type.MINUS);
                });
    }

//    @PostConstruct
    public void holidayInfoSettingUseStartAndEnd() {
        AtomicInteger count = new AtomicInteger();
        List<UserInfo> result = sqlSession.selectList("testUser");
        result.forEach(item -> {
                LocalDate enterDate = LocalDate.parse(item.getENTER_DT());

            for (int i = 0; i < 100; i++) {
                LocalDate localDate1 = enterDate.plusYears(i);
                LocalDate localDate2 = enterDate.plusYears(1 + i).minusDays(1);
                boolean check1 = LocalDate.now().isAfter(localDate1) || localDate1.isEqual(LocalDate.now());
                boolean check2 = LocalDate.now().isBefore(localDate2) || LocalDate.now().isEqual(localDate2);
                if (check1 && check2) {
                    System.out.println(enterDate + " localDate1 = " + localDate1 + " localDate2 = " + localDate2);
                    Map<String, Object> param = new HashMap<>();
                    param.put("USE_START", localDate1);
                    param.put("USE_END", localDate2);
                    param.put("USER_ID", item.getUSER_ID());
                    sqlSession.update("holidayInfoStartEndUpdate", param);
                    count.getAndIncrement();
                    break;
                }
            }
        });
    }

}

