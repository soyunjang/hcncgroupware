package com.hs.an.controller;

import com.hs.an.dto.An1200Dto;
import com.hs.an.service.An1200Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
@RequestMapping("/an1200")
public class An1200Controller {

    private final An1200Service an1200Service;

    @Autowired
    public An1200Controller(An1200Service an1200Service) {
        this.an1200Service = an1200Service;
    }

    /**
     * 메소드 설명 : 휴가사용현황 페이지로 이동
     */
    @RequestMapping(method = RequestMethod.GET)
    public String an1200(Model model) {
        model.addAttribute("UsersCount", an1200Service.an1200Count());
        return "AN/an1200";
    }

    /**
     * 메소드 설명 : 휴가사용현황 조회
     */
    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ResponseEntity AN1200_SEL(@ModelAttribute An1200Dto dto) {
        return new ResponseEntity<>(an1200Service.an1200Sel(dto), HttpStatus.OK);
    }

}
