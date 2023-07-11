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

@Service("cm1600Service")
public class CM1600Service {
	
	@Inject
	private SqlSession sqlSession; 

	/**
   	 * 메소드 설명 : 메시지관리 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (한글명/영문명/중문명)
   	 * @return	List	list	메시지관리 목록
   	 */
	public List<Map<String, Object>> cm1600HeadSel(Map<String, Object> param){
		
		List<Map<String,Object>> rList = sqlSession.selectList("cm1600Mapper.cm1600HeadSel", param);
		return rList;
	}

	/**
   	 * 메소드 설명 : 메시지 추가
   	 * -------------------------------------------------------------------
   	 * @param	Map			param		추가할 정보(순번/구분/고유ID/한글명/영문명/중문명/사용유무/비고)
   	 * @param	HttpSession	session		로그인한 사용자ID
   	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
   	 */
	@Transactional
	public Map<String, Object> cm1600HeadSave(Map<String, Object> param, HttpSession session){
		
		Map <String, Object> rtnMap = new HashMap<String, Object>();
		UserInfo vo = (UserInfo) session.getAttribute("User");
		
		try {
			param.put("REG_ID", vo.getUSER_ID());
			sqlSession.update("cm1600Mapper.cm1600HeadSave", param);
		}catch (Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
		
		return rtnMap;
	}
}