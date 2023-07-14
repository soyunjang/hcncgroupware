package com.hs.an.controller;

import com.hs.an.service.AN1000Service;
import com.hs.home.controller.UserInfo;
import org.json.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.*;

@Controller
public class AN1000Controller {

	@Resource(name="an1000Service")
	private AN1000Service an1000Service;

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	/**
   	 * 메소드 설명 : 연차등록 페이지로 이동
   	 * -------------------------------------------------------------------
   	 * @param	Locale	locale
   	 * @param	Model 	model
   	 * @return	String 	result	연차등록 페이지ID
   	 */
	@RequestMapping(value = "/an1000", method = RequestMethod.GET)
	public String an1000(Locale locale, Model model, HttpSession session) {

		UserInfo user = (UserInfo) session.getAttribute("User");

		// 사용자 연차정보 조회
		Map<String,Object> holidayInfo = an1000Service.an1000InfoSel(user);
		List holidayOffice = an1000Service.an1000HolidayOfficeSel();

		model.addAttribute("Holiday", holidayInfo);
		model.addAttribute("HolidayOffice", holidayOffice);

		return "AN/AN1000";
	}

	/**
	 * 메소드 설명 : 연차신청내역 조회
	 * -------------------------------------------------------------------
	 * @param	Map		param	검색조건
	 * @return	List	list	연차신청 목록
	 */
	@RequestMapping(value = "/an1000Sel")
	public @ResponseBody List<Map<String, Object>> AN1000_SEL(@RequestBody Map<String, Object> param, HttpSession session) {

		UserInfo user = (UserInfo) session.getAttribute("User");

		List<Map<String, Object>> list = an1000Service.an1000Sel(param, user);

		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/an1000", method = RequestMethod.POST)
	public List<Map<String, Object>> an1000_save(@RequestBody Map<String, Object> param, HttpSession session) {

		UserInfo user = (UserInfo) session.getAttribute("User");

		an1000Service.an1000Save(param, user);

		return an1000Service.an1000Sel(param, user);
	}

	@ResponseBody
	@RequestMapping(value = "/an1000", method = RequestMethod.PATCH)
	public List<Map<String, Object>> an1000_update(@RequestBody Map<String, Object> param, HttpSession session) {
		UserInfo user = (UserInfo) session.getAttribute("User");
		System.out.println("param = " + param.toString());
		an1000Service.an1000Update(param, user);

		return an1000Service.an1000Sel(param, user);
	}

	@ResponseBody
	@RequestMapping(value = "", method = RequestMethod.GET)
	public List an1000_holidayOfficeSel() {
		return an1000Service.an1000HolidayOfficeSel();
	}

	@ResponseBody
	@RequestMapping(value = "/an1000/publicHoliday", method = RequestMethod.GET)
	public List publicHolidayApi(@RequestParam String year, @RequestParam String month) {

		int yearNum = Integer.parseInt(year);
		int monthNum = Integer.parseInt(month);
		String[] yearArray = new String[2];
		String[] monthArray = new String[2];

		// 3달치 공휴일 조회
		for (int i = 0; i < monthArray.length; i++) {
			monthArray[i] = monthNum < 10 ? "0" + (monthNum + i) : (monthNum + i) % 13 < 10 ? "0" + ((monthNum + i + 1) % 13) : String.valueOf((monthNum + i) % 13);
			yearArray[i] = (i == 0) ? year : (Integer.parseInt(monthArray[0]) > Integer.parseInt(monthArray[i]) ? String.valueOf(yearNum + 1) : year);
		}

		List<String> list = new ArrayList<>();
		for (int i = 0; i < monthArray.length; i++) {
			String serviceKey = "lpOOxR6f66DvlhdWlXJNJrm51ltklSeiRdySDssS3VuClfK9hAMDNwLRqAVnR4T2ijXHuAXxXgOW%2Fe67Lumx1g%3D%3D";
			String type = "json";
			String apiUrl = "http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo?ServiceKey=" + serviceKey + "&solYear=" + yearArray[i] + "&solMonth=" + monthArray[i] + "&_type=" + type;
			String result = "";
			try {
				URL url = new URL(apiUrl);
				HttpURLConnection con = (HttpURLConnection) url.openConnection();
				con.setRequestMethod("GET");
				int responseCode = con.getResponseCode();
				BufferedReader br;
				if (responseCode >= 200 && responseCode <= 300) {
					br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else {
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				result = br.readLine();

				JSONParser jsonParser = new JSONParser();
				JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
				JSONObject response = (JSONObject) jsonObject.get("response");
				JSONObject body = (JSONObject) response.get("body");
				String totalCount = String.valueOf(body.get("totalCount"));

				if (Integer.parseInt(totalCount) == 1) {
					JSONObject items = (JSONObject) body.get("items");
					JSONObject item = (JSONObject) items.get("item");
					String locdate = String.valueOf(item.get("locdate"));
					list.add(locdate);
				} else if (Integer.parseInt(totalCount) > 1) {
					JSONObject items = (JSONObject) body.get("items");
					JSONArray item = (JSONArray) items.get("item");
					for (int j = 0; j < item.length(); j++) {
						JSONObject sequence = (JSONObject) item.get(j);
						String locdate = String.valueOf(sequence.get("locdate"));
						list.add(locdate);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		//노동자의날 추가
		if (Arrays.stream(monthArray).anyMatch("05"::equals)) {
			String workersDay = year + "0501";
			list.add(workersDay);
		}

		return list;
	}

}
