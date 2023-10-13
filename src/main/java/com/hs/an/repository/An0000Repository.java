package com.hs.an.repository;

import com.hs.an.dto.HolidayInfoInsertDto;
import com.hs.an.dto.HolidayOfficeNotSubmitDto;
import com.hs.an.dto.UserAndHolidayInfoDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class An0000Repository {

    private final SqlSession sqlSession;

    @Autowired
    public An0000Repository(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public void holidayInfoInsert(HolidayInfoInsertDto dto) {
        sqlSession.insert("an0000Mapper.holidayInfoInsert", dto);
    }

    /* 연차 업데이트 */
    public void holidayInfoUpdate(String USER_ID, float HOLIDAY_TOTAL, float HOLIDAY_USE, float HOLIDAY_REMAIN, float HOLIDAY_DEDUCT) {
        sqlSession.update("an0000Mapper.userHolidayUpdate", new UserAndHolidayInfoDto(USER_ID, HOLIDAY_TOTAL, HOLIDAY_USE, HOLIDAY_REMAIN, HOLIDAY_DEDUCT));
    }

    /* 연차 조회 */
    public List<UserAndHolidayInfoDto> userAndHolidayInfo() {
        return sqlSession.selectList("an0000Mapper.userAndHolidayInfo");
    }

    public List<HolidayOfficeNotSubmitDto> holidayOfficeNotSubmitSelect() {
        return sqlSession.selectList("an0000Mapper.holidayOfficeNotSubmit");
    }

    public void holidayOfficeNotSubmitSave(List<HolidayOfficeNotSubmitDto> dto) {
        sqlSession.insert("an0000Mapper.holidayOfficeNotSubmitSave", dto);
    }
}
