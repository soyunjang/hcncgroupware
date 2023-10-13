package com.hs.util;

import org.springframework.http.HttpHeaders;

public class ResponseHttpHeaders {
    public static HttpHeaders responseHeader() {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Content-Type", "application/json;charset=UTF-8");
        return httpHeaders;
    }
}
