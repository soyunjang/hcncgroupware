package com.hs.an.service;

import com.hs.an.dto.FileInfo;
import com.hs.an.repository.An1300Repository;
import com.hs.home.controller.UserInfo;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDate;
import java.util.*;
import java.util.function.Supplier;

@Service("an1300Service")
@Transactional
public class AN1300Service {

    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private An1300Repository an1300Repository;

    @Resource(name = "uploadPath")
    private String uploadPath;

    private Logger log = LoggerFactory.getLogger(this.getClass());

    public void fileUpload(MultipartFile file, String ext, UserInfo user) {
        Map<String, Object> param = new HashMap<>();

        try {
            File path = new File(uploadPath);
            if(!(path.exists())) {
                path.mkdir();
            }

            File calendarDir = new File(uploadPath + "calendar");
            if (!calendarDir.exists()) {
                calendarDir.mkdir();
            }

            String changeFileName = String.valueOf(new StringBuilder()
                    .append(LocalDate.now())
                    .append("-")
                    .append(new Random().nextInt(1000000))
                    .append(ext));

            Path copyOfLocation = Paths.get(calendarDir
                    + File.separator
                    + StringUtils.cleanPath(changeFileName));

            param.put("FILE_TYPE", ext.replace(".", ""));
            param.put("FILE_PATH", calendarDir.toPath().toString());
            param.put("FILE_CHANGE_NAME", changeFileName);
            param.put("FILE_ORIGINAL_NAME", file.getOriginalFilename());
            param.put("REG_ID", user.getUSER_ID());
            param.put("USE_YN", "Y");

            Files.copy(file.getInputStream(), copyOfLocation, StandardCopyOption.REPLACE_EXISTING);
            sqlSession.insert("an1300Mapper.uploadPathSave", param);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public FileInfo getPdfFileByUse(Integer num) {
        try {
            FileInfo fileInfo = an1300Repository.getPdtFileByUse(num)
                    .orElseThrow(() -> new IllegalArgumentException("Not Find File Num"));
            fileInfo.setFilePath(fileInfo.getFilePath().replace("\\", "/"));
            return fileInfo;
        } catch (Exception e) {
            return new FileInfo();
        }
    }

    public List<Map<String, Object>> getFileList() {
        return sqlSession.selectList("an1300Mapper.getFileList");
    }

    public List<Map<String, Object>> getDateAfterUpdate(Integer num, UserInfo user) {
        if (num != null) {
            Map<String, Object> map = new HashMap<>();
            map.put("NUM", num);
            map.put("USER_ID", user.getUSER_ID());
            map.put("USE_YN", "N");
            map.put("FILE_TYPE", "pdf");
            int count = sqlSession.update("an1300Mapper.fileInfoUpdate", map);
            if (count == 1) {
                return getFileList();
            } else {
                throw new RuntimeException("getDateAfterUpdate.count.else");
            }

        } else {
            throw new RuntimeException("getDateAfterUpdate.else");
        }
    }

    public FileInfo getPdfFileByFileName(String fileName) {
        return an1300Repository.getPdtFileByFileName(fileName.concat(".pdf"))
                .orElseThrow(() -> new IllegalArgumentException("Incorrect PDF File Name"));
    }
}
