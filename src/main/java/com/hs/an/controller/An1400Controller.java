package com.hs.an.controller;

import com.hs.an.dto.PublicOfficeRequestDto;
import com.hs.an.service.An1400Service;
import com.hs.home.controller.UserInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;
import static com.hs.util.ResponseHttpHeaders.responseHeader;

@Slf4j
@Controller
@RequestMapping("/an1400")
public class An1400Controller {

    private final An1400Service an1400Service;

    @Autowired
    public An1400Controller(An1400Service an1400Service) {
        this.an1400Service = an1400Service;
    }

    @ModelAttribute("User")
    public UserInfo userInfo(HttpSession session) {
        return (UserInfo) session.getAttribute("User");
    }

    @RequestMapping(method = RequestMethod.GET)
    public String an1400(@ModelAttribute("User") UserInfo user) {
        return "AN/an1400";
    }

    @ResponseBody
    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity an1400Save(@RequestBody PublicOfficeRequestDto dto, @ModelAttribute("User") UserInfo user) {
        an1400Service.an1400Save(dto, user);
        return new ResponseEntity<>(an1400Service.an1400Dates(dto.getSearchYear(), dto.getSearchType()), responseHeader(), HttpStatus.OK);
    }

    @ResponseBody
    @RequestMapping(method = RequestMethod.DELETE)
    public ResponseEntity an1400Delete(@RequestBody PublicOfficeRequestDto dto) {
        an1400Service.an1400Delete(dto);
        return new ResponseEntity<>(an1400Service.an1400Dates(dto.getSearchYear(), dto.getSearchType()), responseHeader(), HttpStatus.OK);
    }

    @ResponseBody
    @RequestMapping(method = RequestMethod.PATCH)
    public ResponseEntity an1400Update(@RequestBody PublicOfficeRequestDto dto, @ModelAttribute("User") UserInfo user) {
        an1400Service.an1400Update(dto, user);
        return new ResponseEntity<>(an1400Service.an1400Dates(dto.getSearchYear(), dto.getSearchType()), responseHeader(), HttpStatus.OK);
    }

    @ResponseBody
    @RequestMapping(value = "/years", method = RequestMethod.GET)
    public ResponseEntity an1400YearSel() {
        return new ResponseEntity<>(an1400Service.an1400Years(), responseHeader(), HttpStatus.OK);
    }

    @ResponseBody
    @RequestMapping(value = "/dates", method = RequestMethod.GET)
    public ResponseEntity an1400DateSel(@RequestParam(required = false) String year,
                                        @RequestParam(required = false) String type) {
        return new ResponseEntity(an1400Service.an1400Dates(year, type), responseHeader(), HttpStatus.OK);
    }
}
