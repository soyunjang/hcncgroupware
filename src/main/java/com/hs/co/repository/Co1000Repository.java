package com.hs.co.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class Co1000Repository {

    private final SqlSession sqlSession;

    @Autowired
    public Co1000Repository(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public List<Map<String, Object>> co1000SelTemp(Map<String, Object> param) {
        return sqlSession.selectList("co1000Mapper.co1000SelTemp", param);
    }

    public void co1000Delete(Map<String, Object> param) {
        sqlSession.delete("co1000Mapper.co1000Delete", param);
    }

    public int co1000MergeDataSave(Map<String, Object> param) {
        return sqlSession.insert("co1000Mapper.co1000Ins", param);
    }

    public int tempDataInsert(List<Map<String, Object>> mapList) {
        return sqlSession.insert("co1000Mapper.co1000InsTmp", mapList);
    }

    public List<Map<String, Object>> co1000SelectTagGet(String userId) {
        return sqlSession.selectList("co1000Mapper.co1000SelectTagGet",userId);
    }

    public List<Map<String, Object>> co1000SelectGet(Map<String, Object> param) {
        return sqlSession.selectList("co1000Mapper.co1000SelectGet", param);
    }

    public int co1000SelectCheck(Map<String, Object> param) {
        return sqlSession.selectOne("co1000Mapper.co1000SelectCheck", param);
    }

    public void co1000SelectDelete(Map<String, Object> param) {
        sqlSession.delete("co1000Mapper.co1000SelectDelete", param);
    }
}
