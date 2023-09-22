package com.hs.an.service;

import com.hs.an.repository.An1100Repository;
import com.hs.home.controller.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("an1100Service")
public class AN1100Service {

	private final An1100Repository an1100Repository;

	@Autowired
	public AN1100Service(An1100Repository an1100Repository) {
		this.an1100Repository = an1100Repository;
	}

	/**
	 * 메소드 설명 : 휴가사용현황 조회
	 */
	public List<Map<String, Object>> an1100Sel(Map<String, Object> param, UserInfo user) {
		try {
			param.put("USER_ID", user.getUSER_ID());
			return an1100Repository.an1100Sel(param);
		} catch (Exception e) {
			throw new RuntimeException(this.getClass().getName() + ".an1100Sel", e);
		}
	}
	
}
