package com.hs.common.service;

import com.hs.home.controller.UserInfo;
import com.hs.util.ExceptionLogDto;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Service("commonService")
public class CommonService {
	
	@Autowired
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
	public List<Map<String, Object>> getCommonCodeCard(Map<String, Object> param, UserInfo user){

		param.put("USER_ID", user.getUSER_ID());
		param.put("DEPT_CD", user.getDEPT_CD().substring(0,1));

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
	public void insertExceptionLog(ExceptionLogDto dto){
		sqlSession.insert("commonMapper.insertExceptionLog2", dto);
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

	public List<Map<String, Object>> selectSalesNum(Map<String, Object> params, HttpSession session) {
		return sqlSession.selectList("commonMapper.selectSalesNum", params);
	}
}