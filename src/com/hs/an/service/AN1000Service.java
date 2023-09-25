package com.hs.an.service;

import com.hs.an.dto.An1000PrintDto;
import com.hs.an.dto.HolidayInfoDto;
import com.hs.an.dto.HolidayPublicDto;
import com.hs.an.repository.An1000Repository;
import com.hs.home.controller.UserInfo;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static java.lang.String.valueOf;
import static java.util.Arrays.asList;

@Slf4j
@Service("an1000Service")
@Transactional
public class AN1000Service {

	@Autowired
	private An1000Repository an1000Repository;
	private final String[] HOLIDAY_CHECK_TYPE = {"ANNUAL", "HALF01", "HALF02", "OFFICE01"};
    protected enum Type {
		PLUS, MINUS
	}

	/**
	 * 사용자 연차정보 조회
	 * @return 사용자 휴가 신청 내역
	 */
	public Map<String, Object> an1000InfoSel(String targetId, UserInfo user) {
		try {
			Map<String, Object> param = new HashMap();
			if (targetId != null) {
				param.put("USER_ID", targetId);
			} else {
				param.put("USER_ID", user.getUSER_ID());
			}
			return an1000Repository.an1000InfoSel(param);
		} catch (Exception e) {
			throw new RuntimeException(this.getClass().getName() + ".an1000InfoSel", e);
		}
	}

	/**
	 * 메소드 설명 : 연차신청내역 조회
	 * @param param : 검색조건 (사용자ID)
	 * @return List    list 사용자정보 목록
	 */
	public List<Map<String, Object>> an1000Sel(Map<String, Object> param, UserInfo user) {
		try {
			if (param.isEmpty()) {
				param.put("USER_ID", user.getUSER_ID());
			}
			return an1000Repository.an1000Sel(param);
		} catch (Exception e) {
			throw new RuntimeException(this.getClass().getName() + ".an1000Sel", e);
		}
	}

	/**
	 * 해당 월에 회사 휴무일관련 등록 확인 로직
	 * 결과값 : 0 (미등록), 1('OFFICE01', 'OFFICE02' 둘 중 하나 등록)
	 */
	public Integer an1000HolidayOfficeByUser(UserInfo user) {
		try {
			return an1000Repository.an1000HolidayOfficeByUser(user);
		} catch (Exception e) {
			throw new RuntimeException(this.getClass().getName() + ".an1000HolidayOfficeByUser", e);
		}
	}

	/**
	 * 휴가 등록
	 */
	public void an1000Save(Map<String, Object> param, UserInfo user) {
		try {
			param.put("REG_ID", user.getUSER_ID());

			an1000Repository.an1000Save(param);

			// 휴가 등록하는 사람 확인 HOLIDAY_INFO 테이블 수정
			if (param.get("USER_ID").equals(user.getUSER_ID())) {
				holidayInfoUpdate(param, user, Type.PLUS);
			} else {
				holidayInfoUpdate(param, new UserInfo(String.valueOf(param.get("USER_ID"))), Type.PLUS);
			}
		} catch (Exception e) {
			throw new RuntimeException(this.getClass().getName() + ".an1000Save : 휴가 등록 에러 발생", e);
		}
	}

	/**
	 * 휴가 신청 취소
	 */
	public void an1000Update(Map<String, Object> param, UserInfo user) {
		try {
			// SYS_ITEM_NAME -> SYS_ITEM_CD 로 변경(예 : 연차 -> ANNUAL)
			getHolidayCode().forEach(code -> {
				if (code.get("SYS_ITEM_NAME").equals(param.get("HOLIDAY_TYPE"))) {
					param.put("HOLIDAY_TYPE", code.get("SYS_ITEM_CD"));
				}
			});
			param.put("UPT_ID", user.getUSER_ID());

			an1000Repository.an1000Update(param);

			// 휴가 등록하는 사람 확인 HOLIDAY_INFO 테이블 수정
			if (param.get("USER_ID").equals(user.getUSER_ID())) {
				holidayInfoUpdate(param, user, Type.MINUS);
			} else {
				holidayInfoUpdate(param, new UserInfo(String.valueOf(param.get("USER_ID"))), Type.MINUS);
			}
		} catch (Exception e) {
			throw new RuntimeException(this.getClass().getName() + ".an1000Update : 휴가 신청 취소 에러 발생", e);
		}
	}

