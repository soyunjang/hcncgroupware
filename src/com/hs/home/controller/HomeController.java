package com.hs.home.controller;

import com.hs.common.service.CommonService;
import com.hs.home.service.HomeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller
public class HomeController {

	@Resource(name = "homeService")
	private HomeService homeService;

	@Resource(name = "commonService")
	private CommonService commonService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/* 세션에 사용자 정보가 있으면 메인 페이지로 이동, 없으면 로그인 페이지로 이동 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session, HttpServletResponse response)
			throws IOException {

		if (session.getAttribute("User") != null) {
			session.invalidate();
			response.sendRedirect("/main");
		}

		return "home";
	}

	/* 사용자 정보 조회 */
	@RequestMapping(value = "/loginCheck")
	public String loginCheck(String id, String pwd, HttpSession session, HttpServletRequest request,
			HttpServletResponse res, Model model, RedirectAttributes red) throws UnknownHostException {

		HashMap<String, Object> map = new HashMap<String, Object>();
		String userPw = "";

		try {
			userPw = UserInfoEncrypt.encryptStringData(pwd);
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		try {
			map.put("USER_ID", id);
			map.put("PASSWORD", userPw); // 비밀번호 암호화
		} catch (Exception e) {
			e.printStackTrace();
 		}

		// 사용자 정보 조회
		Map<String, Object> loginInfo = homeService.loginCheck(map);

		if (loginInfo != null) {
			UserInfo vo = new UserInfo();
			vo.setUSER_ID(id);
			vo.setUSER_NM(loginInfo.get("USER_NM") != null ? loginInfo.get("USER_NM").toString() : "");
			vo.setPDEPT_CD(loginInfo.get("PDEPT_CD") != null ? loginInfo.get("PDEPT_CD").toString() : "");
			vo.setPDEPT_NM(loginInfo.get("PDEPT_NM") != null ? loginInfo.get("PDEPT_NM").toString() : "");
			vo.setDEPT_CD(loginInfo.get("DEPT_CD") != null ? loginInfo.get("DEPT_CD").toString() : "");
			vo.setDEPT_NM(loginInfo.get("DEPT_NM") != null ? loginInfo.get("DEPT_NM").toString() : "");
			vo.setGRADE_CD(loginInfo.get("GRADE_CD") != null ? loginInfo.get("GRADE_CD").toString() : "");
			vo.setGRADE_NM(loginInfo.get("GRADE_NM") != null ? loginInfo.get("GRADE_NM").toString() : "");
			vo.setENTER_DT(loginInfo.get("ENTER_DT") != null ? loginInfo.get("ENTER_DT").toString() : "");
			vo.setBIRTHDAY(loginInfo.get("BIRTHDAY") != null ? loginInfo.get("BIRTHDAY").toString() : "");
			vo.setEMAIL(loginInfo.get("EMAIL") != null ? loginInfo.get("EMAIL").toString() : "");
			vo.setPHONE_NUM(loginInfo.get("PHONE_NUM") != null ? loginInfo.get("PHONE_NUM").toString() : "");
			vo.setAUTH_TYPE_CD(loginInfo.get("AUTH_TYPE_CD") != null ? loginInfo.get("AUTH_TYPE_CD").toString() : "");
			vo.setUSER_LNAG(loginInfo.get("LANG") != null ? loginInfo.get("LANG").toString() : "KOR");
			vo.setCONNECT_DT(loginInfo.get("CONNECT_DT") != null ? loginInfo.get("CONNECT_DT").toString() : "");

			String ip = null;
			ip = request.getHeader("X-Forwarded-For");

			if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("Proxy-Client-IP");
			}
			if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("WL-Proxy-Client-IP");
			}
			if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("HTTP_CLIENT_IP");
			}
			if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("HTTP_X_FORWARDED_FOR");
			}
			if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("X-Real-IP");
			}
			if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("X-RealIP");
			}
			if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("REMOTE_ADDR");
			}
			if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getRemoteAddr();
			}

			vo.setUSER_IP(ip);

			if (loginInfo.get("PASSWD").equals("O")) {
				// 접속정보 추가 Start
				HashMap<String, Object> insertLogMap = new HashMap<String, Object>();

				insertLogMap.put("SESSION_ID", session.getId());
				insertLogMap.put("USER_ID", vo.getUSER_ID());
				insertLogMap.put("DEPT_CD", vo.getDEPT_CD());
				insertLogMap.put("USER_NM", vo.getUSER_NM());
				insertLogMap.put("CONNECT_IP", ip);

				homeService.insertConnectInfo(insertLogMap);
				// 접속정보 추가 End

				// 사용자ID 쿠키에 담기
				if (request.getParameter("idSave") != null) {
					Cookie cookie = new Cookie("userID", id.trim()); // 쿠키 이름 지정하여 생성( key, value 개념)
					cookie.setMaxAge(60 * 60 * 24); // 쿠키 유효 기간: 하루로 설정(60초 * 60분 * 24시간)
					cookie.setPath("/"); // 모든 경로에서 접근 가능하도록 설정
					res.addCookie(cookie); // response에 Cookie 추가
				} else {
					Cookie cookie = new Cookie("userID", null); // 삭제할 쿠키에 대한 값을 null로 지정
					cookie.setMaxAge(0); // 유효시간을 0으로 설정해서 바로 만료시킨다.
					res.addCookie(cookie); // 응답에 추가해서 없어지도록 함
				}

				// 사용자 권한별 메뉴 조회
				List<Map<String, Object>> menuList = homeService.userMenuList(loginInfo, id);

				session.setAttribute("User", vo);
				session.setAttribute("MENU", commonService.covertListToJson(menuList));
				session.setAttribute("LANG", request.getParameter("language") == null ? "KOR" : request.getParameter("language"));
				red.addFlashAttribute("LANG", request.getParameter("language") == null ? "KOR" : request.getParameter("language"));
			} else {
				Cookie cookie = new Cookie("userID", null); // 삭제할 쿠키에 대한 값을 null로 지정
				cookie.setMaxAge(0); // 유효시간을 0으로 설정해서 바로 만료시킨다.
				res.addCookie(cookie); // 응답에 추가해서 없어지도록 함

				Cookie cookiePw = new Cookie("userPW", null);
				cookiePw.setMaxAge(0);
				res.addCookie(cookiePw);

				red.addFlashAttribute("USER_ID", id);
				red.addFlashAttribute("PASSWORD", pwd);
				red.addFlashAttribute("msg", "pwdFailure");

				return "redirect:/";
			}
		} else {
			Cookie cookie = new Cookie("userID", null); // 삭제할 쿠키에 대한 값을 null로 지정
			cookie.setMaxAge(0); // 유효시간을 0으로 설정해서 바로 만료시킨다.
			res.addCookie(cookie); // 응답에 추가해서 없어지도록 함

			Cookie cookiePw = new Cookie("userPW", null);
			cookiePw.setMaxAge(0);
			res.addCookie(cookiePw);

			red.addFlashAttribute("USER_ID", id);
			red.addFlashAttribute("PASSWORD", pwd);
			red.addFlashAttribute("msg", "idFailure");

			return "redirect:/";
		}

		return "tunnel";
	}
}