package com.hs.co.controller;

import java.io.IOException;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hs.co.service.CO1000Service;

@Controller
public class CO1000Controller {
	
	@Resource(name="co1000Service")
	private CO1000Service co1000Service;
	
	private static final Logger logger = LoggerFactory.getLogger(CO1000Controller.class);
	

	/**
   	 * 메소드 설명 : 판매품의서관리 페이지로 이동
   	 * -------------------------------------------------------------------
   	 * @param	Locale	locale 	
   	 * @param	Model 	model 	
   	 * @return	String 	result	판매품의서관리 페이지ID
   	 */
	@RequestMapping(value = "/co1000")
	public String co1000(Locale locale, Model model) {
		return "CO/CO1000";
	}

	/**
   	 * 메소드 설명 : 휴가사용현황 조회
   	 * -------------------------------------------------------------------
   	 * @param	Map		param	검색조건 
   	 * @return	List	list	연차신청 목록
   	 */
	@RequestMapping(value = "/co1000Sel")
	public @ResponseBody List<Map<String, Object>> CO1000_SEL(@RequestBody Map<String, Object> param, HttpSession session) {
		
		List<Map<String, Object>> list = co1000Service.co1000Sel(param, session);
		return list;
	}
	
	@RequestMapping(value = "/co1000SelTemp")
	public @ResponseBody List<Map<String, Object>> CO1000_SEL_TEMP(@RequestBody Map<String, Object> param, HttpSession session) {
		
		List<Map<String, Object>> list = co1000Service.co1000SelTemp(param, session);
		return list;
	}
	
	@RequestMapping(value = "/co1000MergeData")
	public String co1000MergeData(final MultipartHttpServletRequest multiRequest, @RequestParam Map<String, Object> param, HttpSession session, ModelMap model) throws IOException {
		logger.debug("PopupController > co1000MergeData :: {}", param);
 
		MultipartFile file = null;
      	Iterator<String> iterator = multiRequest.getFileNames();
        
      	if(iterator.hasNext()) {
            file = multiRequest.getFile(iterator.next());
        }
        
        int insertCnt = co1000Service.co1000MergeData(file, param, session);
		model.addAttribute("insertCnt", insertCnt);
		return "jsonView";
	}
}
