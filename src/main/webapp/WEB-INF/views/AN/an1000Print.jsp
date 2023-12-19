<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	@charset "UTF-8";
		
	*{margin:0;padding:0;}
	html, body{height:100%;}
	ol, ul, li, dl, dt, dd {
		list-style: none;
	}
	fieldset {width:100%; border:0px;}
	noscript, caption, legend {display:block;position:absolute;width:0;height:0;text-indent:-9999999px;overflow:hidden;}
	
	table {
		border-collapse: collapse;
		border-spacing: 0;
	}
	a {text-decoration:none; vertical-align:middle;}
	a:active, visited, link {text-decoration:none;}
	a:hover {text-decoration:none;}
	button{cursor:pointer;}
	
	ins {
		text-decoration: none;
	}
	del {
		text-decoration: line-through;
	}
	
	html, body, div, span, applet, object, iframe,
	h1, h2, h3, h4, h5, h6, p, blockquote, pre,
	a, abbr, acronym, address, big, cite, code,
	del, dfn, em, img, ins, kbd, q, s, samp,
	small, strike, strong, sub, sup, tt, var,
	b, u, i, center,
	dl, dt, dd, ol, ul, li,
	fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td,
	article, aside, canvas, details, figcaption, figure, 
	footer, header, hgroup, menu, nav, section, summary,
	time, mark, audio, video {
		margin: 0;
		padding: 0;
		border: 0;
		outline: 0;
		font-size: 100%;
		/*font: inherit;*/
		vertical-align: middle;
	}
	
	/* HTML5 display-role reset for older browsers */
	article, aside, details, figcaption, figure, 
	footer, header, hgroup, menu, nav, section {
		display: block;
	}
	
	blockquote, q {
		quotes: none;
	}
	blockquote:before, blockquote:after,
	q:before, q:after {
		content: '';
		content: none;
	}
	html {
	    font-size: 8px;
	}
	body {
	    display: flex;
	    justify-content: center;
	    margin: 0;
	    padding: 20px;
	}
	input:focus, textarea:focus {
	    outline: none;
	}
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
	img {
	    width: 125px;
	}
	.container {
	    width: 800px;
		margin-top: 30px;
	    display: flex;
	    flex-direction: column;
	}
	.container-top {
	    display: flex;
	    justify-content: space-between;
		margin: 10px 0px;
	}
	.container-top h1 {
		font-size: 3rem;
		font-weight: bold;
		letter-spacing: 35px;
	}
	.con-section {
	    box-shadow: inherit;
	    margin: 0px;
	}
	#register-1 {
	    justify-content: space-between;
	    align-items: center;
	    margin: 10px 0;
	}
	table {
	    border: 2px solid black;
	    box-sizing: border-box;
	}
	th, td {
	    border: 1px solid black;
	    zoom: 0.8;
	}
	td:not(.common-sign1, .sign-date, .sign-space) {
	    text-align: center;
	    vertical-align: middle;
	    height: 20px;
	}
	li {
	    list-style: none;
	}
	p {
	    margin: 10px 0;
	    font-size: 1.1rem;
	}
	.btn-box {
	    display: flex;
	    justify-content: flex-end;
	}
	.btn-box input {
	    margin-top: 20px;
	    margin-left: 10px;
	}
	#btnPrint {
		display: block;
		background: #DE012B no-repeat 15px center;
		color: #fff;
		font-weight: bold;
		padding: 6px 20px 6px 20px;
		border-radius: 5px;
		cursor: pointer;
	}
	.column-text {
		line-height: 14px;
		width: 30px;
		letter-spacing: 2.6px;
		writing-mode: tb;
		height: 100px !important;
		font-size: 13px;
	}
	.common-sign1 {
	    height: 25px;
	    width: 90px;
	    vertical-align: middle;
	    text-align: center;
		font-size: 15px;
		padding: 2px 0px;
	}
	.sign-space {
	    height: 100px;
	}
	.sign-date {
	    height: 10px;
	    text-align: center;
	    vertical-align: middle;
		font-size: 12px;
	}
	.common-sign2 td {
	    font-size: 0.9rem;
	    height: 10px;
	    vertical-align: middle;
	    text-align: center;
	}
	.common-td {
		width: 25%;
	}
	
	/* section2 */
	#register-2 {
	    flex-direction: column;
	}

	.common-tr1 {
	    height: 60px;
	}
	.common-tr2 {
		height: 350px;
	}

	.holiday-period {
		display: flex;
		justify-content: space-evenly;
		align-items: center;
	}
	.holiday-period .period-item {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	.table1 dt, span {
		font-size: 2rem;
	}

	.sign-space2 {
		height: 100%;
		display: flex;
		flex-direction: column;
		justify-content: space-evenly;
	}
	.space2-item {
		width: 300px;
		align-self: flex-end;
		text-align: left;
	}
	.common-text {
		letter-spacing: 3em;
		margin-left: 3em;
	}
	.common-text2 {
		letter-spacing: 6px;
		margin-left: 6px;
	}
	.common-text3 {
		align-self: end;
	}

	@media print {
	    .btn-box {
	        display: none;
	    }
		.container-top {
			justify-content: center;
		}
		.container-top img {
			position: absolute;
			left: 0;
		}
	}
</style>

<script type="text/javascript" src="<c:url value='/resources/js/bluebird.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/html2canvas.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jspdf.min.js'/>"></script>

<script type="text/javascript">
	let buyListLen = 0;
	let mmListLen = 0;
</script>

<div class="container">
	<div class="container-top">
	    <img src="/resources/img/common/hcnc_logo_web.png" alt="HCNC LOGO">
		<h1>휴가신청서</h1>
	    <div class="btn-box">
	        <input type="button" id="btnPrint" class="btn" value="출력">
	    </div>
	</div>
	<section class="con-section" id="register-1">
	    <div>
	        <table class="sign-table">
	            <tr>
	                <td rowspan="2" class="column-text">경영지원본부</td>
	                <td class="common-sign1">본부장</td>
	            </tr>
	            <tr>
	                <td class="sign-space"></td>
	            </tr>
	            <tr>
	                <td class="sign-date">일자</td>
	                <td class="common-sign1"></td>
	            </tr>
	        </table>
	    </div>

	    <table class="sign-table">
	        <tr>
	            <td rowspan="2" class="column-text">결재</td>
	            <td class="common-sign1">팀장</td>
	            <td class="common-sign1">부서장/PM</td>
	            <td class="common-sign1">담당중역</td>
	            <td class="common-sign1">부문장</td>
	            <td class="common-sign1">본부장</td>
	            <td class="common-sign1">사장</td>
	        </tr>
	        <tr>
	            <td class="sign-space"></td>
	            <td class="sign-space"></td>
	            <td class="sign-space"></td>
	            <td class="sign-space"></td>
	            <td class="sign-space"></td>
	            <td class="sign-space"></td>
	            <td class="sign-space"></td>
	        </tr>
	        <tr>
				<td class="sign-date">일자</td>
	            <td class="common-sign1"></td>
	            <td class="common-sign1"></td>
	            <td class="common-sign1"></td>
	            <td class="common-sign1"></td>
	            <td class="common-sign1"></td>
				<td class="common-sign1"></td>
	        </tr>
	    </table>
	</section>
	<section class="con-section" id="register-2">
	    <table>
	        <tr class="common-tr1">
				<td class="common-td"><span class="common-text">소속</span></td>
	            <td class="common-td"><span class="common-text2">${HolidayPrintInfo.DEPT_NM}</span></td>
				<td class="common-td"><span class="common-text">사번</span></td>
	            <td class="common-td"><span>${HolidayPrintInfo.USER_NUM}</span></td>
	        </tr>
	        <tr class="common-tr1">
	            <td><span class="common-text">성명</span></td>
	            <td><span class="common-text2">${HolidayPrintInfo.USER_NM}</span></td>
	            <td><span class="common-text2">담당업무</span></td>
	            <td><span class="common-text2">${HolidayPrintInfo.TASK}</span></td>
	        </tr>
			<tr class="common-tr1">
				<td><span class="common-text">직위</span></td>
				<td><span>${HolidayPrintInfo.GRADE_NM}</span></td>
				<td><span>업무인수자</span></td>
				<td><span>${HolidayPrintInfo.ACQUIRER}</span></td>
			</tr>
			<tr class="common-tr1">
				<td><span class="common-text">종류</span></td>
				<td colspan="3"><span id="holiday-type" class="common-text2">${HolidayPrintInfo.HOLIDAY_TYPE}</span></td>
			</tr>
			<tr class="common-tr1">
				<td><span class="common-text">사유</span></td>
				<td colspan="3"><span>${HolidayPrintInfo.HOLIDAY_REASON}</span></td>
			</tr>
			<tr class="common-tr1">
				<td><span class="common-text">기간</span></td>
				<td colspan="3">
					<div class="holiday-period">
						<div class="period-item">
							<span id="holiday-start" class="date">${HolidayPrintInfo.HOLIDAY_START}</span>
							<span id="holiday-end" class="date">${HolidayPrintInfo.HOLIDAY_END}</span>
						</div>
						<div class="period-item">
							<span class="date-time"></span>
							<span class="date-time"></span>
						</div>
						<div class="period-item">
							<span id="holiday-cnt">${HolidayPrintInfo.HOLIDAY_CNT}</span>
						</div>
					</div>

				</td>
			</tr>
			<tr class="common-tr1">
				<td><span>비상연락망</span></td>
				<td colspan="3"><span>${HolidayPrintInfo.EMERGENCY}</span></td>
			</tr>
			<tr class="common-tr2">
				<td colspan="4">
					<div class="sign-space2">
						<span>위와 같이 휴가를 신청하오니 재가 바랍니다.</span>
						<span class="date">${HolidayPrintInfo.REG_DT}</span>
						<span class="space2-item"><span class="common-text">소</span>속 : ${HolidayPrintInfo.DEPT_NM}</span>
						<span class="space2-item"><span class="common-text">성</span>명<span class="common-text2"> : ${HolidayPrintInfo.USER_NM}</span>(인)</span>
					</div>
				</td>
			</tr>
	    </table>
	</section>
	<div style="display: flex;justify-content: space-between;">
		<div>
			<p><i>그룹웨어</i></p>
		</div>
		<div>
			<p class="common-text3"><i>주식회사 에이치씨엔씨</i></p>
		</div>
	</div>
</div>


<script>
	$(document).ready(function() {
		if(buyListLen != 0) {
			$("#buy").attr("rowspan", buyListLen);
		}
		if(mmListLen != 0) {
			$("#manmonth").attr("rowspan", mmListLen);
		}

		$('#btnPrint').click(function() {
			window.print();
			location.reload();
		});
	});

	window.onload = () => {
		const timeCheck = ['09 : 00', '14 : 00', '18 : 00'];
		const date_time = document.querySelectorAll(".date-time");

		document.querySelectorAll('.date').forEach(date => {
			date.innerText = dateFormatter(date.innerText);
		});

		let index = ['반차-오전', '반차-오후', '민방위-오전', '민방위-오후'].indexOf(document.querySelector("#holiday-type").innerText);
		holidayTypeAndTimeCheck(index, date_time, timeCheck);

		const count = document.querySelector('#holiday-cnt');
		count.innerText = "( " + parseFloat(count.innerText) + " 일간)";
	};

	function dateFormatter(date) {
		let year = date.toString().substring(0, 4);
		let month = parseInt(date.toString().substring(5, 7));
		let day = parseInt(date.toString().substring(8, 10));
		return  year + "년  " + month + "월  " + day + "일";
	}

	function holidayTypeAndTimeCheck(index, date_time, timeCheck) {
		if (index % 2 == 0) {
			date_time.forEach((time, i) => time.innerText = timeCheck[i]);
		} else if (index % 2 == 1) {
			date_time.forEach((time, i) => time.innerText = timeCheck[i + 1]);
		} else {
			date_time.forEach((time, i) => {
				if (i != 0) i = i + 1
				time.innerText = timeCheck[i];
			});
		}
	}
</script>