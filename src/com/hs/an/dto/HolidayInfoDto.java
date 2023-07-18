package com.hs.an.dto;

public class HolidayInfoDto {
    private String user_id;
    private float holiday_total;
    private float holiday_use;
    private float holiday_remain;
    private float holiday_deduct;


    public HolidayInfoDto() {
    }

    @Override
    public String toString() {
        return "HolidayInfoDto{" +
                "user_id='" + user_id + '\'' +
                ", holiday_total=" + holiday_total +
                ", holiday_use=" + holiday_use +
                ", holiday_remain=" + holiday_remain +
                ", holiday_deduct=" + holiday_deduct +
                '}';
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public float getHoliday_total() {
        return holiday_total;
    }

    public void setHoliday_total(float holiday_total) {
        this.holiday_total = holiday_total;
    }

    public float getHoliday_use() {
        return holiday_use;
    }

    public void setHoliday_use(float holiday_use) {
        this.holiday_use = holiday_use;
    }

    public float getHoliday_remain() {
        return holiday_remain;
    }

    public void setHoliday_remain(float holiday_remain) {
        this.holiday_remain = holiday_remain;
    }

    public float getHoliday_deduct() {
        return holiday_deduct;
    }

    public void setHoliday_deduct(float holiday_deduct) {
        this.holiday_deduct = holiday_deduct;
    }
}
