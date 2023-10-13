package com.hs.co.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class Co1100Repository {

    private final SqlSession sqlSession;

    @Autowired
    public Co1100Repository(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public List<Map<String, Object>> co1100Sel(Map<String, Object> param) {
        return sqlSession.selectList("co1100Mapper.co1100Sel", param);
    }

    public List<Map<String, Object>> co1100SelProject(Map<String, Object> param) {
        return sqlSession.selectList("co1100Mapper.co1100SelProject", param);
    }

    public void co1100Save(Map<String, Object> param) {
        sqlSession.update("co1100Mapper.co1100Save", param);
    }

    public void co1100MergeData(List<Map<String, Object>> target) {
        sqlSession.update("co1100Mapper.co1100Update", target);
    }

    public Map<String, Object> selectCo1000List(Map<String, Object> param) {
        return sqlSession.selectOne("co1100Mapper.co1100SelList", param);
    }

    public List<Map<String, Object>> selectCo1001List(Map<String, Object> param) {
        return sqlSession.selectList("co1100Mapper.co1101SelList", param);
    }
}
