package com.hs.cm.service;

import com.hs.home.controller.UserInfo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class Cm1300Service {
	
	@Autowired
	private SqlSession sqlSession;

	/**
   	 * 메소드 설명 : 권한분류코드 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (권한분류명/사용유무)
   	 * @return	List	list	권한분류코드 목록
   	 */
	public List<Map<String, Object>> cm1300HeadSel(Map<String, Object> param) {
		return sqlSession.selectList("cm1300Mapper.cm1300HeadSel", param);
	}
	
	/**
   	 * 메소드 설명 : 세부코드 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (권한분류명/사용유무)
   	 * @return	List	list	세부코드 목록
   	 */
	public List<Map<String, Object>> cm1300DetailSel(Map<String, Object> param) {
		return sqlSession.selectList("cm1300Mapper.cm1300DetailSel", param);
	}
	
	/**
   	 * 메소드 설명 : 권한분류코드 중복확인
   	 * -------------------------------------------------------------------
   	 * @param	Map	param	검색조건 (권한분류코드)
   	 * @return	Map map		중복 갯수
   	 */
	public Map<String, Object> cm1300HeadCnt(Map<String, Object> param) {
		return sqlSession.selectOne("cm1300Mapper.cm1300HeadCnt", param);
	}
	
	/**
   	 * 메소드 설명 : 세부코드 중복확인
   	 * -------------------------------------------------------------------
   	 * @param	List	param	검색조건 (권한분류코드/메뉴ID/기능분류코드(버튼코드)
   	 * @return	Map 	map		중복 갯수
   	 */
	public Map<String, Object> cm1300DetailCnt(Map<String, Object> param) {
		return sqlSession.selectOne("cm1300Mapper.cm1300DetailCnt", param);
	}
	
	/**
   	 * 메소드 설명 : 메뉴목록 조회(팝업)
   	 * -------------------------------------------------------------------
   	 * @param	Map			param	검색조건 (메뉴명/사용유무/법인코드)
   	 * @param	HttpSession	session	로그인한 사용자ID
   	 * @return	List		list	메뉴 목록
   	 */
	public List<Map<String, Object>> cm1300PopMenuSel(Map<String, Object> param) {
		return sqlSession.selectList("cm1300Mapper.cm1300PopMenuSel", param);
	}
	
	/**
   	 * 메소드 설명 : 버튼목록 조회(팝업)
   	 * -------------------------------------------------------------------
   	 * @param	Map			param	검색조건 (권한분류코드/메뉴ID/사용유무)
   	 * @return	List		list	메뉴 목록
   	 */
	public List<Map<String, Object>> cm1300PopButtonSel(Map<String, Object> param) {
		return sqlSession.selectList("cm1300Mapper.cm1300PopButtonSel", param);
	}
	
	/**
   	 * 메소드 설명 : 권한분류코드 추가
   	 * -------------------------------------------------------------------
   	 * @param	List		param		추가할 정보(권한분류코드/권한분류명/사용유무/비고)
   	 * @param	HttpSession	session		로그인한 사용자ID
   	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
   	 */
	@Transactional
	public Map<String, Object> cm1300HeadSave(Map<String, Object> param, UserInfo user) {
		
		Map<String, Object> rtnMap = new HashMap<>();

		try {
			param.put("USER_ID", user.getUSER_ID());
			sqlSession.update("cm1300Mapper.cm1300HeadSave", param);
		} catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
		
		return rtnMap;
	}
	
	/**
   	 * 메소드 설명 : 세부코드 추가
   	 * -------------------------------------------------------------------
   	 * @param	List		param		추가할 정보(권한분류코드/메뉴ID/메뉴명/기능분류코드/기능분류명/사용유무/비고)
   	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
   	 */
	@Transactional
	public Map<String, Object> cm1300DetailSave(List<Map<String, Object>> param, UserInfo user) {
		
		Map<String, Object> rtnMap = new HashMap<>();

		try {
			for(int i=0;i<param.size();i++) {
				param.get(i).put("USER_ID", user.getUSER_ID());
				sqlSession.update("cm1300Mapper.cm1300DetailSave", param.get(i));
			}
		} catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
		
		return rtnMap;
	}
}