package com.hs.co.service;

import com.hs.home.controller.UserInfo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Transactional
@Service("co1100Service")
public class CO1100Service {

	@Inject
	private SqlSession sqlSession;

	/**
	 * 메소드 설명 : 법인카드 사용내역 조회
	 * -------------------------------------------------------------------
	 * 
	 * @param Map 		param 검색조건 (조회기간, 판품번호, 성명, 부서)
	 * @return List 	list 법인카드 사용현황 목록
	 */
	public List<Map<String, Object>> co1100Sel(Map<String, Object> param, UserInfo user) {
		
		param.put("USER_ID", user.getUSER_ID());
		param.put("DEPT_CD", user.getDEPT_CD().substring(0, 1));

		return sqlSession.selectList("co1100Mapper.co1100Sel", param);
	}

	public List<Map<String, Object>> co1100SelProject(Map<String, Object> param) {

		return sqlSession.selectList("co1100Mapper.co1100SelProject", param);
	}

	public Map<String, Object> co1100Save(Map<String, Object> param, UserInfo user) {

		Map<String, Object> rtnMap = new HashMap<>();

		try {
			param.put("UPT_ID", user.getUSER_ID());

			sqlSession.update("co1100Mapper.co1100Save", param);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}

		return rtnMap;
	}

	/**
	 * 법인카드관리 -> 개인별 사용내역 등록에서 저장
	 */
	public int co1100MergeData(Map<String, Object> param, UserInfo user) {
		int resultCnt = 0;
		List<Map<String, Object>> target = new ArrayList<>();

		for (String key : param.keySet()) {
			if (key == "table1") {
				List<Map<String, Object>> data = (List<Map<String, Object>>) param.get(key);
				for (int i = 0; i < data.size(); i++) {
					data.get(i).put("UPT_ID", user.getUSER_ID());
					Map<String, Object> dataMap = data.get(i);

					if (dataMap.get("action").equals("U") && !(dataMap.get("BREAKDOWN").toString().trim()).equals("")) {
						target.add(dataMap);
						resultCnt++;
					}
					if (target.size() == 100) {
						sqlSession.update("co1100Mapper.co1100Update", target);
						target.clear();
					}
				}
			}
		}
		sqlSession.update("co1100Mapper.co1100Update", target);
		return resultCnt;
	}

	public Map<String, Object> selectCO1000List(Map<String, Object> param) {
		return sqlSession.selectOne("co1100Mapper.co1100SelList", param);
	}

	public List<Map<String, Object>> selectCO1001List(Map<String, Object> param) {
		return sqlSession.selectList("co1100Mapper.co1101SelList", param);
	}
}
