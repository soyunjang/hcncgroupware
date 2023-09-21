package com.hs.an.repository;

import com.hs.an.dto.FileInfo;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public class An1300Repository {

    @Autowired
    private SqlSession sqlSession;

    private Logger log = LoggerFactory.getLogger(this.getClass());

    public Optional<FileInfo> getPdtFileByFileName(String fileName) {
        return Optional.ofNullable(sqlSession.selectOne("an1300Mapper.getPdtFileByFileName", fileName));
    }

    public Optional<FileInfo> getPdtFileByUse(Integer num) {
        return Optional.ofNullable(sqlSession.selectOne("an1300Mapper.getPdtFileByUse", num));
    }
}
