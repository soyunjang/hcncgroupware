package com.hs.home.controller;

import com.hs.common.service.CommonService;
import com.hs.home.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import static com.hs.util.UserInfoEncrypt.encryptStringData;

@Controller
public class HomeController {

	@Autowired
	private HomeService homeService;

	@Autowired
	private CommonService commonService;


	/* 세션에 사용자 정보가 있으면 메인 페이지로 이동, 없으면 로그인 페이지로 이동 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session, HttpServletResponse response)
			throws IOException {

		if (session.getAttribute("User") != null) {
			session.invalidate();
			response.sendRedirect("/main");
		}

		return "home";
	}

	@ResponseBody
	@RequestMapping(value = "/loginCheck", method = RequestMethod.PATCH)
	public ResponseEntity userPasswordModify(@RequestBody UserPasswordDto dto, HttpSession session) {
		UserInfo user = (UserInfo) session.getAttribute("User");

		if (dto.getPassword1().equals(dto.getPassword2())) {
			homeService.userPasswordModify(dto, user);
			return new ResponseEntity<>(HttpStatus.OK);
		} else {
			return new ResponseEntity<>("비밀번호를 확인해 주시기 바랍니다.", HttpStatus.BAD_REQUEST);
		}
	}

	/* 사용자 정보 조회 */
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public String loginCheck(String id, String pwd, HttpSession session, HttpServletRequest request,
			HttpServletResponse res, RedirectAttributes red) {

		HashMap<String, Object> map = new HashMap<>();
		String userPw = "";

		try {
			userPw = encryptStringData(pwd);
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		try {
			map.put("USER_ID", id);
			if (pwd == "" || pwd == null) {
				map.put("PASSWORD", null);
			} else {
				map.put("PASSWORD", userPw); // 비밀번호 암호화
			}
		} catch (Exception e) {
			e.printStackTrace();
 		}

		// 사용자 정보 조회
		Optional<UserInfo> loginInfo = homeService.loginCheck(map);
		if (loginInfo.isPresent()) {
			UserInfo userInfo = loginInfo.get();

			String ip = ipCheck(request);
			userInfo.setUSER_IP(ip);
			try {
				boolean check = userPw.equals(encryptStringData(userInfo.getBIRTHDAY().replace("-", "")));
					userInfo.setPW_CHECK(check ? true : false);
			} catch (Exception e) {
				throw new RuntimeException(e);
			}

			if (userInfo.getUSER_PW().equals("O")) {
				// 접속정보 추가 Start
				homeService.insertConnectInfo(insertLogMapInfo(session.getId(), userInfo, ip));
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
				List<Map<String, Object>> menuList = homeService.userMenuList(userInfo);

				session.setAttribute("User", userInfo);
				session.setAttribute("MENU", commonService.covertListToJson(menuList));
				session.setAttribute("LANG", request.getParameter("language") == null ? "KOR" : request.getParameter("language"));
				red.addFlashAttribute("LANG", request.getParameter("language") == null ? "KOR" : request.getParameter("language"));
			} else {
				cookieSetting(id, pwd, res, red);
				return "redirect:/";
			}
		} else {
			cookieSetting(id, pwd, res, red);
			return "redirect:/";
		}

		return "tunnel";
	}

	private Map<String, Object> insertLogMapInfo(String sessionId, UserInfo userInfo, String ip) {
		HashMap<String, Object> insertLogMap = new HashMap<>();
		insertLogMap.put("SESSION_ID", sessionId);
		insertLogMap.put("USER_ID", userInfo.getUSER_ID());
		insertLogMap.put("DEPT_CD", userInfo.getDEPT_CD());
		insertLogMap.put("USER_NM", userInfo.getUSER_NM());
		insertLogMap.put("CONNECT_IP", ip);
		return insertLogMap;
	}

	private void cookieSetting(String id, String pwd, HttpServletResponse res, RedirectAttributes red) {
		Cookie cookie = new Cookie("userID", null); // 삭제할 쿠키에 대한 값을 null로 지정
		cookie.setMaxAge(0); // 유효시간을 0으로 설정해서 바로 만료시킨다.
		res.addCookie(cookie); // 응답에 추가해서 없어지도록 함

		Cookie cookiePw = new Cookie("userPW", null);
		cookiePw.setMaxAge(0);
		res.addCookie(cookiePw);

		red.addFlashAttribute("USER_ID", id);
		red.addFlashAttribute("PASSWORD", pwd);
		red.addFlashAttribute("msg", "idFailure");
	}

	private String ipCheck(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");

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
		return ip;
	}
}