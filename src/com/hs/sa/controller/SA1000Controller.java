package com.hs.sa.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hs.sa.service.SA1000Service;

@Controller
public class SA1000Controller {
	
	@Resource(name="sa1000Service")
	private SA1000Service sa1000Service;
	
	private static final Logger logger = LoggerFactory.getLogger(SA1000Controller.class);
	

	/**
   	 * 메소드 설명 : 판매품의서관리 페이지로 이동
   	 * -------------------------------------------------------------------
   	 * @param	Locale	locale 	
   	 * @param	Model 	model 	
   	 * @return	String 	result	판매품의서관리 페이지ID
   	 */
	@RequestMapping(value = "/sa1000", method = RequestMethod.GET)
	public String sa1000(Locale locale, Model model) {
		return "SA/SA1000";
	}

	/**
   	 * 메소드 설명 : 연차신청내역 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 
   	 * @return	List	list	연차신청 목록
   	 */
	@RequestMapping(value = "/sa1000Sel")
	public @ResponseBody List<Map<String, Object>> SA1000_SEL(@RequestBody Map<String, Object> param, HttpSession session) {
		
		List<Map<String, Object>> list = sa1000Service.sa1000Sel(param, session);
		return list;
	}

	/**
   	 * 메소드 설명 : 연차신청내역 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 
   	 * @return	List	list	연차신청 목록
   	 */
	@RequestMapping(value = "/sa1001Sel")
	public @ResponseBody List<Map<String, Object>> SA1001_SEL(@RequestBody Map<String, Object> param, HttpSession session) {
		
		List<Map<String, Object>> list = sa1000Service.sa1001Sel(param, session);
		return list;
	}

	/**
   	 * 메소드 설명 : 연차신청내역 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 
   	 * @return	List	list	연차신청 목록
   	 */
	@RequestMapping(value = "/sa1002Sel")
	public @ResponseBody List<Map<String, Object>> SA1002_SEL(@RequestBody Map<String, Object> param, HttpSession session) {
		
		List<Map<String, Object>> list = sa1000Service.sa1002Sel(param, session);
		return list;
	}

	/**
   	 * 메소드 설명 : 연차신청내역 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 
   	 * @return	List	list	연차신청 목록
   	 */
	@RequestMapping(value = "/sa1003Sel")
	public @ResponseBody List<Map<String, Object>> SA1003_SEL(@RequestBody Map<String, Object> param, HttpSession session) {
		
		List<Map<String, Object>> list = sa1000Service.sa1003Sel(param, session);
		return list;
	}

	/**
   	 * 메소드 설명 : 연차신청내역 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 
   	 * @return	List	list	연차신청 목록
   	 */
	@RequestMapping(value = "/sa1004Sel")
	public @ResponseBody List<Map<String, Object>> SA1004_SEL(@RequestBody Map<String, Object> param, HttpSession session) {
		
		List<Map<String, Object>> list = sa1000Service.sa1004Sel(param, session);
		return list;
	}

	/**
   	 * 메소드 설명 : 연차신청내역 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 
   	 * @return	List	list	연차신청 목록
   	 */
	@RequestMapping(value = "/sa1005Sel")
	public @ResponseBody List<Map<String, Object>> SA1005_SEL(@RequestBody Map<String, Object> param, HttpSession session) {
		
		List<Map<String, Object>> list = sa1000Service.sa1005Sel(param, session);
		return list;
	}

	/**
   	 * 메소드 설명 : 연차신청내역 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 
   	 * @return	List	list	연차신청 목록
   	 */
	@RequestMapping(value = "/sa1006Sel")
	public @ResponseBody List<Map<String, Object>> SA1006_SEL(@RequestBody Map<String, Object> param, HttpSession session) {
		
		List<Map<String, Object>> list = sa1000Service.sa1006Sel(param, session);
		return list;
	}

	/**
   	 * 메소드 설명 : 연차신청내역 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 
   	 * @return	List	list	연차신청 목록
   	 */
	@RequestMapping(value = "/sa1007Sel")
	public @ResponseBody List<Map<String, Object>> SA1007_SEL(@RequestBody Map<String, Object> param, HttpSession session) {
		
		List<Map<String, Object>> list = sa1000Service.sa1007Sel(param, session);
		return list;
	}

	/**
   	 * 메소드 설명 : 환율 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건(계약일자)
   	 * @return	List	list	환율 목록
   	 */
	@ResponseBody
	@RequestMapping(value = "/sa1000SelExchange")
	public List<Map<String, Object>> SA1000_SEL_EXCHANGE(@RequestBody Map<String, Object> param) throws IOException {
				
		List<Map<String, Object>> list = sa1000Service.sa1000SelExchange(param);
		return list;
	}	

