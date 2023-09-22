package com.hs.an.service;

import com.hs.an.repository.An1200Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("an1200Service")
public class AN1200Service {

	private final An1200Repository an1200Repository;

	@Autowired
	public AN1200Service(An1200Repository an1200Repository) {
		this.an1200Repository = an1200Repository;
	}

	/**
	 * 메소드 설명 : 휴가사용현황 조회
	 */
	public List<Map<String, Object>> an1200Sel(Map<String, Object> param) {
		try {
			return an1200Repository.an1200Sel(param);
		} catch (Exception e) {
			throw new RuntimeException(this.getClass() + ".an1200Sel : 날짜별 연차현황 조회 에러", e);
		}
	}

	public int an1200Count() {
		try {
			return an1200Repository.an1200Count();
		} catch (Exception e) {
			throw new RuntimeException("날짜별 연차현황 사용/미사용 인원 체크 에러", e);
		}
	}
}
