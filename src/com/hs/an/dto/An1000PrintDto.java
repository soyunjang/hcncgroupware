package com.hs.an.dto;

public class An1000PrintDto {
    private String gradeCd;
    private String gradeNm;
    private float holidayCnt;
    private String holidayStart;
    private String holidayEnd;
    private String holidayReason;
    private String holidayType;
    private String userNm;
    private String userId;

    @Override
    public String toString() {
        return "An1000PrintDto{" +
                "gradeCd='" + gradeCd + '\'' +
                ", gradeNm='" + gradeNm + '\'' +
                ", holidayCnt=" + holidayCnt +
                ", holidayStart='" + holidayStart + '\'' +
                ", holidayEnd='" + holidayEnd + '\'' +
                ", holidayReason='" + holidayReason + '\'' +
                ", holidayType='" + holidayType + '\'' +
                ", userNm='" + userNm + '\'' +
                ", userId='" + userId + '\'' +
                '}';
    }

    public String getGradeCd() {
        return gradeCd;
    }

    public void setGradeCd(String gradeCd) {
        this.gradeCd = gradeCd;
    }

    public String getGradeNm() {
        return gradeNm;
    }

    public void setGradeNm(String gradeNm) {
        this.gradeNm = gradeNm;
    }

    public float getHolidayCnt() {
        return holidayCnt;
    }

    public void setHolidayCnt(float holidayCnt) {
        this.holidayCnt = holidayCnt;
    }

    public String getHolidayStart() {
        return holidayStart;
    }

    public void setHolidayStart(String holidayStart) {
        this.holidayStart = holidayStart;
    }

    public String getHolidayEnd() {
        return holidayEnd;
    }

    public void setHolidayEnd(String holidayEnd) {
        this.holidayEnd = holidayEnd;
    }

    public String getHolidayReason() {
        return holidayReason;
    }

    public void setHolidayReason(String holidayReason) {
        this.holidayReason = holidayReason;
    }

    public String getHolidayType() {
        return holidayType;
    }

    public void setHolidayType(String holidayType) {
        this.holidayType = holidayType;
    }

    public String getUserNm() {
        return userNm;
    }

    public void setUserNm(String userNm) {
        this.userNm = userNm;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
