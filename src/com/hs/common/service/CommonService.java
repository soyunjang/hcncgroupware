package com.hs.common.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.hs.home.controller.UserInfo;

@Service("commonService")
public class CommonService {
	
	@Inject
	private SqlSession sqlSession;
	
	/* 다국어 조회 */
	public List<Map<String, Object>> getLangCode(Map<String, Object> param){
		return sqlSession.selectList("commonMapper.getLangCode", param);
	}

	/* 공통코드 조회 */
	public List<Map<String, Object>> getCommonCode(Map<String, Object> param){
		return sqlSession.selectList("commonMapper.getCommonCode", param);
	}

	/* 공통코드 조회(SORT) */
	public List<Map<String, Object>> getCommonCodeEsc(Map<String, Object> param){
		return sqlSession.selectList("commonMapper.getCommonCodeEsc", param);
	}

	/* 사용자별 카드정보 조회(SORT) */
	public List<Map<String, Object>> getCommonCodeCard(Map<String, Object> param, HttpSession session){

		UserInfo vo = (UserInfo) session.getAttribute("User");

		param.put("USER_ID", vo.getUSER_ID());
		return sqlSession.selectList("commonMapper.getCommonCodeCard", param);
	}

	/* 권한분류 조회 */
	public List<Map<String, Object>> getAuthCode() {
		return sqlSession.selectList("commonMapper.getAuthCode");
	}

	/* 로그 저장 */
	public void insertMenuLog(Map<String, Object> param){
		sqlSession.insert("commonMapper.insertMenuLog", param);
	}
	
	/* 예외사항 저장 */
	public void insertExceptionLog(Map<String, Object> param){
		sqlSession.insert("commonMapper.insertExceptionLog", param);
	}

	/* 권한부여/변경 사항 저장 */
	public void insertAuthChange(Map<String, Object> param) {
		sqlSession.insert("commonMapper.insertAuthChange", param);
	}

	/* list > json 변환 */
	public JSONArray covertListToJson(List<Map<String, Object>> list) {

		JSONArray jsonArray = new JSONArray();

		for (Map<String, Object> map : list) {
			jsonArray.put(convertMapToJson(map));
		}

		return jsonArray;
	}

	/* map > json 변환 */
	public JSONObject convertMapToJson(Map<String, Object> map) {

		JSONObject json = new JSONObject();

		for (Map.Entry<String, Object> entry : map.entrySet()) {
			json.put(entry.getKey(), entry.getValue());
		}

		return json;
	}

	/* 시스템코드 목록 */
	public List<Map<String, Object>> selectLists(Map<String, Object> params) {
				
		return sqlSession.selectList("commonMapper.selectLists", params);
	}
	
}