package com.hs.cm.service;

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

@Transactional
@Service("cm1000Service")
public class CM1000Service {

	@Autowired
	private SqlSession sqlSession;

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	/**
	 * 메소드 설명 : 시스템코드 조회
	 * -------------------------------------------------------------------
	 * @param Map param 검색조건 (시스템코드/시스템명/사용유무)
	 * @return List list 시스템코드목록
	 */
	public List<Map<String, Object>> cm1000HeadSel(Map<String, Object> param) {
		return sqlSession.selectList("cm1000Mapper.cm1000HeadSel", param);
	}

	/**
	 * 메소드 설명 : 세부코드 조회
	 * -------------------------------------------------------------------
	 * @param Map param 검색조건 (시스템코드/사용유무)
	 * @return List list 세부코드목록
	 */
	public List<Map<String, Object>> cm1000DetailSel(Map<String, Object> param) {
		return sqlSession.selectList("cm1000Mapper.cm1000DetailSel", param);
	}

	/**
	 * 메소드 설명 : 시스템코드 중복확인
	 * -------------------------------------------------------------------
	 * @param Map param 검색조건 (시스템코드)
	 * @return Map map 중복 갯수
	 */
	public Map<String, Object> cm1000HeadCnt(Map<String, Object> param) {
		return sqlSession.selectOne("cm1000Mapper.cm1000HeadCnt", param);
	}

	/**
	 * 메소드 설명 : 세부코드 중복확인
	 * -------------------------------------------------------------------
	 * @param Map param 검색조건 (시스템코드/세부코드)
	 * @return Map map 중복 갯수
	 */
	public Map<String, Object> cm1000DetailCnt(Map<String, Object> param) {
		return sqlSession.selectOne("cm1000Mapper.cm1000DetailCnt", param);
	}

	/**
	 * 메소드 설명 : 시스템코드 추가
	 * -------------------------------------------------------------------
	 * @param Map param 추가할 정보(시스템코드/시스템명/사용유무/비고)
	 * @return Map rtnMap 추가 성공/실패 확인(0:성공/1:실패)
	 */
	public Map<String, Object> cm1000HeadSave(Map<String, Object> param, UserInfo user) {

		Map<String, Object> rtnMap = new HashMap<>();

		try {
			param.put("USER_ID", user.getUSER_ID());

			int count = sqlSession.selectOne("cm1000Mapper.cm1000HeadCount", param);

			if (count > 0) {
				sqlSession.update("cm1000Mapper.cm1000HeadUpdate", param);
			} else {
				sqlSession.insert("cm1000Mapper.cm1000HeadSave", param);
			}
		} catch (Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
		return rtnMap;
	}

	/**
	 * 메소드 설명 : 시스템코드 추가
	 * -------------------------------------------------------------------
	 * @param Map param 추가할 정보(시스템코드/세부코드/세부코드명/사용유무/비고)
	 * @return Map rtnMap 추가 성공/실패 확인(0:성공/1:실패)
	 */
	public Map<String, Object> cm1000DetailSave(Map<String, Object> param, UserInfo user) {

		Map<String, Object> rtnMap = new HashMap<>();

		try {
			param.put("USER_ID", user.getUSER_ID());

			int count = sqlSession.selectOne("cm1000Mapper.cm1000DetailCount", param);

			if (count > 0) {
				sqlSession.update("cm1000Mapper.cm1000DetailUpdate", param);
			} else {
				sqlSession.insert("cm1000Mapper.cm1000DetailSave", param);
			}

		} catch (Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
		return rtnMap;
	}
}