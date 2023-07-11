<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<title>HCNC 그룹웨어 로그인</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" type="text/css" href="/resources/css/import.css" />
		<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
	</head>
	<body>
		<div class="login-page-wrap">
		    <div class="login-wrap">
		        <div class="login-box-wrap">
		            <div class="left-box">
		                <div class="login-logo">
		                	<img src="/resources/img/main/logo-login.png" />
		                </div>
		                <h1>그룹웨어</h1>
                		<p>HCNC GROUPWARE SYSTEM</p>
                	</div>
                	<div class="right-box">
                		<h2>로그인</h2>
						<form name="flogin" method="post" accept-charset="utf-8">
							<div class="login-input">
								<input type="text" id="id" name= "id" class="mg-b15 user-id" value="${USER_ID}" autocomplete="off">
								<label for="" class="hide">아이디</label>
								<input type="password" id="pwd" name="pwd" class="user-pw" value="${PASSWORD}" autocomplete="off">
								<label for="" class="hide">패스워드</label>
								<div class="login-check">
									<input type="checkbox" id="idSave" name="idSave" class="mg-r5"><label for="idSave">ID 저장</label>
								</div>
							</div>
						</form>
						<div id="msgInfo" class="msg"> 
							<c:if test="${msg == 'idFailure'}">
								<div class="red">입력하신 정보와 일치하는 정보가 없습니다.</div>
							</c:if>
							<c:if test="${msg == 'pwdFailure'}">
								<div class="red">입력하신 정보와 일치하는 정보가 없습니다.</div>
							</c:if>
							<c:if test="${msg == 'retireFailure'}">
								<div class="red">입력하신 정보와 일치하는 정보가 없습니다.</div>
							</c:if>
						</div>
						<button id="btnLogin" title="로그인" class="btn-login">LOGIN</button>
						<p class="login-guid">* 사번 또는 비밀번호를 찾을 시 관리자에게 문의</p>
					</div>
				</div>
			</div>
			<footer>
				<p>Copyright 2023 ©Hcnc. All rights reserved.</p>
			</footer>
		</div>
	</body>
	
	<script>
		/* Document가 로드되었을 때 실행되는 코드 */
		$(document).ready(function() {
			var cook = document.cookie + ";";
			var index = cook.indexOf("userID", 0);
			var userId = "";
			
			if(index != -1){
				cook = cook.substring(index, cook.length);
				begin = cook.indexOf("=", 0) + 1;
				end = cook.indexOf(";", begin);
				userId = unescape(cook.substring(begin, end))
			}
			
			if(userId != ""){
				$("#id").val(userId);
				$("#idSave").attr("checked", true);
			}
		});

		/* iframe에서 해당 창을 열었을 경우 부모창의 주소를 옮긴다. */
		$(function(){
			if (window != top){
				top.location.href = location.href;
			}
		});
		
		/* 로그인 버튼 클릭 이벤트 */
		$("#btnLogin").on({
			click: function() {
				fnLogin();
			}
		});
		
		/* ID 입력후 엔터키 이벤트 */
		$("#id").on({
			keydown: function() {
				if(event.keyCode == 13){
					fnLogin();
				}
			}
		});
		
		/* PW 입력후 엔터키 이벤트 */
		$("#pwd").on({
			keydown: function() {
				if(event.keyCode == 13){
					fnLogin();
				}
			}
		});
		
		/* 로그인 확인 */
		function fnLogin(){
			var emplNo = $("#id").val();
			var passwd = $("#pwd").val();
			var idSave = $("input[name='idSave']:checked").val();
			
			if (emplNo == "") {
				$("#msgInfo").append("<div class='red'>아이디를 입력하세요</div>");
				$("#id").focus();
				return;
			}
			
			if (passwd == "") {
				$("#msgInfo").append("<div class='red'>비밀번호를 입력하세요</div>");
				$("#pwd").focus();
				return;
			}
			
			document.flogin.action = "/loginCheck";
			document.flogin.submit();
		}
	</script>
</html>