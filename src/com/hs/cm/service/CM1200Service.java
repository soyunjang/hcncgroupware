package com.hs.cm.service;

import java.net.InetAddress;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hs.home.controller.UserInfo;
import com.hs.home.controller.UserInfoEncrypt;

@Service("cm1200Service")
public class CM1200Service {

	private static final Logger logger = LoggerFactory.getLogger(CM1200Service.class);
	
	@Inject
	private SqlSession sqlSession;
	
	/**
	 * 메소드 설명 : 사용자정보 조회
	 * -------------------------------------------------------------------
	 * 
	 * @param Map 		param 검색조건 (사용자ID/사용자명)
	 * @return List 	list 사용자정보 목록
	 */
	public List<Map<String, Object>> cm1200Sel(Map<String, Object> param) {
		
		List<Map<String, Object>> rList = sqlSession.selectList("cm1200Mapper.cm1200Sel", param);
		
		return rList;
	}
	
	/**
	 * 메소드 설명 : 부서 조회(팝업)
	 * -------------------------------------------------------------------
	 * 
	 * @param Map 		param 검색조건 (부서코드)
	 * @return List 	list 부서 목록
	 */
	public List<HashMap<String, Object>> cm1200DeptSel(Map<String, Object> param) {
		
		List<HashMap<String, Object>> rList = sqlSession.selectList("cm1200Mapper.cm1200DeptSel", param);
		return rList;
	}

	/**
	 * 메소드 설명 : 권한그룹 조회(팝업)
	 * -------------------------------------------------------------------
	 * 
	 * @param Map 		param 검색조건 (권한코드)
	 * @return List 	list 권한그룹 목록
	 */
	public List<HashMap<String, Object>> cm1200AuthSel(Map<String, Object> param) {
		
		List<HashMap<String, Object>> rList = sqlSession.selectList("cm1200Mapper.cm1200AuthSel", param);
		return rList;
	}

	/**
	 * 메소드 설명 : 사용자ID 중복확인
	 * -------------------------------------------------------------------
	 * 
	 * @param Map 		param 검색조건 (사용자ID)
	 * @return List 	list 중복 갯수
	 */
	public List<Map<String, Object>> cm1200Verification(Map<String, Object> param){
		
		List<Map<String, Object>> rList = sqlSession.selectList("cm1200Mapper.cm1200Verification", param);
		return rList;
	}
	
	/**
	 * 메소드 설명 : 사용자정보 저장
	 * -------------------------------------------------------------------
	 * 
	 * @param Map 			param 추가할 정보(사용자ID/비밀번호/부서코드/권한코드/사용유무/비고)
	 * @param HttpSession 	session 로그인한 사용자ID
	 * @return Map 			rtnMap 추가 성공/실패 확인(0:성공/1:실패)
	 */
	@Transactional
	public Map<String, Object> cm1200Save(Map<String, Object> param, HttpSession session) {
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		UserInfo vo = (UserInfo) session.getAttribute("User");

		try {
			param.put("REG_USERID", vo.getUSER_ID());
			param.put("REG_IP", vo.getUSER_IP());
			param.put("HOST_NM", InetAddress.getLocalHost().getHostName());
			logger.debug("CM1200Service > cm1200Save :: {}", param);

			// update
			if(param.get("ACTION").equals("U")) {
				sqlSession.insert("commonMapper.insertUserInfo", param);	// 사용자 정보 변경 로그 저장
				
				if(param.get("CHANGE").equals("CHANGEAHTU")) {
					param.put("EVNT_NM", "권한변경");
					param.put("EVNT_SVRY", "중");
					param.put("DEPT_CD", vo.getDEPT_CD());
					param.put("USER_IP", vo.getUSER_IP());

					logger.debug("CM1200Service > CHANGEAHTU :: {}", param);
					sqlSession.insert("commonMapper.insertAuthChange", param);
				}
			}
			
			sqlSession.update("cm1200Mapper.cm1200Save", param);

			if (param.get("ACTION").equals("C")) {
				sqlSession.insert("cm1200SaveHolidayInfo", param);
			}
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
		
		return rtnMap;
	}
}