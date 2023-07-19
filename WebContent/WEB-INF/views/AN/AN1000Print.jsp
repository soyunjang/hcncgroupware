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
	    padding: 0;
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
	    width: 100px;
	}
	table-0 {
	    font-size: 8px;
	}
	
	.table-input {
	    width: 100%;
	    height: 100%;
	    font-size: 1rem;
	    border: none;
	    margin: 0;
	    padding: 0;
	    box-sizing: border-box;
	    text-align: center;
	    background-color: white !important;
	}
	textarea {
	    width: 100%;
	    border: none;
	    margin: 0;
	    padding: 10px;
	    box-sizing: border-box;
	    resize: none;
	    overflow: hidden;
	}
	.container {
	    width: 800px;
	    display: flex;
	    flex-direction: column;
	}
	.container-top {
	    display: flex;
	    justify-content: space-between;
	}
	
	.container-middle {
	    display: flex;
	
	}
	
	.con-section {
	    box-shadow: inherit;
	    margin: 0px;
	}
	#register-1 {
	    justify-content: space-between;
	    align-items: center;
	    margin-top: 10px;
	}
	table {
	    border: 2px solid black;
	    box-sizing: border-box;
	}
	th, td {
	    border: 1px solid black;
	    zoom: 0.8;
	}
	td:not(.common-sign1, .sign-date, .sign-space, .textarea-box) {
	    text-align: center;
	    vertical-align: middle;
	    height: 20px;
	}
	.td-middle {
	    width: 80px;
	}
	.td-short {
	    width: 30px;
	}
	
	li {
	    list-style: none;
	}
	p {
	    margin: 10px 0;
	    font-size: 1.1rem;
	}
	/*span {*/
	/*    zoom: 0.8;*/
	/*}*/
	
	.purchase-merge, .input-merge, .expenses-merge {
	    width: 50px;
	}
	
	
	.btn-box {
	    display: flex;
	    justify-content: flex-end;
	}
	.btn-box input {
	    margin-top: 20px;
	    margin-left: 10px;
	}
	.column-text {
	    line-height: 14px;
	    width: 25px;
	    letter-spacing: 2.6px;
		writing-mode: tb;
		height: 100px !important;
	}
	.column-common {
	    width: 5%;
	}
	.common-sign1 {
	    height: 20px;
	    width: 70px;
	    vertical-align: middle;
	    text-align: center;
	}
	.sign-space {
	    height: 70px;
	}
	.sign-date {
	    height: 10px;
	    text-align: center;
	    vertical-align: middle;
	}
	.common-sign2 td {
	    font-size: 0.9rem;
	    height: 10px;
	    vertical-align: middle;
	    text-align: center;
	}
	#register-1 h1 {
	    font-size: 1.8rem;
	    font-weight: bold;
	    letter-spacing: 10px;
	}
	
	/* section2 */
	#register-2 {
	    flex-direction: column;
	}
	#project-name {
	    text-align: center;
	}
	
	/* section3 */
	#register-3 {
	    flex-direction: column;
	}
	.register-3-title {
	    display: flex;
	    justify-content: space-between;
	}
	
	/* section4 */
	#register-4 {
	    flex-direction: column;
	}
	
	/* section5 */
	#register-5 {
	    flex-direction: column;
	    align-items: flex-end;
	}
	#register-5 input {
	    width: 150px;
	    font-size: 1.5rem;
	    font-weight: bold;
	    text-align: center;
	    border: none;
	    border-bottom: 1px solid black;
	}
	
	/* section6 */
	#register-6 {
	    flex-direction: column;
	}
	
	/* section7 */
	#register-7 {
	    flex-direction: column;
	}
	
	#textarea-1, #textarea-2 {
	    display: block;
	    width: 100%;
	    min-width: 200px;
	    text-align: left;
	    padding: 5px;
	}
	
	#client, #project-name {
	    display: inline-block;
	}
	
	#unit-price {
	    display: inline-block;
	    width: 50px;
	}
	
	.margin-box {
	    width: 150px;
	    height: 20px;
	    line-height: 20px;
	    text-align: right;
	    border-bottom: 1px solid black;
	}
	
	#total-margin {
	    font-size: 12px;
	    font-weight: bold;
	}
	
	.td-a {
	    width: 75px;
	}
	
	.title-table-tr {
	    height: 30px;
	}
	.title-table-td {
	    width: 150px;
	}
	.title-table-td2 {
	    width: 250px;
	}
	
	
	@media print {
	    .btn-box {
	        display: none;
	    }
	}
</style>

<script type="text/javascript" src="<c:url value='/resources/js/bluebird.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/html2canvas.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jspdf.min.js'/>"></script>

<script type="text/javascript">
	var buyListLen = 0;
	var mmListLen = 0;
</script>

<div class="container">
	<div class="container-top">
	    <img src="/resources/img/common/hcnc_logo_web.png" alt="HCNC LOGO">
	    <div class="btn-box">
	        <input type="button" id="btnPrint" class="btn btn-primary" value="출력">
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
	    <h1>휴가신청서</h1>
	    <table class="sign-table">
	        <tr>
	            <td rowspan="3" class="column-text">결재</td>
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
	        </tr>
	        <tr>
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
	        <tr class="title-table-tr">
	            <td class="">소속</td>
	            <td><span id=""></span></td>
	            <td class="">사번</td>
	            <td class=""><span id=""></span></td>
	        </tr>
	        <tr class="title-table-tr">
	            <td>성명</td>
	            <td><span id=""></span></td>
	            <td>담당업무</td>
	            <td><span id=""></span></td>
	        </tr>
			<tr class="title-table-tr">
				<td>직위</td>
				<td><span id=""></span></td>
				<td>업무인수자</td>
				<td><span id=""></span></td>
			</tr>
			<tr class="title-table-tr">
				<td>종류</td>
				<td colspan="3"></td>
			</tr>
			<tr class="title-table-tr">
				<td>사유</td>
				<td colspan="3"></td>
			</tr>
			<tr class="title-table-tr">
				<td>기간</td>
				<td colspan="3"></td>
			</tr>
			<tr class="title-table-tr">
				<td>비상연락망</td>
				<td colspan="3"></td>
			</tr>
			<tr class="title-table-tr">
				<td colspan="4">
					<div>
						<span>위와 같이 휴가를 신청하오니 재가 바랍니다.</span>

						<span>날짜</span>
						<span>소속</span>
						<span>성명</span>
					</div>
				</td>
			</tr>
	    </table>
	</section>
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
</script>