package com.hs.an.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class An1100Repository {

    private final SqlSession sqlSession;

    @Autowired
    public An1100Repository(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public List<Map<String, Object>> an1100Sel(Map<String, Object> param) {
        return sqlSession.selectList("an1100Mapper.an1100Sel", param);
    }
}
