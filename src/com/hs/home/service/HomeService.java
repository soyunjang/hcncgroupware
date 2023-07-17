package com.hs.home.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import com.hs.an.service.HolidayOfficeNotSubmitDto;
import com.hs.an.service.UserAndHolidayInfoDto;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service("homeService")
public class HomeService {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeService.class);
	
	@Inject
	private SqlSession sqlSession; 
	
	/* 사용자 정보 조회 */
	public Map<String,Object> loginCheck(Map<String, Object> param) {
		
		Map<String,Object> rMap = new HashMap<String, Object>();
		
		rMap = sqlSession.selectOne("homeMapper.loginCheck", param);
		return rMap;
	}
	
	/* 사용자 권한별 메뉴 조회 */
	public List<Map<String,Object>> userMenuList(Map<String, Object> param, String id){
		
		param.put("USER_ID", id);
		logger.debug("HomeService > userMenuList ::::::::::::::::::::::::::::::::::::::: {}", param);	
		List<Map<String,Object>> rList = sqlSession.selectList("homeMapper.userMenuList", param);
		return rList;
	}

	/* 접속 정보 저장 */
	public void insertConnectInfo(Map<String, Object> param){
		sqlSession.insert("homeMapper.insertConnectInfo", param);
	}


	/* 연차 조회 */
	public List<UserAndHolidayInfoDto> userAndHolidayInfo() {
		return sqlSession.selectList("homeMapper.userAndHolidayInfo");
	}

	/* 연차 업데이트 */
	public void holidayInfoUpdate(String USER_ID, float HOLIDAY_TOTAL, float HOLIDAY_USE, float HOLIDAY_REMAIN, float HOLIDAY_DEDUCT) {
		sqlSession.update("homeMapper.userHolidayUpdate", new UserAndHolidayInfoDto(USER_ID, HOLIDAY_TOTAL, HOLIDAY_USE, HOLIDAY_REMAIN, HOLIDAY_DEDUCT));
	}

	public List<HolidayOfficeNotSubmitDto> holidayOfficeNotSubmitSelect() {
		return sqlSession.selectList("homeMapper.holidayOfficeNotSubmit");
	}

	public void holidayOfficeNotSubmitSave(List<HolidayOfficeNotSubmitDto> dto) {
		sqlSession.insert("homeMapper.holidayOfficeNotSubmitSave", dto);
	}
}