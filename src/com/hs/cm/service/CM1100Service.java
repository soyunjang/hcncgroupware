package com.hs.cm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hs.home.controller.UserInfo;
import com.hs.home.controller.UserInfoEncrypt;

@Service("cm1100Service")
public class CM1100Service {
	
	@Inject
	private SqlSession sqlSession;

	/**
   	 * 메소드 설명 : 부서 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (부서명)
   	 * @return	List	list	부서-사용자 목록
   	 */
	public List<Map<String, Object>> cm1100Sel(Map<String, Object> param){
		
		List<Map<String, Object>> rList = sqlSession.selectList("cm1100Mapper.cm1100Sel", param);
		
		return rList;
	}
	
	/**
   	 * 메소드 설명 : 부서코드 중복확인
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (법인코드/사용자ID)
   	 * @return	List	list	중복 갯수
   	 */
	public List<Map<String, Object>> cm1100Verification(Map<String, Object> param){
		
		List<Map<String, Object>> rList = sqlSession.selectList("cm1100Mapper.cm1100Verification", param);
		return rList;
	}
	
	/**
   	 * 메소드 설명 : 부서정보 저장
   	 * -------------------------------------------------------------------
   	 * @param	Map			param		추가할 정보(법인코드/부서코드/사번/사용자명/직급코드/직무내용/재직여부/사용유무/전화번호/이메일/비고)
   	 * @param	HttpSession	session		로그인한 사용자ID
   	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
   	 */
	@Transactional
	public HashMap<String, Object> cm1100Save(Map<String, Object> param, HttpSession session){
		
		HashMap<String, Object> rtnMap = new HashMap<String, Object>();
		UserInfo vo = (UserInfo) session.getAttribute("User");
		
		try {
			param.put("USER_ID", vo.getUSER_ID());
			sqlSession.update("cm1100Mapper.cm1100Save", param);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
		
		return rtnMap;
	}
}