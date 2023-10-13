package com.hs.cm.controller;

import com.hs.cm.service.Cm1700Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class Cm1700Controller {
	
	@Autowired
	private Cm1700Service cm1700Service;
	

	@RequestMapping(value = "/cm1700")
	public String cm1700(){
		return "CM/CM1700";
	}

	@RequestMapping(value = "/cm1700LogSel")
	public @ResponseBody List < HashMap<String, Object>> cm1700LogSel(@RequestBody Map<String, Object> param){
		return cm1700Service.cm1700LogSel(param);
	}
}
