package com.hs.util;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import static com.hs.util.ResponseHttpHeaders.responseHeader;

@Slf4j
@ControllerAdvice
public class ControllerAdviceCustom {

    @ExceptionHandler(RuntimeException.class)
    public ResponseEntity basic(Exception e) {
        log.error(e.getMessage(), e);
        return new ResponseEntity<>(Message.BAD_REQUEST, responseHeader(), HttpStatus.BAD_REQUEST);
    }

}