	public Map<String, Object> an1000GetHolidayAfterSave(Map<String, Object> param) {
		try {
			return an1000Repository.an1000GetHolidayAfterSave(param);
		} catch (Exception e) {
			throw new RuntimeException(this.getClass().getName() + ".an1000GetHolidayAfterSave", e);
		}
	}


	/**
	 * 휴가 출력 조회
	 */
	public Map<String, Object> an1000PrintByUser(An1000PrintDto dto) {
		try {
			return an1000Repository.an1000PrintByUser(dto);
		} catch (Exception e) {
			throw new RuntimeException(this.getClass().getName() + ".an1000PrintByUser : 휴가신청서 출력 조회 중 에러 발생", e);
		}
	}

	/**
	 * 회사 휴무일 조회
	 */
	public List an1000HolidayOfficeSel() {
		try {
			return an1000Repository.an1000HolidayOfficeSel();
		} catch (Exception e) {
			throw new RuntimeException(this.getClass().getName() + ".an1000HolidayOfficeSel", e);
		}
	}

	/**
	 * SYSCODE_DETAIL TABLE에서 HOLIDAY 정보 가져오기
	 */
	private List<Map<String, Object>> getHolidayCode() {
		try {
			Map<String, Object> holidayCode = new HashMap<>();
			holidayCode.put("SYS_CLASS_CD", "HOLIDAY");
			holidayCode.put("USE_YN", "Y");
			return an1000Repository.getHolidayCode(holidayCode);
		} catch (Exception e) {
			throw new RuntimeException(this.getClass().getName() + ".getHolidayCode", e);
		}
	}

	/**
	 * 휴가(연차, 반차, 회사휴무) 신청 및 취소에 따른 Table(HOLIDAY_INFO) Update
	 */
	protected void holidayInfoUpdate(Map<String, Object> param, UserInfo user, Type type) {
		try {
			if (asList(HOLIDAY_CHECK_TYPE).indexOf(valueOf(param.get("HOLIDAY_TYPE"))) >= 0) {
				float holidayCnt = Float.valueOf((String) param.get("HOLIDAY_CNT"));
				HolidayInfoDto dto = an1000Repository.an1000HolidayInfoSel(user.getUSER_ID());
				log.info("before: {}", dto);

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
						log.info("holidayInfoUpdate.(type.equals(Type.PLUS)).else");
					}
				} else if (type.equals(Type.MINUS)) {
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
						log.info("holidayInfoUpdate.(type.equals(Type.MINUS)).else");
					}
				} else {
					log.info("holidayInfoUpdate.else");
				}
				log.info("after: {}", dto);
				an1000Repository.an1000HolidayInfoUpdate(dto);
			}
		} catch (Exception e) {
			throw new RuntimeException(this.getClass().getName() + ".holidayInfoUpdate", e);
		}
	}

	public List<String> an1000PublicHolidaySel(String startDate, String endDate) {
		try {
			Map<String, Object> param = new HashMap<>();
			param.put("startDate", startDate);
			param.put("endDate", endDate);
			return an1000Repository.an1000PublicHolidaySel(param);
		} catch (Exception e) {
			throw new RuntimeException(this.getClass().getName() + ".an1000PublicHolidaySel", e);
		}

	}

	public void an1000PublicHolidaySave(List<HolidayPublicDto> result) {
		try {
			List<String> list = an1000PublicHolidaySel(LocalDate.now().toString(), "");
			if (list.isEmpty()) {
				an1000Repository.an1000PublicHolidaySave(result);
			} else {
				List<String> replaceList = list.stream().map(item -> item.replace("-", "")).collect(Collectors.toList());
				List<HolidayPublicDto> collect = result.stream().filter(res -> replaceList.indexOf(res.getPublicDay()) < 0).collect(Collectors.toList());
				if (!collect.isEmpty()) {
					an1000Repository.an1000PublicHolidaySave(collect);
				}
			}
		} catch (Exception e) {
			new RuntimeException("공휴일 저장 에러 발생", e);
		}
	}

	/**
	 * 메소드 설명 : 사용자정보 조회
	 * @param Map 		param 검색조건 (사용자ID/사용자명)
	 * @return List 	list 사용자정보 목록
	 */
	public List<Map<String, Object>> an1000SelUser(Map<String, Object> param) {
		try {
			return an1000Repository.an1000SelUser(param);
		} catch (Exception e) {
			throw new RuntimeException(this.getClass().getName() + ".an1000SelUser", e);
		}
	}

}
