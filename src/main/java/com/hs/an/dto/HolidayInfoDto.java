package com.hs.an.dto;

import lombok.AccessLevel;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor(access = AccessLevel.PUBLIC)
public class HolidayInfoDto {

    private String user_id;
    private String use_start;
    private String use_end;
    private float holiday_total;
    private float holiday_use;
    private float holiday_remain;
    private float holiday_deduct;
    private String holiday_start;
    private String holiday_end;

}
