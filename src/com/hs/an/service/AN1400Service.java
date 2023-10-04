package com.hs.an.service;

import com.hs.an.dto.PublicOfficeRequestDto;
import com.hs.an.dto.PublicOfficeResponseDto;
import com.hs.an.repository.An1400Repository;
import com.hs.home.controller.UserInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

@Slf4j
//@Service
@Service("an1400Service")
@Transactional
public class AN1400Service {

    @Autowired
    private An1400Repository an1400Repository;

//    public AN1400Service(An1400Repository an1400Repository) {
//        this.an1400Repository = an1400Repository;
//    }

    public List<Map<String, Object>> an1400Years() {
        try {
            return an1400Repository.an1400Years();
        } catch (Exception e) {
            throw new RuntimeException("공식휴무일, 공휴일 년도 조회 에러", e);
        }
    }


    public List an1400Dates(String year, String type) {
        try {
            Map<String, Object> param = new HashMap<>();
            param.put("year", year);
            param.put("type", type);
            List<PublicOfficeResponseDto> responseDto = an1400Repository.an1400Dates(param);
            AtomicInteger atomicInteger = new AtomicInteger();
            responseDto.forEach(dto -> dto.setNum(atomicInteger.incrementAndGet()));
            return responseDto;
        } catch (Exception e) {
            throw new RuntimeException("공식휴무일, 공휴일 날짜 조회 에러", e);
        }
    }

    public void an1400Save(PublicOfficeRequestDto dto, UserInfo user) {
        try {
            dto.setUser(user);
            an1400Repository.an1400Save(dto);
        } catch (Exception e) {
            throw new RuntimeException("공식휴무일, 공휴일 저장 및 조회 에러", e);
        }
    }

    public void an1400Delete(PublicOfficeRequestDto dto) {
        try {
            an1400Repository.an1400Delete(dto);
        } catch (Exception e) {
            throw new RuntimeException("공식휴무일, 공휴일 삭제 에러", e);
        }
    }

    public void an1400Update(PublicOfficeRequestDto dto, UserInfo user) {
        try {
            dto.setUser(user);
            an1400Repository.an1400Update(dto);
        } catch (Exception e) {
            throw new RuntimeException("공식휴무일, 공휴일 수정 에러", e);
        }
    }
}
