package com.hs.sa.controller;

import com.hs.sa.service.Sa1000Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
public class Sa1000Controller {
	
	@Autowired
	private Sa1000Service sa1000Service;
	
	/**
   	 * 메소드 설명 : 판매품의서관리 페이지로 이동
   	 * -------------------------------------------------------------------
   	 * @return	String 	result	판매품의서관리 페이지ID
   	 */
	@RequestMapping(value = "/sa1000")
	public String sa1000() {
		return "SA/SA1000";
	}

	@ResponseBody
	@RequestMapping(value = "/sa1000Sel")
	public List<Map<String, Object>> SA1000_SEL(@RequestBody Map<String, Object> param) {
		return sa1000Service.sa1000Sel(param);
	}

	@ResponseBody
	@RequestMapping(value = "/sa1001Sel")
	public List<Map<String, Object>> SA1001_SEL(@RequestBody Map<String, Object> param) {
		return sa1000Service.sa1001Sel(param);
	}

	@ResponseBody
	@RequestMapping(value = "/sa1002Sel")
	public List<Map<String, Object>> SA1002_SEL(@RequestBody Map<String, Object> param) {
		return sa1000Service.sa1002Sel(param);
	}

	@ResponseBody
	@RequestMapping(value = "/sa1003Sel")
	public List<Map<String, Object>> SA1003_SEL(@RequestBody Map<String, Object> param) {
		return sa1000Service.sa1003Sel(param);
	}

	@ResponseBody
	@RequestMapping(value = "/sa1004Sel")
	public List<Map<String, Object>> SA1004_SEL(@RequestBody Map<String, Object> param) {
		return sa1000Service.sa1004Sel(param);
	}

	@ResponseBody
	@RequestMapping(value = "/sa1005Sel")
	public List<Map<String, Object>> SA1005_SEL(@RequestBody Map<String, Object> param) {
		return sa1000Service.sa1005Sel(param);
	}

	@ResponseBody
	@RequestMapping(value = "/sa1006Sel")
	public List<Map<String, Object>> SA1006_SEL(@RequestBody Map<String, Object> param) {
		return sa1000Service.sa1006Sel(param);
	}

	@ResponseBody
	@RequestMapping(value = "/sa1007Sel")
	public List<Map<String, Object>> SA1007_SEL(@RequestBody Map<String, Object> param) {
		return sa1000Service.sa1007Sel(param);
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
		return sa1000Service.sa1000SelExchange(param);
	}	

	/**
   	 * 메소드 설명 : 판매품의서 번호 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건(사업장)
   	 * @return	String	string	판매품의서 번호
   	 */
	@RequestMapping(value = "/sa1000SelSalesNum")
	public String SA1000_SEL_SALESNUM(@RequestBody Map<String, Object> param, ModelMap model) {
		
		String rString = sa1000Service.sa1000SelSalesNum(param);
		model.addAttribute("result", rString);
		return "jsonView";
	}
	
	/**
	 * 상세 저장
	 * 
	 * @param param
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/sa1000MergeData")
	public String SA1000_MERGEDATA(@RequestBody Map<String, Object> param, ModelMap model) {
		log.debug("SA1000Controller > sa1000MergeData :: {}", param);

		int resultCnt  = sa1000Service.sa1000MergeData(param);
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
	@ResponseBody
	@RequestMapping(value = "/sa1000Save")
	public  Map<String, Object> SA1000_SAVE(@RequestBody Map<String, Object> param, HttpSession session) {

		Map<String, Object> rtnMap = new HashMap<>();
		
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
	 * 메소드 설명 : 판매품의서 정보 수정
	 * -------------------------------------------------------------------
	 * @param	Map			param		추가할 정보(사업장/판매품의서번호/프로젝트명/거래처명/영업담당자/계약일자/품목/수량/PM/프로젝트기간/변경사유/단가/판매금액/마진/최종마진)
	 * @param	HttpSession	session		로그인한 사용자ID
	 * @return	Map 		rtnMap		추가 성공/실패 확인(0:성공/1:실패)
	 */
	@ResponseBody
	@RequestMapping(value = "/sa1000Update")
	public Map<String, Object> SA1000_UPDATE(@RequestBody Map<String, Object> param, HttpSession session) {

		Map<String, Object> rtnMap = new HashMap<>();

		try {
			rtnMap = sa1000Service.sa1000Update(param, session);
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
	@ResponseBody
	@RequestMapping(value = "/sa1000Confirm")
	public Map<String, Object> SA1000_CONFIRM(@RequestBody Map<String, Object> param, HttpSession session) {
		Map<String, Object> rtnMap = new HashMap<>();
		
		try {
			rtnMap = sa1000Service.sa1000Confirm(param, session);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}
	
		return rtnMap;
	}

	@ResponseBody
	@RequestMapping(value = "/sa1000UpVersoin")
	public Map<String, Object> SA1000_UP_VERSION(@RequestBody Map<String, Object> param, HttpSession session) {
		Map<String, Object> rtnMap = new HashMap<>();

		try {
			rtnMap = sa1000Service.sa1000UpVersoin(param, session);
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
	@ResponseBody
	@RequestMapping(value = "/sa1001Copy")
	public Map<String, Object> SA1000_COPY(@RequestBody Map<String, Object> param, HttpSession session) {
		Map<String, Object> rtnMap = new HashMap<>();
		
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
	public String SA1000_PRINT(@RequestParam Map<String, Object> param, ModelMap model) {
		model.addAttribute("param", param);
		model.addAttribute("sa1000List", sa1000Service.selectSA1000List(param));

		List<Map<String, Object>> sa1002List = sa1000Service.selectSA1002List(param);
		model.addAttribute("sa1002List", sa1002List);
		model.addAttribute("sa1002ListCnt", sa1002List.size());

		List<Map<String, Object>> sa1003List = sa1000Service.selectSA1003List(param);
 		model.addAttribute("sa1003List", sa1003List);
		model.addAttribute("sa1003ListCnt", sa1003List.size());

		model.addAttribute("sa1004List", sa1000Service.selectSA1004List(param));
		model.addAttribute("sa1005List", sa1000Service.selectSA1005List(param));
		model.addAttribute("sa1006List", sa1000Service.selectSA1006List(param));
		model.addAttribute("sa1007List", sa1000Service.selectSA1007List(param));

		return "SA1000Print";
	}

	/**
	 * 미확정 판매품의서 삭제
	 */
	@ResponseBody
	@RequestMapping(value = "/sa1000", method = RequestMethod.DELETE)
	public ResponseEntity sa1000Delete(@RequestBody Map<String, Object> param) {
		sa1000Service.sa1000DeleteByConfirmN(param);
		return new ResponseEntity(HttpStatus.OK);
	}

}
