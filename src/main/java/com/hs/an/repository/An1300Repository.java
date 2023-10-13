package com.hs.an.repository;

import com.hs.an.dto.FileInfoDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Repository
public class An1300Repository {

    private final SqlSession sqlSession;

    @Autowired
    public An1300Repository(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public Optional<FileInfoDto> getPdtFileByFileName(String fileName) {
        return Optional.ofNullable(sqlSession.selectOne("an1300Mapper.getPdtFileByFileName", fileName));
    }

    public Optional<FileInfoDto> getPdtFileByUse(Integer num) {
        return Optional.ofNullable(sqlSession.selectOne("an1300Mapper.getPdtFileByUse", num));
    }

    public void fileUpload(Map<String, Object> param) {
        sqlSession.insert("an1300Mapper.uploadPathSave", param);
    }

    public List<Map<String, Object>> getFileList() {
        return sqlSession.selectList("an1300Mapper.getFileList");
    }

    public int getDataCount(Map<String, Object> map) {
        return sqlSession.update("an1300Mapper.fileInfoUpdate", map);
    }
}
