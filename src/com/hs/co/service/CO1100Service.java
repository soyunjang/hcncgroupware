package com.hs.co.service;

import java.net.InetAddress;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.hs.home.controller.UserInfo;
import org.springframework.transaction.annotation.Transactional;

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
	public List<Map<String, Object>> co1100Sel(Map<String, Object> param, HttpSession session) {
		
		UserInfo vo = (UserInfo) session.getAttribute("User");
		param.put("USER_ID", vo.getUSER_ID());
		
		List<Map<String, Object>> rList = sqlSession.selectList("co1100Mapper.co1100Sel", param);
		
		return rList;
	}

	public List<Map<String, Object>> co1100SelProject(Map<String, Object> param) {

		List<Map<String, Object>> rList = sqlSession.selectList("co1100Mapper.co1100SelProject", param);

		return rList;
	}

	@Transactional
	public Map<String, Object> co1100Save(Map<String, Object> param, HttpSession session) {

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		UserInfo vo = (UserInfo) session.getAttribute("User");

		try {
			param.put("UPT_ID", vo.getUSER_ID());

			sqlSession.update("co1100Mapper.co1100Save", param);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}

		return rtnMap;
	}

	public int co1100MergeData(Map<String, Object> param, HttpSession session) {

		int resultCnt = 0;
		UserInfo vo = (UserInfo) session.getAttribute("User");

		for (String key : param.keySet()) {
			List<Map<String, Object>> dataList = (List<Map<String, Object>>) param.get(key);
			for (int j = 0; j < dataList.size(); j++) {
				dataList.get(j).put("UPT_ID", vo.getUSER_ID());
				Map<String, Object> dataMap = dataList.get(j);

				if (dataMap.get("action").equals("U")) {
					if(key == "table1") {
						sqlSession.insert("co1100Mapper.co1100Save", dataMap);
						resultCnt++;
					}
				}
			}
		}

		return resultCnt;
	}

	public Map<String, Object> selectCO1000List(Map<String, Object> param) {
		return sqlSession.selectOne("co1100Mapper.co1100SelList", param);
	}

	public List<Map<String, Object>> selectCO1001List(Map<String, Object> param) {
		return sqlSession.selectList("co1100Mapper.co1101SelList", param);
	}
}
