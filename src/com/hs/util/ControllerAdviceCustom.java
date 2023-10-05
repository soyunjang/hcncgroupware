package com.hs.util;

import com.hs.common.service.CommonService;
import com.hs.home.controller.UserInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpSession;
import java.net.InetAddress;
import java.net.UnknownHostException;

import static com.hs.util.ResponseHttpHeaders.responseHeader;

@Slf4j
@ControllerAdvice
public class ControllerAdviceCustom {

    @Autowired
    private CommonService commonService;

    @ExceptionHandler(RuntimeException.class)
    public ResponseEntity basic(HttpSession session, Exception e) {
        try {
            ExceptionLogDto dto = ExceptionLogDto.builder()
                    .user((UserInfo) session.getAttribute("User"))
                    .eventCd("")
                    .eventNm(e.getCause().toString())
                    .eventDetail(e.getMessage())
                    .eventSvry("")
                    .progNm("")
                    .hostNm(InetAddress.getLocalHost().getHostName())
                    .build();
            commonService.insertExceptionLog(dto);
        } catch (UnknownHostException ex) {
            log.error(e.getMessage(), e);
        } finally {
            log.error(e.getMessage(), e);
            return new ResponseEntity<>(Message.BAD_REQUEST, responseHeader(), HttpStatus.BAD_REQUEST);
        }
    }

}
