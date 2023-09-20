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

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/an1300")
public class AN1300Controller {

    @Autowired
    private AN1300Service an1300Service;

    @Resource(name = "uploadPath")
    private String uploadPath;

    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @ModelAttribute("User")
    public UserInfo userInfo(HttpSession session) {
        return (UserInfo) session.getAttribute("User");
    }

    @RequestMapping(method = RequestMethod.GET)
    public String an1300(Model model) {
        model.addAttribute("PDF_FILE", an1300Service.getPdtFileByUse(null));
        return "AN/AN1300";
    }

    @ResponseBody
    @RequestMapping(value = "/files", method = RequestMethod.GET)
    public List<Map<String, Object>> an1300FileList() {
        return an1300Service.getFileList();
    }

    @ResponseBody
    @RequestMapping(value = "/file", method = RequestMethod.GET)
    public Map<String, Object> an1300File(@RequestParam(required = false) Integer num) {
        return an1300Service.getPdtFileByUse(num);
    }
    @ResponseBody
    @RequestMapping(value = "/file", method = RequestMethod.PATCH)
    public List<Map<String, Object>> an1300FileDelete(@RequestParam(required = false) Integer num, @ModelAttribute("User") UserInfo user) {
        return an1300Service.getDateAfterUpdate(num, user);
    }
    @RequestMapping(value = "/file", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> an1300Upload(@RequestParam("file") MultipartFile file, @ModelAttribute("User") UserInfo user) {

        int index = file.getOriginalFilename().lastIndexOf(".");
        String ext = file.getOriginalFilename().substring(index);

        Map<String, Object> result = new HashMap<>();

        if (ext.equals(".pdf") || ext.equals(".PDF")) {
            an1300Service.fileUpload(file, ext, user);
            result.put("UPLOAD", "Y");
        } else {
            result.put("UPLOAD", "N");
        }
        return result;
    }

    @RequestMapping(value = "/file/{fileName}", method = RequestMethod.GET)
    public void findFileByPdf(@PathVariable String fileName, HttpServletResponse response) {
        try {
            File file = new File(uploadPath + File.separator + "calendar" + File.separator + fileName + ".pdf");
            response.setHeader("Content-Type", "application/pdf");
            response.setHeader("Content-Length", String.valueOf(file.length()));
            response.setHeader("Content-Disposition", "inline");
            response.setHeader("filename", fileName + ".pdf");

            Files.copy(file.toPath(), response.getOutputStream());
        } catch (IOException e) {
            throw new RuntimeException("PDF File Find Error", e);
        }
    }

}
