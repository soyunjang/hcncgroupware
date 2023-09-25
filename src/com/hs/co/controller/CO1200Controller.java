package com.hs.co.controller;

import com.hs.co.service.CO1200Service;
import com.hs.home.controller.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class CO1200Controller {
	
	@Autowired
	private CO1200Service co1200Service;
	
	@RequestMapping(value = "/co1200")
	public String co1200() {
		return "CO/CO1200";
	}

	@ResponseBody
	@RequestMapping(value = "/co1200Sel")
	public List<Map<String, Object>> CO1200_SEL(@RequestBody Map<String, Object> param, HttpSession session) {
		UserInfo user = (UserInfo) session.getAttribute("User");
		return co1200Service.co1200Sel(param, user);
	}
	@ResponseBody
	@RequestMapping(value = "/co1200SelInfo")
	public int[] CO1200_SEL_INFO(@RequestBody Map<String, Object> param) {

		int[] info = new int[2];
		int expensePrice = co1200Service.co1200SelExpense(param);
		int approval = co1200Service.co1200SelApproval(param);

		info[0] = expensePrice;
		info[1] = approval;

		return info;
	}
}
