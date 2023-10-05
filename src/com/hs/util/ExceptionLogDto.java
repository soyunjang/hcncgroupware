package com.hs.util;

import com.hs.home.controller.UserInfo;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ExceptionLogDto {

    private UserInfo user;
    private String eventCd;
    private String eventNm;
    private String eventDetail;
    private String eventSvry;
    private String progNm;
    private String hostNm;

}
