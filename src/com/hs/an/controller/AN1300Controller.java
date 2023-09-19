package com.hs.an.controller;

import com.hs.an.service.AN1300Service;
import com.hs.home.controller.UserInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AN1300Controller {

    @Autowired
    private AN1300Service an1300Service;

    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @ModelAttribute("User")
    public UserInfo userInfo(HttpSession session) {
        return (UserInfo) session.getAttribute("User");
    }

    @RequestMapping(value = "/an1300", method = RequestMethod.GET)
    public String an1300(Model model) {
        model.addAttribute("PDF_FILE", an1300Service.getPdtFileByUse(null));
        return "AN/AN1300";
    }

    @ResponseBody
    @RequestMapping(value = "/an1300/files", method = RequestMethod.GET)
    public List<Map<String, Object>> an1300FileList() {
        return an1300Service.getFileList();
    }

    @ResponseBody
    @RequestMapping(value = "/an1300/file", method = RequestMethod.GET)
    public Map<String, Object> an1300File(@RequestParam(required = false) Integer num) {
        return an1300Service.getPdtFileByUse(num);
    }
    @ResponseBody
    @RequestMapping(value = "/an1300/file", method = RequestMethod.PATCH)
    public List<Map<String, Object>> an1300FileDelete(@RequestParam(required = false) Integer num, @ModelAttribute("User") UserInfo user) {

        return an1300Service.getDateAfterUpdate(num, user);
//        return an1300Service.getPdtFileByUse(num);
    }
    @RequestMapping(value = "/an1300", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> an1300Upload(@RequestParam("file") MultipartFile file, @ModelAttribute("User") UserInfo user) {

        int index = file.getOriginalFilename().lastIndexOf(".");
        String ext = file.getOriginalFilename().substring(index);

        Map<String, Object> result = new HashMap<>();

        if (ext.equals(".pdf") || ext.equals(".PDF")) {
            an1300Service.fileUpload(file, index, ext, user);
            result.put("UPLOAD", "Y");
        } else {
            result.put("UPLOAD", "N");
        }
        return result;
    }

}
