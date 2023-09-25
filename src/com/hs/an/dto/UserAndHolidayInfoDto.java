package com.hs.an.dto;

import lombok.AccessLevel;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor(access = AccessLevel.PUBLIC)
public class UserAndHolidayInfoDto {
    
    private String USER_ID;
    private String ENTER_DT;
    private float HOLIDAY_TOTAL;
    private float HOLIDAY_USE;
    private float HOLIDAY_REMAIN;
    private Float HOLIDAY_DEDUCT;
    private final String UPT_ID = "admin";

    public UserAndHolidayInfoDto(String USER_ID, float HOLIDAY_TOTAL, float HOLIDAY_USE, float HOLIDAY_REMAIN, float HOLIDAY_DEDUCT) {
        this.USER_ID = USER_ID;
        this.HOLIDAY_TOTAL = HOLIDAY_TOTAL;
        this.HOLIDAY_USE = HOLIDAY_USE;
        this.HOLIDAY_REMAIN = HOLIDAY_REMAIN;
        this.HOLIDAY_DEDUCT = HOLIDAY_DEDUCT;
    }

}