	/**
   	 * 메소드 설명 : 판매품의서 번호 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건(사업장)
   	 * @return	String	string	판매품의서 번호
   	 */
	@RequestMapping(value = "/sa1000SelSalesNum")
	public String SA1000_SEL_SALESNUM(@RequestBody Map<String, Object> param) {
		
		String rString = sa1000Service.sa1000SelSalesNum(param);
		return rString;
	}
	
	/**
	 * 상세 저장
	 * 
	 * @param param
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/sa1000MergeData")
	public String SA1000_MERGEDATA(@RequestBody Map<String, Object> param, HttpSession session, ModelMap model) {
		logger.debug("SA1000Controller > sa1000MergeData :: {}", param);

		int resultCnt  = sa1000Service.sa1000MergeData(param, session);
		model.addAttribute("result", resultCnt);
		return "jsonView";
	}

	/**
   	 * 메소드 설명 : 판매품의서 정보 저장
   	 * -------------------------------------------------------------------
   	 * @param	Map			param		추가할 정보(사업장/판매품의서번호/프로젝트명/거래처명/영업담당자/계약일자/품목/수량/PM/프로젝트기간/변경사유/단가/판매금액/마진/최종마진)
   	 * @param	HttpSession	session		로그인한 사용자ID
   	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
   	 */
	@RequestMapping(value = "/sa1000Save")
	public @ResponseBody Map<String, Object> SA1000_SAVE(@RequestBody Map<String, Object> param, HttpSession session) {
		
		logger.info("SA1000_SAVE");
		logger.info(param.toString());
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		try {
			rtnMap = sa1000Service.sa1000Save(param, session);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
		
		return rtnMap;
	}

	/**
   	 * 메소드 설명 : 판매품의서 정보 확정
   	 * -------------------------------------------------------------------
   	 * @param	Map			param		확정할 정보(사업장/판매품의서번호/프로젝트명/거래처명/영업담당자/계약일자/품목/수량/PM/프로젝트기간/변경사유/단가/판매금액/마진/최종마진)
   	 * @param	HttpSession	session		로그인한 사용자ID
   	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
   	 */
	@RequestMapping(value = "/sa1001Confirm")
	public @ResponseBody Map<String, Object> SA1000_CONFIRM(@RequestBody Map<String, Object> param, HttpSession session, ModelMap model) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		try {
			rtnMap = sa1000Service.sa1000Confirm(param, session);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
	
		return rtnMap;
	}

	/**
   	 * 메소드 설명 : 판매품의서 정보 복사
   	 * -------------------------------------------------------------------
   	 * @param	Map			param		복사할 정보(사업장/판매품의서번호/프로젝트명/거래처명/영업담당자/계약일자/품목/수량/PM/프로젝트기간/변경사유/단가/판매금액/마진/최종마진)
   	 * @param	HttpSession	session		로그인한 사용자ID
   	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
   	 */
	@RequestMapping(value = "/sa1001Copy")
	public @ResponseBody Map<String, Object> SA1000_COPY(@RequestBody Map<String, Object> param, HttpSession session, ModelMap model) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		try {
			rtnMap = sa1000Service.sa1001Copy(param, session);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
	
		return rtnMap;
	}

	@RequestMapping(value = "/sa1000Print")
	public String SA1000_PRINT(@RequestParam Map<String, Object> param, HttpSession session, ModelMap model) throws Exception {
		logger.debug("SA1000Controller > sa1000Print :: {}", param);
		model.addAttribute("param", param);

		Map<String, Object> sa1000List = sa1000Service.selectSA1000List(param);
		model.addAttribute("sa1000List", sa1000List);
		
		List<Map<String, Object>> sa1002List = sa1000Service.selectSA1002List(param);
		model.addAttribute("sa1002List", sa1002List);

		List<Map<String, Object>> sa1003List = sa1000Service.selectSA1003List(param);
 		model.addAttribute("sa1003List", sa1003List);
		
		List<Map<String, Object>> sa1004List = sa1000Service.selectSA1004List(param);
		model.addAttribute("sa1004List", sa1004List);
		
		List<Map<String, Object>> sa1005List = sa1000Service.selectSA1005List(param);
		model.addAttribute("sa1005List", sa1005List);
		
		List<Map<String, Object>> sa1006List = sa1000Service.selectSA1006List(param);
		model.addAttribute("sa1006List", sa1006List);
		
		List<Map<String, Object>> sa1007List = sa1000Service.selectSA1007List(param);
		model.addAttribute("sa1007List", sa1007List);
		
		return "SA/SA1000Print";
	}
}
