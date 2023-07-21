package com.hs.an.dto;

import java.time.LocalDate;

public class HolidayPublicDto {

    private String publicName;
    private String publicDay;

    public HolidayPublicDto() {
    }

    public HolidayPublicDto(String publicName, String publicDay) {
        this.publicName = publicName;
        this.publicDay = publicDay;
    }

    @Override
    public String toString() {
        return "HolidayPublicDto{" +
                "publicName='" + publicName + '\'' +
                ", publicDay='" + publicDay + '\'' +
                '}';
    }

    public String getPublicName() {
        return publicName;
    }

    public void setPublicName(String publicName) {
        this.publicName = publicName;
    }

    public String getPublicDay() {
        return publicDay;
    }

    public void setPublicDay(String publicDay) {
        this.publicDay = publicDay;
    }

}
