package com.hs.cm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hs.home.controller.UserInfo;

@Service("cm1800Service")
public class CM1800Service {
	
	@Inject
	private SqlSession sqlSession; 

	/**
   	 * 메소드 설명 : 공지사항 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (공지번호/작성자)
   	 * @return	List	list	공지사항 목록
   	 */
	public List<Map<String, Object>> cm1800HeadSel(Map<String, Object> param){
		
		List<Map<String,Object>> rList = sqlSession.selectList("cm1800Mapper.cm1800HeadSel", param);
		return rList;
	}

	/* Detail Table 조회 */
	public List<Map<String, Object>> cm1800HeadDetailSel(Map<String, Object> param){
		
		List<Map<String,Object>> rList = sqlSession.selectList("cm1800Mapper.cm1800HeadDetailSel", param);
		return rList;
	}

	/**
   	 * 메소드 설명 : 공지사항 저장
   	 * -------------------------------------------------------------------
   	 * @param	Map			param		추가할 정보(공지번호/공지시작일/공지종료일/제목/내용/법인코드/작성자ID/작성자명/표시여부)
   	 * @param	HttpSession	session		로그인한 사용자ID
   	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
   	 */
	@Transactional
	public Map<String, Object> cm1800HeadSave(Map<String, Object> param, HttpSession session){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		UserInfo vo = (UserInfo) session.getAttribute("User");
		
		try {
			param.put("REG_ID", vo.getUSER_ID());
			sqlSession.update("cm1800Mapper.cm1800HeadSave", param);
		}catch (Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
		
		return rtnMap;
	}
}