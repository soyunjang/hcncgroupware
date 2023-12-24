package com.hs.an.dto;

import com.hs.home.controller.UserInfo;
import lombok.Data;

@Data
public class PublicOfficeRequestDto {
    private int number;
    private String type;
    private String name;
    private String date;
    private String regDt;
    private UserInfo user;
    private String searchType;
    private String searchYear;
}
