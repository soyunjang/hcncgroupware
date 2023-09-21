package com.hs.an.controller;

import com.hs.an.dto.FileInfo;
import com.hs.an.service.AN1300Service;
import com.hs.home.controller.UserInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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

    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @ModelAttribute("User")
    public UserInfo userInfo(HttpSession session) {
        return (UserInfo) session.getAttribute("User");
    }

    @RequestMapping(method = RequestMethod.GET)
    public String an1300(Model model) {
        model.addAttribute("PDF_FILE", an1300Service.getPdfFileByUse(null));
        return "AN/AN1300";
    }

    @ResponseBody
    @RequestMapping(value = "/files", method = RequestMethod.GET)
    public List<Map<String, Object>> an1300FileList() {
        return an1300Service.getFileList();
    }

    @ResponseBody
    @RequestMapping(value = "/file", method = RequestMethod.GET)
    public FileInfo an1300File(@RequestParam(required = false) Integer num) {
        return an1300Service.getPdfFileByUse(num);
    }
    @ResponseBody
    @RequestMapping(value = "/file", method = RequestMethod.PATCH)
    public ResponseEntity an1300FileDelete(@RequestParam(required = false) Integer num, @ModelAttribute("User") UserInfo user) {
        try {
            return new ResponseEntity<>(an1300Service.getDateAfterUpdate(num, user), HttpStatus.OK ) ;
        } catch (Exception e) {
            return new ResponseEntity<>("잘못된 요청입니다.", HttpStatus.BAD_REQUEST);
        }
    }
    @RequestMapping(value = "/file", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity an1300Upload(@RequestParam("file") MultipartFile file, @ModelAttribute("User") UserInfo user) {

        int index = file.getOriginalFilename().lastIndexOf(".");
        String ext = file.getOriginalFilename().substring(index).toLowerCase();

        Map<String, Object> result = new HashMap<>();

        if (ext.equals(".pdf")) {
            an1300Service.fileUpload(file, ext, user);
            result.put("UPLOAD", "Y");
        } else {
            result.put("UPLOAD", "N");
        }
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @RequestMapping(value = "/file/{fileName}", method = RequestMethod.GET)
    public ResponseEntity findFileByPdf(@PathVariable String fileName, @ModelAttribute("User") UserInfo user,
                                        HttpServletResponse response) {
        if (user == null) {
            return new ResponseEntity<>("잘못된 사용자입니다.", HttpStatus.BAD_REQUEST);
        }
        try {
            FileInfo findByFileInfo = an1300Service.getPdfFileByFileName(fileName);
            File file = new File(findByFileInfo.getFilePath() + File.separator + findByFileInfo.getFileChangeName());
            response.setHeader("Content-Type", "application/pdf");
            response.setHeader("Content-Length", String.valueOf(file.length()));
            response.setHeader("Content-Disposition", "inline");
            response.setHeader("fileName", findByFileInfo.getFileChangeName());

            Files.copy(file.toPath(), response.getOutputStream());
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (IOException e) {
            return new ResponseEntity<>("PDF 파일 찾기에 실패하였습니다.", HttpStatus.BAD_REQUEST);
        }
    }

}
