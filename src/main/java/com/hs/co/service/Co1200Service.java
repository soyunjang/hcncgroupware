package com.hs.co.service;

import com.hs.co.repository.Co1200Repository;
import com.hs.home.controller.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class Co1200Service {

	@Autowired
	private Co1200Repository co1200Repository;

	/**
	 * 메소드 설명 : 법인카드 사용내역 조회
	 * -------------------------------------------------------------------
	 * 
	 * @param Map 		param 검색조건 (조회기간, 판품번호, 성명, 부서)
	 * @return List 	list 법인카드 사용현황 목록
	 */
	public List<Map<String, Object>> co1200Sel(Map<String, Object> param, UserInfo user) {
		param.put("USER_ID", user.getUSER_ID());
		return co1200Repository.co1200Sel(param);
	}

	public int co1200SelExpense(Map<String, Object> param) {
		int expensePrice = 0;

		if (!param.get("SALES").toString().equals("")) {
			expensePrice = co1200Repository.co1200SelExpense(param);
		}

		return expensePrice;
	}

	public int co1200SelApproval(Map<String, Object> param) {
		return co1200Repository.co1200SelApproval(param);
	}
}
