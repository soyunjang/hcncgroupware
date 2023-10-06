package com.hs.an.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class HolidayInfoInsertDto {

    private String userId;
    private String useStart;
    private String useEnd;
    private float holidayTotal;
    private float holidayUse;
    private float holidayRemain;
    private float holidayDeduct;
    private final String regId = "SYSTEM";

}
