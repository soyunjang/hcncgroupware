package com.hs.an.service;

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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Service("an1300Service")
@Transactional
public class AN1300Service {

    @Autowired
    private SqlSession sqlSession;

    @Resource(name = "uploadPath")
    private String uploadPath;

    private Logger log = LoggerFactory.getLogger(this.getClass());

    public void fileUpload(MultipartFile file, int index, String ext, UserInfo user) {
        Map<String, Object> param = new HashMap<>();

        try {
            File path = new File(uploadPath);
            if(!(path.exists())) {
                path.mkdir();
            }

            File calendarDir = new File(uploadPath + File.separator + "calendar");
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

    public Map<String, Object> getPdtFileByUse(Integer num) {
        Map<String, Object> result;
        try {
            result = sqlSession.selectOne("an1300Mapper.getPdtFileByUse", num);
            String filePath = result.get("FILE_PATH").toString().replace("\\", "/");
            result.put("FILE_PATH", filePath);
            return result;
        } catch (Exception e) {
            return new HashMap<>();
//            throw new RuntimeException("getPdtFileByUse.error", e);
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
}
