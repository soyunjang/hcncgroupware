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
public class Cm1600Service {
	
	@Autowired
	private SqlSession sqlSession; 

	/**
   	 * 메소드 설명 : 메시지관리 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (한글명/영문명/중문명)
   	 * @return	List	list	메시지관리 목록
   	 */
	public List<Map<String, Object>> cm1600HeadSel(Map<String, Object> param){
		return sqlSession.selectList("cm1600Mapper.cm1600HeadSel", param);
	}

	/**
   	 * 메소드 설명 : 메시지 추가
   	 * -------------------------------------------------------------------
   	 * @param	Map			param		추가할 정보(순번/구분/고유ID/한글명/영문명/중문명/사용유무/비고)
   	 * @param	UserInfo	user		로그인한 사용자ID
   	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
   	 */
	@Transactional
	public Map<String, Object> cm1600HeadSave(Map<String, Object> param, UserInfo user){
		
		Map <String, Object> rtnMap = new HashMap<>();

		try {
			param.put("REG_ID", user.getUSER_ID());
			sqlSession.update("cm1600Mapper.cm1600HeadSave", param);
		}catch (Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
		
		return rtnMap;
	}
}