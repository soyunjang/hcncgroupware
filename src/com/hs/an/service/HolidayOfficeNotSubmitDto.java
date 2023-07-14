package com.hs.an.service;

import java.time.LocalDate;

public class HolidayOfficeNotSubmitDto {

    private String USER_ID;
    private int STATUS;
    private String DEPT_CD;
    private LocalDate HOLIDAY_DATE;

    public HolidayOfficeNotSubmitDto() {
    }

    public HolidayOfficeNotSubmitDto(String USER_ID, int STATUS, String DEPT_CD, LocalDate HOLIDAY_DATE) {
        this.USER_ID = USER_ID;
        this.STATUS = STATUS;
        this.DEPT_CD = DEPT_CD;
        this.HOLIDAY_DATE = HOLIDAY_DATE;
    }

    public String getUSER_ID() {
        return USER_ID;
    }

    public void setUSER_ID(String USER_ID) {
        this.USER_ID = USER_ID;
    }

    public int getSTATUS() {
        return STATUS;
    }

    public void setSTATUS(int STATUS) {
        this.STATUS = STATUS;
    }

    public String getDEPT_CD() {
        return DEPT_CD;
    }

    public void setDEPT_CD(String DEPT_CD) {
        this.DEPT_CD = DEPT_CD;
    }

    public LocalDate getHOLIDAY_DATE() {
        return HOLIDAY_DATE;
    }

    public void setHOLIDAY_DATE(LocalDate HOLIDAY_DATE) {
        this.HOLIDAY_DATE = HOLIDAY_DATE;
    }
}
