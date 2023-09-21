<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<style>
	.password-text {
		color: #de012b;
		font-weight: bold;
	}
	.pw-info-text {
		font-size: 0.8rem;

	}
</style>
	<body>
		<div id="framemain" class="tab-content active">
			<div class="contents-wrap main-page">  <!-- 컨텐츠 시작★ -->
				<img src="/resources/img/main/main-logo.png" class="main-page-logo" alt="메인 이미지">
			</div>
		</div>

		<!-- 비밀번호 변경 팝업 -->
		<div id="viewForm1" style="display: none;">
			<div class="modal-cont">
				<div class="row row-1">
					<div class="col col-1 wp100">
						<section>
							<table class="table-write">
								<caption>비밀변호 변경</caption>
								<tbody>
								<tr>
									<th id="password-text1" class="password-text">비밀번호</th>
									<td>
										<input type="password" id="USER_PW1" maxlength="20" placeholder="비밀번호" >
									</td>
								</tr>
								<tr>
									<th id="password-text2" class="password-text">비밀번호 확인</th>
									<td>
										<input type="password" id="USER_PW2" maxlength="20" placeholder="비밀번호 확인">
									</td>
								</tr>
								</tbody>
							</table>
							<p class="pw-info-text">
								※
								<span id="pw-number" class="password-text" title="0~9">숫자</span>,
								<span id="pw-english"  class="password-text" title="a~z, A~Z">영문자, </span>
								<span id="pw-special-symbol" class="password-text" title="#?!@$%^&*-">특수문자</span> 조합으로
								<span id="pw-length" class="password-text">8자리 이상</span> 사용해야 합니다.
							</p>
						</section>
					</div>
				</div>
			</div>
		</div>

		<div id="confirmPopUp" class="popup-bg">
			<div class="popup-wrap">
				<div class="popup-cont"></div>
				<div class="popup-btn">
					<a href="javascript:void(0);" id="confirmPopupYes" title="확인" class="">확인</a>
					<a href="javascript:void(0);" id="confirmPopupNo" title="취소" class="bg-gray btn-close">취소</a>
				</div>
			</div>
		</div>

	</body>
