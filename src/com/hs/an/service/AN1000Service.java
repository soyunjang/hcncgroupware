package com.hs.an.service;

import com.hs.home.controller.UserInfo;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service("an1000Service")
@Transactional
public class AN1000Service {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	private enum Type {
		PLUS, MINUS
	}
	private final String [] HOLIDAY_CHECK_TYPE = {"ANNUAL", "HALF01", "HALF02", "OFFICE01"};


	@Inject
	private SqlSession sqlSession;

	/**
	 * 메소드 설명 : 사용자 연차정보 조회
	 * -------------------------------------------------------------------
	 *
	 * @param Map param 검색조건 (사용자ID)
	 * @return List    Map 연차정보 목록
	 */
	public Map<String, Object> an1000InfoSel(UserInfo user) {

		Map<String, Object> param = new HashMap();
		param.put("USER_ID", user.getUSER_ID());

		Map<String, Object> rMap = sqlSession.selectOne("an1000Mapper.an1000InfoSel", param);

		return rMap;
	}

	/**
	 * 메소드 설명 : 연차신청내역 조회
	 * -------------------------------------------------------------------
	 *
	 * @param Map param 검색조건 (사용자ID)
	 * @return List    list 사용자정보 목록
	 */
	public List<Map<String, Object>> an1000Sel(Map<String, Object> param, UserInfo user) {

		param.put("USER_ID", user.getUSER_ID());

		List<Map<String, Object>> rList = sqlSession.selectList("an1000Mapper.an1000Sel", param);
		List<Map<String, Object>> holidayCode = getHolidayCode();

		return rList.stream().map(item -> {
			String holidayType = (String) item.get("HOLIDAY_TYPE");
			holidayCode.forEach(code -> {
				String sysItemCd = (String) code.get("SYS_ITEM_CD");
				if (holidayType.equals(sysItemCd)) {
					item.put("HOLIDAY_TYPE", code.get("SYS_ITEM_NAME"));
				}
			});
			return item;
		}).collect(Collectors.toList());
	}

	/**
	 * 휴가 등록
	 */
	public void an1000Save(Map<String, Object> param, UserInfo user) {
		param.put("USER_ID", user.getUSER_ID());
		param.put("REG_ID", user.getUSER_ID());
		param.put("DEPT_CD", user.getDEPT_CD());
		param.put("POST_CD", user.getGRADE_CD());

		sqlSession.insert("an1000Mapper.an1000Save", param);
		if (Arrays.asList(HOLIDAY_CHECK_TYPE).indexOf(String.valueOf(param.get("HOLIDAY_TYPE"))) >= 0) {
			holidayInfoUpdate(Type.PLUS, user.getUSER_ID(), String.valueOf(param.get("HOLIDAY_TYPE")), Float.valueOf((String) param.get("HOLIDAY_CNT")));
		}

	}

	/**
	 * 휴가 신청 취소
	 */
	public void an1000Update(Map<String, Object> param, UserInfo user) {
		try {
			getHolidayCode().forEach(code -> {
				if (code.get("SYS_ITEM_NAME").equals(param.get("HOLIDAY_TYPE"))) {
					param.put("HOLIDAY_TYPE", code.get("SYS_ITEM_CD"));
					param.put("USER_ID", user.getUSER_ID());
				}
			});
			sqlSession.update("an1000Mapper.an1000Update", param);
		} catch (Exception e) {
			throw new RuntimeException("휴가 신청 취소 중 에러 발생", e);
		}

	}

	/**
	 * 회사 휴무일 조회
	 */
	public List an1000HolidayOfficeSel() {
		return sqlSession.selectList("an1000Mapper.an1000HolidayOfficeSel");
	}

	/**
	 * SYSCODE_DETAIL TABLE에서 HOLIDAY 정보 가져오기
	 */
	private List<Map<String, Object>> getHolidayCode() {
		Map<String, Object> holidayCode = new HashMap<>();
		holidayCode.put("SYS_CLASS_CD", "HOLIDAY");
		holidayCode.put("USE_YN", "Y");
		return sqlSession.selectList("cm1000Mapper.cm1000DetailSel", holidayCode);
	}

	private void holidayInfoUpdate(Type type, String userId, String holidayType, Float holidayCnt) {
		if (type.equals(Type.PLUS)) {
			Map<String, Object> list = sqlSession.selectOne("an1000Mapper.an1000HolidayInfoSel", userId);
			System.out.println("list = " + list);

//			sqlSession.update("an1000Mapper.an1000HolidayInfoUpdate");
		} else if (type.equals(Type.MINUS)) {

		}
	}
}
