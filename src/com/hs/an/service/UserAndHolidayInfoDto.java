package com.hs.an.service;

public class UserAndHolidayInfoDto {
    private String USER_ID;
    private String ENTER_DT;
    private float HOLIDAY_TOTAL;
    private float HOLIDAY_USE;
    private float HOLIDAY_REMAIN;
    private Float HOLIDAY_DEDUCT;
    private final String UPT_ID = "admin";

    public UserAndHolidayInfoDto() {
    }

    public UserAndHolidayInfoDto(String USER_ID, String ENTER_DT, float HOLIDAY_TOTAL, float HOLIDAY_USE, float HOLIDAY_REMAIN, float HOLIDAY_DEDUCT) {
        this.USER_ID = USER_ID;
        this.ENTER_DT = ENTER_DT;
        this.HOLIDAY_TOTAL = HOLIDAY_TOTAL;
        this.HOLIDAY_USE = HOLIDAY_USE;
        this.HOLIDAY_REMAIN = HOLIDAY_REMAIN;
        this.HOLIDAY_DEDUCT = HOLIDAY_DEDUCT;
    }

    public UserAndHolidayInfoDto(String USER_ID, float HOLIDAY_TOTAL, float HOLIDAY_USE, float HOLIDAY_REMAIN, float HOLIDAY_DEDUCT) {
        this.USER_ID = USER_ID;
        this.HOLIDAY_TOTAL = HOLIDAY_TOTAL;
        this.HOLIDAY_USE = HOLIDAY_USE;
        this.HOLIDAY_REMAIN = HOLIDAY_REMAIN;
        this.HOLIDAY_DEDUCT = HOLIDAY_DEDUCT;
    }

    @Override
    public String toString() {
        return "UserAndHolidayInfoDto{" +
                "USER_ID='" + USER_ID + '\'' +
                ", ENTER_DT='" + ENTER_DT + '\'' +
                ", HOLIDAY_TOTAL=" + HOLIDAY_TOTAL +
                ", HOLIDAY_USE=" + HOLIDAY_USE +
                ", HOLIDAY_REMAIN=" + HOLIDAY_REMAIN +
                ", HOLIDAY_DEDUCT=" + HOLIDAY_DEDUCT +
                '}';
    }

    public String getUSER_ID() {
        return USER_ID;
    }

    public void setUSER_ID(String USER_ID) {
        this.USER_ID = USER_ID;
    }

    public String getENTER_DT() {
        return ENTER_DT;
    }

    public void setENTER_DT(String ENTER_DT) {
        this.ENTER_DT = ENTER_DT;
    }

    public float getHOLIDAY_TOTAL() {
        return HOLIDAY_TOTAL;
    }

    public void setHOLIDAY_TOTAL(float HOLIDAY_TOTAL) {
        this.HOLIDAY_TOTAL = HOLIDAY_TOTAL;
    }

    public float getHOLIDAY_USE() {
        return HOLIDAY_USE;
    }

    public void setHOLIDAY_USE(float HOLIDAY_USE) {
        this.HOLIDAY_USE = HOLIDAY_USE;
    }

    public float getHOLIDAY_REMAIN() {
        return HOLIDAY_REMAIN;
    }

    public void setHOLIDAY_REMAIN(float HOLIDAY_REMAIN) {
        this.HOLIDAY_REMAIN = HOLIDAY_REMAIN;
    }

    public Float getHOLIDAY_DEDUCT() {
        return HOLIDAY_DEDUCT;
    }

    public void setHOLIDAY_DEDUCT(Float HOLIDAY_DEDUCT) {
        this.HOLIDAY_DEDUCT = HOLIDAY_DEDUCT;
    }

    public String getUPT_ID() {
        return UPT_ID;
    }
}