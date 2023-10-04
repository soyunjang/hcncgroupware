package com.hs.an.repository;

import com.hs.an.dto.PublicOfficeRequestDto;
import com.hs.an.dto.PublicOfficeResponseDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class An1400Repository {

    private final SqlSession sqlSession;

    @Autowired
    public An1400Repository(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public List<Map<String, Object>> an1400Years() {
        return sqlSession.selectList("an1400Mapper.an1400years");
    }

    public List<PublicOfficeResponseDto> an1400Dates(Map<String, Object> param) {
        return sqlSession.selectList("an1400Mapper.an1400Dates", param);
    }

    public void an1400Save(PublicOfficeRequestDto dto) {
        sqlSession.insert("an1400Mapper.an1400Save", dto);
    }

    public void an1400Delete(PublicOfficeRequestDto dto) {
        sqlSession.delete("an1400Mapper.an1400Delete", dto);
    }

    public void an1400Update(PublicOfficeRequestDto dto) {
        sqlSession.update("an1400Mapper.an1400Update", dto);
    }
}
