package com.hs.an.repository;

import com.hs.an.dto.An1000PrintDto;
import com.hs.an.dto.HolidayInfoDto;
import com.hs.an.dto.HolidayPublicDto;
import com.hs.home.controller.UserInfo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class An1000Repository {

    private final SqlSession sqlSession;

    @Autowired
    public An1000Repository(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public Map<String, Object> an1000InfoSel(Map<String, Object> param) {
        return sqlSession.selectOne("an1000Mapper.an1000InfoSel", param);
    }

    public List<Map<String, Object>> an1000Sel(Map<String, Object> param) {
        return sqlSession.selectList("an1000Mapper.an1000Sel", param);
    }

    public List<Map<String, Object>> an1000HolidayOfficeByUser(UserInfo user) {
        return sqlSession.selectList("an1000HolidayOfficeByUser", user.getUSER_ID());
    }

    public void an1000Save(Map<String, Object> param) {
        sqlSession.insert("an1000Mapper.an1000Save", param);
    }

    public void an1000Update(Map<String, Object> param) {
        sqlSession.update("an1000Mapper.an1000Update", param);
    }

    public Map<String, Object> an1000GetHolidayAfterSave(Map<String, Object> param) {
        return sqlSession.selectOne("an1000Mapper.an1000GetHolidayAfterSave", param);
    }

    public Map<String, Object> an1000PrintByUser(An1000PrintDto dto) {
        return sqlSession.selectOne("an1000Mapper.an1000PrintByUser", dto);
    }

    public List<Map<String, Object>> getHolidayCode(Map<String, Object> holidayCode) {
        return sqlSession.selectList("cm1000Mapper.cm1000DetailSel", holidayCode);
    }

    public List<String> an1000PublicHolidaySel(Map<String, Object> param) {
        return sqlSession.selectList("an1000Mapper.an1000PublicHolidaySel", param);
    }

    public void an1000PublicHolidaySave(List<HolidayPublicDto> result) {
        sqlSession.insert("an1000Mapper.an1000PublicHolidaySave", result);
    }

    public List<Map<String, Object>> an1000SelUser(Map<String, Object> param) {
        return sqlSession.selectList("an1000Mapper.an1000SelUser", param);
    }

    public HolidayInfoDto an1000HolidayInfoSel(String userId) {
        return sqlSession.selectOne("an1000Mapper.an1000HolidayInfoSel", userId);
    }

    public void an1000HolidayInfoUpdate(HolidayInfoDto dto) {
        sqlSession.update("an1000Mapper.an1000HolidayInfoUpdate", dto);
    }
}
