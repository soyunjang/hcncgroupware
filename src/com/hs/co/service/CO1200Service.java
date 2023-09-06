package com.hs.co.service;

import com.hs.home.controller.UserInfo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;

@Service("co1200Service")
public class CO1200Service {

	@Inject
	private SqlSession sqlSession;

	/**
	 * 메소드 설명 : 법인카드 사용내역 조회
	 * -------------------------------------------------------------------
	 * 
	 * @param Map 		param 검색조건 (조회기간, 판품번호, 성명, 부서)
	 * @return List 	list 법인카드 사용현황 목록
	 */
	public List<Map<String, Object>> co1200Sel(Map<String, Object> param, UserInfo user) {
		
		param.put("USER_ID", user.getUSER_ID());

		return sqlSession.selectList("co1200Mapper.co1200Sel", param);
	}

	public int co1200SelExpense(Map<String, Object> param) {
		int expensePrice =0;

		if(!param.get("SALES").toString().equals(""))
			expensePrice = sqlSession.selectOne("co1200Mapper.co1200SelExpense", param);

		return expensePrice;
	}

	public int co1200SelApproval(Map<String, Object> param) {
		int approval =0;

		approval = sqlSession.selectOne("co1200Mapper.co1200SelApproval", param);

		return approval;
	}
}
