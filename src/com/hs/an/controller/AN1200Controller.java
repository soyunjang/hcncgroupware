package com.hs.an.controller;

import com.hs.an.service.AN1200Service;
import com.hs.home.controller.UserInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/an1200")
public class AN1200Controller {

    private final AN1200Service an1200Service;

    @Autowired
    public AN1200Controller(AN1200Service an1200Service) {
        this.an1200Service = an1200Service;
    }

    @ModelAttribute("User")
    public UserInfo userInfo(HttpSession session) {
        return (UserInfo) session.getAttribute("User");
    }

    /**
     * 메소드 설명 : 휴가사용현황 페이지로 이동
     */
    @RequestMapping(method = RequestMethod.GET)
    public String an1200(Model model) {
//        try {
            model.addAttribute("UsersCount", an1200Service.an1200Count());
//        } catch (Exception e) {
//            model.addAttribute("UsersCount", 0);
//        }
        return "AN/AN1200";
    }

    /**
     * 메소드 설명 : 휴가사용현황 조회
     */
    @ResponseBody
    @RequestMapping(value = "/list")
    public ResponseEntity AN1200_SEL(@RequestBody Map<String, Object> param, @ModelAttribute("User") UserInfo user) {
        return new ResponseEntity<>(an1200Service.an1200Sel(param), HttpStatus.OK);
    }

}
