package com.hs.an.repository;

import com.hs.an.dto.An1200Dto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class An1200Repository {
    private final SqlSession sqlSession;

    @Autowired
    public An1200Repository(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public List<Map<String, Object>> an1200Sel(An1200Dto dto) {
        return sqlSession.selectList("an1200Mapper.an1200Sel", dto);
    }

    public int an1200Count() {
        return sqlSession.selectOne("an1200Mapper.an1200count");
    }
}
