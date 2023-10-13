package com.hs.co.controller;

import com.hs.co.service.Co1100Service;
import com.hs.home.controller.UserInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
public class Co1100Controller {
	
	@Autowired
	private Co1100Service co1100Service;

	@ModelAttribute("User")
	public UserInfo userInfo(HttpSession session) {
		return (UserInfo) session.getAttribute("User");
	}

	@RequestMapping(value = "/co1100")
	public String co1100() {
		return "CO/CO1100";
	}

	@RequestMapping(value = "/co1100Project")
	public String co1100Project(Model model, @RequestParam Map<String, Object> param) {
		model.addAttribute("param", param);
		return "CO/CO1100Project";
	}

	@ResponseBody
	@RequestMapping(value = "/co1100Sel")
	public List<Map<String, Object>> CO1100_SEL(@RequestBody Map<String, Object> param, @ModelAttribute("User") UserInfo user) {
		return co1100Service.co1100Sel(param, user);
	}

	@ResponseBody
	@RequestMapping(value = "/co1100SelProject")
	public List<Map<String, Object>> CO1100_SEL_PROJECT(@RequestBody Map<String, Object> param) {
		return co1100Service.co1100SelProject(param);
	}

	@ResponseBody
	@RequestMapping(value = "/co1100Save")
	public Map<String, Object> CO1100_SAVE(@RequestBody Map<String, Object> param, @ModelAttribute("User") UserInfo user) {

		Map<String, Object> rtnMap = new HashMap<>();

		try {
			rtnMap = co1100Service.co1100Save(param, user);
		}catch(Exception e) {
			e.printStackTrace();
			rtnMap.put("Errmsg", "오류가 발생하였습니다.");
			rtnMap.put("Errstate", -1);
		}

		return rtnMap;
	}

	@RequestMapping(value = "/co1100MergeData")
	public String CO1100_MERGEDATA(@RequestBody Map<String, Object> param, @ModelAttribute("User") UserInfo user, ModelMap model) {
		log.debug("CO1100Controller > co1100MergeData :: {}", param);
		int resultCnt  = co1100Service.co1100MergeData(param, user);
		model.addAttribute("result", resultCnt);
		return "jsonView";
	}

	@RequestMapping(value = "/co1100Print")
	public String CO1100_PRINT(@RequestParam Map<String, Object> param, ModelMap model) {
		model.addAttribute("param", param);
		model.addAttribute("co1000List", co1100Service.selectCo1000List(param));
		model.addAttribute("co1001List", co1100Service.selectCo1001List(param));
		return "CO/CO1100Print";
	}
}
