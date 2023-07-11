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

@Service("cm1500Service")
public class CM1500Service {
	
	@Inject
	private SqlSession sqlSession;

	/**
   	 * 메소드 설명 : 카드목록 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (지점구분, 카드사, 카드번호, 사용자)
   	 * @return	List	list	카드 목록
   	 */
	public List<HashMap<String, Object>> cm1500Sel(Map<String, Object> param) {
		
		List<HashMap<String, Object>> rList = sqlSession.selectList("cm1500Mapper.cm1500Sel", param);
		return rList;
	}

	/**
   	 * 메소드 설명 : 사용자 조회(팝업)
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 (사용자명)
   	 * @return	List	list	사용자 목록
   	 */
	public List<HashMap<String, Object>> cm1500UserSel(Map<String, Object> param) {
		
		List<HashMap<String, Object>> rList = sqlSession.selectList("cm1500Mapper.cm1500UserSel", param);
		return rList;
	}

	/**
   	 * 메소드 설명 : 카드정보 저장
   	 * -------------------------------------------------------------------
   	 * @param	Map			param		추가할 정보(사업장/사용자ID/카드사/카드번호/CVS/한도금액/유효기간/발급일자/지급일자/회수일자/비고)
   	 * @param	HttpSession	session		로그인한 사용자ID
   	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
   	 */
	@Transactional
	public Map<String, Object> cm1500Save(Map<String, Object> param, HttpSession session) {
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		UserInfo vo = (UserInfo) session.getAttribute("User");
		
		try {
			param.put("REG_ID", vo.getUSER_ID());
			sqlSession.insert("cm1500Mapper.cm1500Save", param);
		}catch (Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
		
		return rtnMap;
	}
}