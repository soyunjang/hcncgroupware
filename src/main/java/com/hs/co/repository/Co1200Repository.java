package com.hs.co.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class Co1200Repository {

    private final SqlSession sqlSession;

    @Autowired
    public Co1200Repository(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public List<Map<String, Object>> co1200Sel(Map<String, Object> param) {
        return sqlSession.selectList("co1200Mapper.co1200Sel", param);
    }

    public int co1200SelExpense(Map<String, Object> param) {
        return sqlSession.selectOne("co1200Mapper.co1200SelExpense", param);
    }

    public int co1200SelApproval(Map<String, Object> param) {
        return sqlSession.selectOne("co1200Mapper.co1200SelApproval", param);
    }
}
