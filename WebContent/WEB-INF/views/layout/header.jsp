<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<body>
		<h1 class="logo">
			<a href="javascript:void(0);" title="홈으로바로가기">
				<img src="/resources/img/main/logo.png" alt="홈으로바로가기" class="logo-img"/>
				<!-- Framework -->
			</a>
		</h1>
		<nav>
			<!-- 상단 네비게이션 -->
		</nav>
		<div class="user-wrap">
			<div id="timer"></div>
			<div class="user-info-txt">
				<ul>
					<li class="user-team">[${USER.DEPT_NM}]</li>
					<li class="user-name">${USER.USER_NM}<span>님</span></li>
				</ul>
			</div>
			<div class="user-img">
				<a href="javascript:void(0);" title="사용자 정보 더보기" class="user-open">
					<img src="/resources/img/common/ico-profile-white.png" alt="사용자 이미지">
					<span class="mask"></span>
				</a>
			</div>
			<div class="user-info">
				<div class="user-img">
					<a href="javascript:void(0);" title="사용자 정보 더보기" class="user-open">
						<img src="/resources/img/common/ico-profile-gray.png" alt="사용자 이미지">
					</a>
				</div>
				<p class="user-name">${USER.USER_ID}</p>
				<ul class="user-team">
					<li>${USER.DEPT_NM}</li>
					<li>${USER.GRADE_NM}</li>
				</ul>
				<ul class="user-logout">
					<li><a href="javascript:void(0);" id="PUA100ChangeUserPW" onclick="openModalPopup();">암호변경</a></li>
					<li><a href="javascript:void(0);" id="logout" title="로그아웃">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</body>
</html>