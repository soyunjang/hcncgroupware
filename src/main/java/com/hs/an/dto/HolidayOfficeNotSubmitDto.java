package com.hs.an.dto;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@AllArgsConstructor
public class HolidayOfficeNotSubmitDto {

    private String USER_ID;
    private int STATUS;
    private String DEPT_CD;
    private LocalDate HOLIDAY_DATE;

}
