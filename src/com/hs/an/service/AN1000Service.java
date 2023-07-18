package com.hs.an.service;

import com.hs.an.dto.HolidayInfoDto;
import com.hs.home.controller.UserInfo;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static java.lang.String.valueOf;
import static java.util.Arrays.asList;

@Transactional
@Service("an1000Service")
public class AN1000Service {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String[] HOLIDAY_CHECK_TYPE = {"ANNUAL", "HALF01", "HALF02", "OFFICE01"};
	protected enum Type {
		PLUS, MINUS
	}

	@Autowired
	private SqlSession sqlSession;

	/**
	 * 사용자 연차정보 조회
	 * @return 사용자 휴가 신청 내역
	 */
	public Map<String, Object> an1000InfoSel(UserInfo user) {

		Map<String, Object> param = new HashMap();
		param.put("USER_ID", user.getUSER_ID());

		Map<String, Object> rMap = sqlSession.selectOne("an1000Mapper.an1000InfoSel", param);

		return rMap;
	}

	/**
	 * 메소드 설명 : 연차신청내역 조회
	 * @param param : 검색조건 (사용자ID)
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
	 * 해당 월에 회사 휴무일관련 등록 확인 로직
	 * 결과값 : 0 (미등록), 1('OFFICE01', 'OFFICE02' 둘 중 하나 등록)
	 */
	public Integer an1000HolidayOfficeByUser(UserInfo user) {
		return sqlSession.selectOne("an1000HolidayOfficeByUser", user.getUSER_ID());
	}

	/**
	 * 휴가 등록
	 */
	public void an1000Save(Map<String, Object> param, UserInfo user) {
		param.put("USER_ID", user.getUSER_ID());
		param.put("REG_ID", user.getUSER_ID());
		param.put("DEPT_CD", user.getDEPT_CD());
		param.put("POST_CD", user.getGRADE_CD());
		logger.info(user.getUSER_ID() + ": " + param);

		try {
			sqlSession.insert("an1000Mapper.an1000Save", param);
			holidayInfoUpdate(param, user, Type.PLUS);
		} catch (Exception e) {
			throw new RuntimeException("휴가 등록 에러 발생", e);
		}

	}

	/**
	 * 휴가 신청 취소
	 */
	public void an1000Update(Map<String, Object> param, UserInfo user) {
		logger.info(param.toString());
		try {
			// SYS_ITEM_NAME -> SYS_ITEM_CD 로 변경(예 : 연차 -> ANNUAL)
			getHolidayCode().forEach(code -> {
				if (code.get("SYS_ITEM_NAME").equals(param.get("HOLIDAY_TYPE"))) {
					param.put("HOLIDAY_TYPE", code.get("SYS_ITEM_CD"));
					param.put("USER_ID", user.getUSER_ID());
				}
			});
			sqlSession.update("an1000Mapper.an1000Update", param);
			holidayInfoUpdate(param, user, Type.MINUS);
		} catch (Exception e) {
			throw new RuntimeException("휴가 신청 취소 에러 발생", e);
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

	/**
	 * 휴가(연차, 반차, 회사휴무) 신청 및 취소에 따른 Table(HOLIDAY_INFO) Update
	 */
	protected void holidayInfoUpdate(Map<String, Object> param, UserInfo user, Type type) {
		if (asList(HOLIDAY_CHECK_TYPE).indexOf(valueOf(param.get("HOLIDAY_TYPE"))) >= 0) {
			float holidayCnt = Float.valueOf((String) param.get("HOLIDAY_CNT"));
			HolidayInfoDto dto = sqlSession.selectOne("an1000Mapper.an1000HolidayInfoSel", user.getUSER_ID());
			logger.info("before: {}", dto);

			if (type.equals(Type.PLUS)) {
				if (dto.getHoliday_total() > dto.getHoliday_use()) {
					// 연차보유일수 > 사용일수 && 사용일수 > 신청일수
					if (dto.getHoliday_remain() >= holidayCnt) {
						// 휴가 잔여 >= 신청일수
						dto.setHoliday_use(dto.getHoliday_use() + holidayCnt);
						dto.setHoliday_remain(dto.getHoliday_remain() - holidayCnt);
					} else {
						// 휴가 잔여 < 신청일수
						dto.setHoliday_deduct(holidayCnt - dto.getHoliday_remain());
						dto.setHoliday_use(dto.getHoliday_total());
						dto.setHoliday_remain(0);
					}
				} else if (dto.getHoliday_total() == dto.getHoliday_use()) {
					// 연차보유일수 == 사용일수
					dto.setHoliday_deduct(dto.getHoliday_deduct() + holidayCnt);
				} else {
					logger.info("holidayInfoUpdate.(type.equals(Type.PLUS)).else");
				}
			}else if (type.equals(Type.MINUS)) {
				if (dto.getHoliday_total() > dto.getHoliday_use()) {
					// 연차보유일수 > 사용일수
					dto.setHoliday_use(dto.getHoliday_use() - holidayCnt);
					dto.setHoliday_remain(dto.getHoliday_remain() + holidayCnt);
				} else if (dto.getHoliday_total() == dto.getHoliday_use()) {
					// 연차보유일수 == 사용일수
					if (dto.getHoliday_deduct() <= 0) {
						// 공제일수 <= 0
						dto.setHoliday_use(dto.getHoliday_use() - holidayCnt);
						dto.setHoliday_remain(dto.getHoliday_remain() + holidayCnt);
					} else {
						// 공제일수 > 0
						if (holidayCnt <= dto.getHoliday_deduct()) {
							// 휴가일수 <= 공제일수
							dto.setHoliday_deduct(dto.getHoliday_deduct() - holidayCnt);
						} else {
							// 휴가일수 > 공제일수
							dto.setHoliday_remain(holidayCnt - dto.getHoliday_deduct());
							dto.setHoliday_use(dto.getHoliday_total() - dto.getHoliday_remain());
							dto.setHoliday_deduct(0);
						}
					}
				} else {
					logger.info("holidayInfoUpdate.(type.equals(Type.MINUS)).else");
				}
			} else {
				logger.info("holidayInfoUpdate.else");
			}
			logger.info("after: {}", dto);
			sqlSession.update("an1000Mapper.an1000HolidayInfoUpdate", dto);
		}
	}

}