</html>
<script>
	const userPwCheck ='${User.PW_CHECK}';
	const viewForm1 = document.querySelector('#viewForm1');
	const confirmPopUp = document.querySelector('#confirmPopUp');
	const password1 = document.querySelector('#USER_PW1');
	const password2 = document.querySelector('#USER_PW2');
	let green = "#63B462";
	let red = "#de012b"

	password1.addEventListener("keyup", (e) => {
		password1.value = password1.value.replaceAll(" ","");
		checkPassword(password1.value);
		if (e.key == "Enter") {
			password2.focus();
		}
	});

	password2.addEventListener("keyup", (e) => {
		password2.value = password2.value.replaceAll(" ","");
		doubleCheckPassword();
		if (e.key == "Enter") {
			finalCheckAndUpdate();
		}
	});

	if (userPwCheck === 'true') {
		openModalPopup();
	} else {
		viewForm1.remove();
		confirmPopUp.remove();
	}

	/**
	 * 비밀번호 변경 팝업창
	 * @param action
	 */
	function openModalPopup(){
		// 화면ID, 화면ID사이즈(ex. 6:CM1000 / 13:CM1000_Detail), 팝업ID, 다국어
		let returnPopup = getLangCodePopup("AN1000_Pop1", 11, "viewForm1", "${LANG}");
		// let titlePop = returnPopup[0];
		// let pop01_btn01_SAVE = returnPopup[1];
		// let pop01_btn01_CLOSE = returnPopup[2];

		let titlePop = "비밀번호 변경";
		let pop01_btn01_SAVE = "저장";
		let pop01_btn01_CLOSE = "닫기";

		$("#viewForm1").dialog({
			autoOpen: true,
			title: titlePop,
			width: 500,
			modal: true,
			open: function () {
				popReset("viewForm1");
				},
			close: function () {
				getAjaxJsonData("logout", {}, "logoutCallBack");
				},
			buttons: [
				{
					text : pop01_btn01_SAVE,
					click : function(){
						finalCheckAndUpdate();
					},
				},
				{
					text : pop01_btn01_CLOSE,
					click : function () {
						getAjaxJsonData("logout", {}, "logoutCallBack");
					}
				}
			]
		}).css("z-index", 1000).prev(".ui-dialog-titlebar").css("background","#266f80").css("color","#fff");
	};

	/**
	 * 비밀번호 변경 후 로그아웃
	 */
	function passwordUpdateCallBack(data) {
		getAjaxJsonData("logout", {}, "logoutCallBack");
	};

	/**
	 * 비밀번호 변경창에서 확인 클릭 시 유효성 검사
	 */
	function finalCheckAndUpdate() {
		let messageArray = [
			"비밀번호를 입력해 주시기 바랍니다.",
			"올바른 비밀번호가 아닙니다.",
			"비밀번호가 맞지 않습니다.",
			"비밀번호를 변경 후 다시 로그인해 주시기 바랍니다."
		];

		if (password1.value == "") {
			password1.focus();
			toast("안내", messageArray[0], "info");
		} else if (password2.value == "") {
			password2.focus();
			toast("안내", messageArray[0], "info");
		}

		let check = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,}$/;
		if (!check.test(password1.value)) {
			password1.focus();
			toast("안내", messageArray[1], "info");
			return;
		}
		if (!check.test(password2.value)) {
			password2.focus();
			toast("안내", messageArray[1], "info");
			return;
		}
		if (password1.value !== password2.value) {
			toast("안내", messageArray[2], "info");
			return;
		}
		confirms(messageArray[3]);
	}

	/**
	 * Comfirm창 확인버튼 클릭 시
	 */
	function confirmYes() {
		const param = {
			password1: password1.value,
			password2: password2.value
		};
		getAjaxJsonData("/loginCheck", param, "passwordUpdateCallBack", "PATCH");

	}

	/**
	 * 비밀번호, 비밀번호 확인 유효성검사 후 컬러변경(true = green, false = red)
	 */
	function doubleCheckPassword() {
		const passwordText2 = document.querySelector("#password-text2");
		if (password1.value === password2.value) {
			passwordText2.style.color = green;
		} else {
			passwordText2.style.color = red;
		}
	}

	/**
	 * 비밀번호 유호성검사 후 컬러변경(true = green, false = red)
	 * @param password
	 */
	function checkPassword(password){
		let pw = password;
		let checkNumber = pw.search(/[0-9]/g);
		let checkEnglish = pw.search(/[a-z]/ig);
		let checkSpecialSymbol = pw.search(/[#?!@$%^&*-]/g);

		const pwLength = document.querySelector("#pw-length");
		if (pw.length >= 8) {
			pwLength.style.color = green;
		} else {
			pwLength.style.color = red;
		}

		const pwNumber = document.querySelector("#pw-number");
		if (checkNumber > -1) {
			pwNumber.style.color = green;
		} else {
			pwNumber.style.color = red;
		}

		const pwEnglish = document.querySelector("#pw-english");
		if (checkEnglish > -1) {
			pwEnglish.style.color = green;
		} else {
			pwEnglish.style.color = red;
		}

		const pwSpecialSymbol = document.querySelector("#pw-special-symbol");
		if (checkSpecialSymbol > -1) {
			pwSpecialSymbol.style.color = green;
		} else {
			pwSpecialSymbol.style.color = red;
		}

		const passwordText1 = document.querySelector("#password-text1");
		if (pw.length >= 8 && checkNumber > -1 && checkEnglish > -1 && checkSpecialSymbol > -1) {
			passwordText1.style.color = green;
		} else {
			passwordText1.style.color = red;
		}
	}

</script>