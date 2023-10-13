package com.hs.home.service;

import com.hs.an.dto.HolidayOfficeNotSubmitDto;
import com.hs.an.dto.UserAndHolidayInfoDto;
import com.hs.home.controller.UserInfo;
import com.hs.home.controller.UserPasswordDto;
import com.hs.util.UserInfoEncrypt;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service("homeService")
public class HomeService {
	
	@Autowired
	private SqlSession sqlSession; 
	
	/* 사용자 정보 조회 */
	public Optional<UserInfo> loginCheck(Map<String, Object> param) {
		return Optional.ofNullable(sqlSession.selectOne("homeMapper.loginCheck", param));
	}
	
	/* 사용자 권한별 메뉴 조회 */
	public List<Map<String,Object>> userMenuList(UserInfo userInfo){
		return sqlSession.selectList("homeMapper.userMenuList", userInfo);
	}

	/* 접속 정보 저장 */
	public void insertConnectInfo(Map<String, Object> param){
		sqlSession.insert("homeMapper.insertConnectInfo", param);
	}


	/* 연차 조회 */
//	public List<UserAndHolidayInfoDto> userAndHolidayInfo() {
//		return sqlSession.selectList("homeMapper.userAndHolidayInfo");
//	}

	/* 연차 업데이트 */
//	public void holidayInfoUpdate(String USER_ID, float HOLIDAY_TOTAL, float HOLIDAY_USE, float HOLIDAY_REMAIN, float HOLIDAY_DEDUCT) {
//		sqlSession.update("homeMapper.userHolidayUpdate", new UserAndHolidayInfoDto(USER_ID, HOLIDAY_TOTAL, HOLIDAY_USE, HOLIDAY_REMAIN, HOLIDAY_DEDUCT));
//	}

//	public List<HolidayOfficeNotSubmitDto> holidayOfficeNotSubmitSelect() {
//		return sqlSession.selectList("homeMapper.holidayOfficeNotSubmit");
//	}

//	public void holidayOfficeNotSubmitSave(List<HolidayOfficeNotSubmitDto> dto) {
//		sqlSession.insert("homeMapper.holidayOfficeNotSubmitSave", dto);
//	}

	public void userPasswordModify(UserPasswordDto dto, UserInfo user) {
		try {
			Map<String, Object> param = new HashMap<>();
			param.put("PASSWORD", UserInfoEncrypt.encryptStringData(dto.getPassword1()));
			param.put("USER_ID", user.getUSER_ID());
			param.put("USER_NM", user.getUSER_NM());

			sqlSession.update("homeMapper.userPasswordModify", param);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}