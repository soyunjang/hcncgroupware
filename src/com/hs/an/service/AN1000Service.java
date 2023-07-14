package com.hs.an.service;

import com.hs.cm.service.CM1000Service;
import com.hs.home.controller.UserInfo;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service("an1000Service")
public class AN1000Service {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Inject
	private SqlSession sqlSession;

	/**
	 * 메소드 설명 : 사용자 연차정보 조회
	 * -------------------------------------------------------------------
	 * 
	 * @param Map 		param 검색조건 (사용자ID)
	 * @return List 	Map 연차정보 목록
	 */
	public Map<String,Object> an1000InfoSel(UserInfo user) {
		
		Map<String, Object> param = new HashMap();
		param.put("USER_ID", user.getUSER_ID());
		
		Map<String, Object> rMap = sqlSession.selectOne("an1000Mapper.an1000InfoSel", param);
		
		return rMap;
	}
	
	/**
	 * 메소드 설명 : 연차신청내역 조회
	 * -------------------------------------------------------------------
	 * 
	 * @param Map 		param 검색조건 (사용자ID)
	 * @return List 	list 사용자정보 목록
	 */
	public List<Map<String, Object>> an1000Sel(Map<String, Object> param, UserInfo user) {

		param.put("USER_ID", user.getUSER_ID());

		Map<String, Object> holidayCode = new HashMap<>();
		holidayCode.put("SYS_CLASS_CD", "HOLIDAY");
		holidayCode.put("USE_YN", "Y");

		List<Map<String, Object>> holidayCodes = sqlSession.selectList("cm1000Mapper.cm1000DetailSel", holidayCode);

		List<Map<String, Object>> rList = sqlSession.selectList("an1000Mapper.an1000Sel", param);

		return rList.stream().map(item -> {
			String holidayType = (String) item.get("HOLIDAY_TYPE");
			holidayCodes.forEach(code -> {
				String sysItemCd = (String) code.get("SYS_ITEM_CD");
				if (holidayType.equals(sysItemCd)) {
					item.put("HOLIDAY_TYPE", code.get("SYS_ITEM_NAME"));
				}
			});
			return item;
		}).collect(Collectors.toList());
	}

	public void an1000Save(Map<String, Object> param, UserInfo user) {
		param.put("USER_ID", user.getUSER_ID());
		param.put("REG_ID", user.getUSER_ID());
		param.put("DEPT_CD", user.getDEPT_CD());
		param.put("POST_CD", user.getGRADE_CD());
		sqlSession.insert("an1000Mapper.an1000Save", param);
	}

	public void an1000Update(Map<String, Object> param, UserInfo user) {
		param.put("USER_ID", user.getUSER_ID());
		sqlSession.update("an1000Mapper.an1000Update", param);
	}

	public List an1000HolidayOfficeSel() {
		return sqlSession.selectList("an1000Mapper.an1000HolidayOfficeSel");
	}
}
