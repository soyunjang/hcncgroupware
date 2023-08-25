<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	@charset "UTF-8";
		
	*{margin:0;padding:0;}
	html, body{height:100%;}
	ol, ul, li, dl, dt, dd {list-style: none;}
	fieldset {width:100%; border:0px;}
	noscript, caption, legend {display:block;position:absolute;width:0;height:0;text-indent:-9999999px;overflow:hidden;}
	
	table {border-collapse: collapse; border-spacing: 0;}
	a {text-decoration:none; vertical-align:middle;}
	a:active, visited, link {text-decoration:none;}
	a:hover {text-decoration:none;}
	button{cursor:pointer;}
	
	ins {text-decoration: none;}
	del {text-decoration: line-through;}
	
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
	footer, header, hgroup, menu, nav, section {display: block;}
	
	blockquote, q {quotes: none;}
	blockquote:before, blockquote:after,
	q:before, q:after {content: ''; content: none;}
	
	html {font-size: 8px;}
	body {
	    display: flex;
	    justify-content: center;
	    margin: 0;
	    padding: 0;
	}
	input:focus, textarea:focus {outline: none;}
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
	img {width: 100px;}
	table-0 {font-size: 8px;}
	
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

	.con-section {box-shadow: inherit; margin: 0px;}
	#register-1 {
	    justify-content: space-between;
	    align-items: center;
	    margin-top: 10px;
	}
	table {border: 2px solid black; box-sizing: border-box;}
	th, td {border: 1px solid black; zoom: 0.8;}
	td:not(.common-sign1, .sign-date, .sign-space, .textarea-box) {text-align: center; vertical-align: middle; height: 20px;}
	.td-middle {width: 80px;}
	.td-short {width: 30px;}
	li {list-style: none;}
	p {margin: 10px 0; font-size: 1.1rem;}
	.purchase-merge, .input-merge, .expenses-merge {width: 50px;}
	.btn-box {display: flex; justify-content: flex-end;}
	.btn-box input {margin-top: 20px; margin-left: 10px;}
	.column-text {
	    line-height: 14px;
	    width: 25px;
	    letter-spacing: 2.6px;
		writing-mode: tb;
		height: 100px !important;
	}
	.common-sign1 {
	    height: 20px;
	    width: 70px;
	    vertical-align: middle;
	    text-align: center;
	}
	.sign-space {height: 70px;}
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
	#register-2 {flex-direction: column;}
	#project-name {text-align: center;}
	
	/* section3 */
	#register-3 {flex-direction: column;}
	.register-3-title {display: flex; justify-content: space-between;}
	
	/* section4 */
	#register-4 {flex-direction: column;}
	
	/* section5 */
	#register-5 {flex-direction: column; align-items: flex-end;}
	#register-5 input {
	    width: 150px;
	    font-size: 1.5rem;
	    font-weight: bold;
	    text-align: center;
	    border: none;
	    border-bottom: 1px solid black;
	}
	
	/* section6 */
	#register-6 {flex-direction: column;}
	
	/* section7 */
	#register-7 {flex-direction: column;}
	
	#textarea-1, #textarea-2 {
	    display: block;
	    width: 100%;
	    min-width: 200px;
	    text-align: left;
	    padding: 5px;
		white-space: break-spaces;
	}
	
	#client, #project-name {display: inline-block;}
	#unit-price {display: inline-block; width: 50px;}
	
	.margin-box {
	    width: 150px;
	    height: 20px;
	    line-height: 20px;
	    text-align: right;
	    border-bottom: 1px solid black;
	}
	
	#total-margin {font-size: 12px; font-weight: bold;}
	.td-a {width: 75px;}
	.title-table-tr {height: 30px;}
	.title-table-td {width: 150px;}
	.title-table-td2 {width: 250px;}

	@media print {
	    .btn-box {display: none;}
	}
</style>

<script type="text/javascript" src="<c:url value='/resources/js/bluebird.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/html2canvas.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jspdf.min.js'/>"></script>

<div class="container">
	<div class="container-top">
	    <img src="/resources/img/common/hcnc_logo_web.png" alt="HCNC LOGO">
	    <div class="btn-box">
	        <input type="button" id="btnPrint" class="btn btn-primary" value="���">
	    </div>
	</div>
	<section class="con-section" id="register-1">
	    <div>
	        <table class="sign-table">
	            <tr>
	                <td rowspan="2" class="column-text">�濵��������</td>
	                <td class="common-sign1">������</td>
	            </tr>
	            <tr>
	                <td class="sign-space"></td>
	            </tr>
	            <tr>
	                <td class="sign-date">����</td>
	                <td class="common-sign1"></td>
	            </tr>
	        </table>
	    </div>
	    <h1>�Ǹ�ǰ�Ǽ�</h1>
	    <table class="sign-table">
	        <tr>
	            <td rowspan="3" class="column-text">����</td>
	            <td class="common-sign1">����</td>
	            <td class="common-sign1">�μ���/PM</td>
	            <td class="common-sign1">����߿�</td>
	            <td class="common-sign1">�ι���</td>
	            <td class="common-sign1">������</td>
	            <td class="common-sign1">����</td>
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
	    <p>�Ʒ��� ���� ǰ���Ͽ��� �簡�Ͽ� �ֽñ� �ٶ��ϴ�.</p>
	    <p>�ۼ����� : <span id="date-span">${sa1000List.OBTAIN_REG_DT}</span></p>
	    <table>
	        <tr class="title-table-tr">
	            <td class="title-table-td">�ŷ�ó��<span style="font-size: 0.8rem"><br>(�����꼭����ó)</span></td>
	            <td><span id="client">${sa1000List.OBTAIN_ACCOUNT}</span></td>
	            <td class="title-table-td">�Ǹ����Ǽ� NO.</td>
	            <td class="title-table-td2"><span id="form-number">${sa1000List.SALES_NUM}</span></td>
	        </tr>
	        <tr class="title-table-tr">
	            <td>������Ʈ��</td>
	            <td><span id="project-name">${sa1000List.PROJECT_NM}</span></td>
	            <td>���������</td>
	            <td>
					<div style="display: flex">
						<div style="flex: 4">
							<span id="business-manager">${sa1000List.OBTAIN_SALES_PIC}</span>
						</div>
						<div style="flex: 1;margin-left: -60px;">
							<span>( �� )</span>
						</div>
					</div>
				</td>
	        </tr>
	    </table>
	</section>
	<section class="con-section" id="register-3">
	    <div class="register-3-title">
	        <p>1. ������Ȳ</p>
	        <p>&lt;VAT����&gt;</p>
	    </div>
	    <table id="table-0">
	        <thead>
	            <tr>
	                <td rowspan="2">����</td>
	                <td rowspan="2" colspan="2">ǰ��</td>
	                <td rowspan="2" class="td-short">����</td>
	                <td colspan="2">����(����)</td>
	                <td colspan="2">�Ǹ�(���ְ�)</td>
	                <td colspan="2" >������</td>
	                <td colspan="2">����</td>
	                <td colspan="2">����</td>
	                <td rowspan="2" class="">���</td>
	            </tr>
	            <tr>
	                <td class="td-a">�ܰ�</td>
	                <td class="td-a">�ݾ�</td>
	                <td class="td-a">�ܰ�</td>
	                <td class="td-a">�ݾ�</td>
	                <td class="td-a">�ݾ�</td>
	                <td class="td-short">%</td>
	                <td class="td-short">����<br>���</td>
	                <td style=" width: 50px;">������</td>
	                <td style="width: 55px;">����ó��</td>
	                <td>���޹��<br><span>(������)</span></td>
	            </tr>
	        </thead>
	        <tbody id="table-obtain">
	            <tr>
	                <td><span>1</span></td>
	                <td>���ֳ���</td>
	                <td style="width: 180px;"><span id="obtain-title">${sa1000List.OBTAIN_ITEM}</span></td>
	                <td><span id="sell-count">${sa1000List.OBTAIN_ITEM_CNT}</span></td>
	                <td></td>
	                <td></td>
	                <td><span id="unit-sell"><fmt:formatNumber value="${sa1000List.COLLECT_UNIT_PRICE}" pattern="#,###" /></span></td>
	                <td><span id="obtain-sell"><fmt:formatNumber value="${sa1000List.COLLECT_SALES_AMOUNT}" pattern="#,###" /></span></td>
	                <td><span></span></td>
	                <td><span></span></td>
	                <td><span id="payment"></span></td>
	                <td><span id="payment-date"></span></td>
	                <td></td>
	                <td></td>
	                <td></td>
	            </tr>
	        </tbody>
	        <c:choose>
		        <c:when test="${fn:length(sa1002List) > 0 }">
		        	<tbody id="table-top">
		        		<c:forEach var="item" items="${sa1002List}" varStatus="status">
							<tr>
								<td><span>${status.index + 2}</span></td>
								<c:if test="${status.index == 0 }">
									<td class="purchase-merge" id="buy">���Գ���</td>
								</c:if>
								<td><span id="purchase-title">${item.BUY_ITEM}</span></td>
								<td><span id="item-count">${item.BUY_CNT}</span></td>
								<td><span id="unit-price" class="ta-r"><fmt:formatNumber value="${item.BUY_UNIT_PRICE}" pattern="#,###" /></span></td>
								<td><span id="price" class="ta-r"><fmt:formatNumber value="${item.BUY_PRICE}" pattern="#,###" /></span></td>
								<td><span></span></td>
								<td><span></span></td>
								<td><span></span></td>
								<td><span></span></td>
								<td><span></span></td>
								<td><span></span></td>
								<td><span id="purchase">${item.BUY_PURCHASE}</span></td>
								<td><span id="purchasePayment">${item.BUY_PAYMENT}</span></td>
								<td><span id="obtainNote">${item.BUY_MEMO}</span></td>
							</tr>
						</c:forEach>
					</tbody>
				</c:when>
				<c:otherwise>
					<tbody>
						<tr>
							<td><span>2</span></td>
							<td class="purchase-merge" rowspan="7">���Գ���</td>
							<td><span>���� ������(Ư��)</span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
						</tr>
						<tr>
							<td><span>3</span></td>
							<td><span>���� ������(���)</span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
						</tr>
						<tr>
							<td><span>4</span></td>
							<td><span>���� ������(�߱�)</span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
						</tr>
						<tr>
							<td><span>5</span></td>
							<td><span>���� ������(�ʱ�)</span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
						</tr>
						<tr>
							<td><span>6</span></td>
							<td><span>H/W</span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
						</tr>
						<tr>
							<td><span>7</span></td>
							<td><span>S/W</span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
						</tr>
						<tr>
							<td><span>8</span></td>
							<td><span>�����</span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
							<td><span></span></td>
						</tr>
		        	</tbody>
        		</c:otherwise>
	        </c:choose>
	        <c:choose>
		        <c:when test="${fn:length(sa1003List) > 0 }">
		        	<tbody id="table-middle">
		        		<c:forEach var="item" items="${sa1003List}" varStatus="status">
			        		<tr>
								<c:choose>
									<c:when test="${fn:length(sa1002List) > 0 }">
										<td><span>${sa1002ListCnt + status.index + 2}</span></td>
									</c:when>
									<c:otherwise>
										<td><span>${item.IDX + status.index + 9}</span></td>
									</c:otherwise>
								</c:choose>
			        			<c:if test="${status.index == 0 }">
			        				<td class="input-merge" id="manmonth">���ΰ���</td>
			        			</c:if>
			        			<td><span id="input-name">${item.MANHOUR_ITEM}</span></td>
			        			<td><span id="input-count">${item.MANHOUR_CNT}</span></td>
			        			<td><span id="input-unit"><fmt:formatNumber value="${item.MANHOUR_UNIT_PRICE}" pattern="#,###" /></span></td>
			        			<td><span id="input-price"><fmt:formatNumber value="${item.MANHOUR_PRICE}" pattern="#,###" /></span></td>
			        			<td><span></span></td>
			        			<td><span></span></td>
			        			<td><span></span></td>
			        			<td><span></span></td>
			        			<td><span></span></td>
			        			<td><span></span></td>
			        			<td><span></span></td>
			        			<td><span></span></td>
			        			<td><span id="input-note">${item.MANHOUR_MEMO}</span></td>
			        		</tr>
		        		</c:forEach>
		        	</tbody>
		        </c:when>
		    	<c:otherwise>
		    		<tr>
	        			<td><span>3</span></td>
	        			<td class="input-merge" rowspan="4">���ΰ���</td>
	        			<td><span>Ư��</span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        		</tr>
	        		<tr>
	        			<td><span>4</span></td>
	        			<td><span>���</span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
						<td><span></span></td>
	        		</tr>
	        		<tr>
	        			<td><span>5</span></td>
	        			<td><span>�߱�</span></td>
						<td><span></span></td>
						<td><span></span></td>
						<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
						<td><span></span></td>
	        		</tr>
	        		<tr>
	        			<td><span>6</span></td>
	        			<td><span>�ʱ�</span></td>
						<td><span></span></td>
						<td><span></span></td>
						<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
	        			<td><span></span></td>
						<td><span></span></td>
	        		</tr>
		    	</c:otherwise>
		    </c:choose>
	        <c:choose>
		        <c:when test="${fn:length(sa1004List) > 0 }">
		        	<tbody id="table-bottom">
		        		<c:forEach var="item" items="${sa1004List}" varStatus="status">
		        			<tr>
								<c:choose>
									<c:when test="${fn:length(sa1002List) > 0 }">
										<td><span>${sa1002ListCnt + status.index + 6}</span></td>
									</c:when>
									<c:when test="${fn:length(sa1003List) > 0 }">
										<td><span>${sa1003ListCnt + status.index + 9}</span></td>
									</c:when>
									<c:otherwise>
										<td><span>${status.index + 13}</span></td>
									</c:otherwise>
								</c:choose>
		        				<td class="expenses-merge" rowspan="1">���</td>
		        				<td><span id="expenses-kind">������ / ȸ�Ǻ� / ��Ÿ��� ��</span></td>
		        				<td><span></span></td>
		        				<td><span></span></td>
		        				<td><span id="expenses-price"><fmt:formatNumber value="${item.EXPENSE_PRICE}" pattern="#,###" /></span></td>
								<td><span></span></td>
								<td><span></span></td>
								<td><span></span></td>
								<td><span></span></td>
								<td><span></span></td>
								<td><span></span></td>
								<td><span></span></td>
								<td><span></span></td>
		        				<td><span id="expenses-note">${item.EXPENSE_MEMO}</span></td>
		        			</tr>
		        		</c:forEach>
		        	</tbody>
		        </c:when>
		        <c:otherwise>
		        	<tr>
	       				<td><span>7</span></td>
	       				<td class="expenses-merge" rowspan="1">���</td>
	       				<td><span>������ / ȸ�Ǻ� / ��Ÿ��� ��</span></td>
	       				<td><span></span></td>
	       				<td><span></span></td>
	       				<td><span></span></td>
	       				<td><span></span></td>
	       				<td><span></span></td>
	       				<td><span></span></td>
	       				<td><span></span></td>
	       				<td><span></span></td>
	       				<td><span></span></td>
	       				<td><span></span></td>
	       				<td><span></span></td>
						<td><span></span></td>
	       			</tr>
		        </c:otherwise>
		    </c:choose>
	        <tr>
	            <td colspan="3">�հ�</td>
	            <td><input type="text" class="table-input" id="item-count-total" name="" readonly></td>
	            <td><input type="text" class="table-input" id="unit-price-total" name="" readonly></td>
	            <td><span id="price-total"><fmt:formatNumber value="${sa1000List.BUY_PRICE + sa1000List.MANHOUR_PRICE + sa1000List.EXPENSE_PRICE}" pattern="#,###" /></span></td>
	            <td><span class="table-input" id="unit-sell-total"></span></td>
	            <td><span class="table-input" id="sell-total"><fmt:formatNumber value="${sa1000List.COLLECT_SALES_AMOUNT}" pattern="#,###" /></span></td>
	            <td><span class="table-input" id="obtain-margin"><fmt:formatNumber value="${sa1000List.COLLECT_MARGIN}" pattern="#,###" /></span></td>
	            <td><span class="table-input" id="obtain-margin-per">${sa1000List.COLLECT_MARGIN_PER}</span></td>
	            <td colspan="2"></td>
	            <td colspan="2"></td>
	            <td></td>
	        </tr>
	    </table>
	</section>
	<section class="con-section" id="register-4">
	    <p>2. ��ġ�� �� ���񽺺��</p>
	    <table id="table-1">
	        <tr>
	            <td rowspan="2" class="td-short">����</td>
	            <td rowspan="2">�ش�ŷ���<br><span>(�����/���޾�ü)</span></td>
	            <td rowspan="2" class="td-short">����</td>
	            <td rowspan="2" class="td-middle">���ֱݾ�<br><span>(���ܰ�)</span></td>
	            <td colspan="2">��ġ��</td>
	            <td colspan="2">����(3%)</td>
	            <td rowspan="2" class="td-a">�հ�<span>��</span></td>
	            <td rowspan="2">���</td>
	        </tr>
	        <tr>
	            <td class="td-a">�ܰ�</td>
	            <td class="td-a">�ݾ�</td>
	            <td class="td-a">�ܰ�</td>
	            <td class="td-a">�ݾ�</td>
	        </tr>
	        <c:choose>
		        <c:when test="${fn:length(sa1005List) > 0 }">
		        	<tbody id="table-bottom">
		        		<c:forEach var="item" items="${sa1005List}" varStatus="status">
		        			<tr>
		        				<td><span>${status.index + 1}</span></td>
		        				<td><span id="company-name">${item.COST_VENDOR}</span></td>
		        				<td><span id="company-count">${item.COST_CNT}</span></td>
		        				<td><span id="company-price"><fmt:formatNumber value="${item.COST_ORDER_PRICE}" pattern="#,###" /></span></td>
		        				<td><span id="install-price"><fmt:formatNumber value="${item.COST_UNIT_PRICE}" pattern="#,###" /></span></td>
		        				<td><span id="install-total"><fmt:formatNumber value="${item.COST_PRICE}" pattern="#,###" /></span></td>
		        				<td><span id="service-price"><fmt:formatNumber value="${item.COST_SERVICE_UNIT_PRICE}" pattern="#,###" /></span></td>
		        				<td><span id="service-total"><fmt:formatNumber value="${item.COST_SERVICE_PRICE}" pattern="#,###" /></span></td>
		        				<td><span id="total"><fmt:formatNumber value="${item.COST_TOTAL_PRICE}" pattern="#,###" /></span></td>
		        				<td><span id="install-service-note">${item.COST_MEMO}</span></td>
		        			</tr>
		        		</c:forEach>
		        	</tbody>
		        </c:when>
		        <c:otherwise>
		        	<tr>
		        		<td><span>1</span></td>
		        		<td><span></span></td>
		        		<td><span></span></td>
		        		<td><span></span></td>
		        		<td><span></span></td>
						<td><span></span></td>
						<td><span></span></td>
						<td><span></span></td>
						<td><span></span></td>
						<td><span></span></td>
		        	</tr>
		        </c:otherwise>
	        </c:choose>
	        <tr>
	            <td colspan="2">�հ�</td>
	            <td><span id="company-count-total"></span></td>
	            <td></td>
	            <td></td>
	            <td><span id="install-total-total"></span></td>
	            <td></td>
	            <td><span id="service-total-total"></span></td>
	            <td><span id="total-total"></span></td>
	            <td></td>
	        </tr>
	    </table>
	</section>
	<section class="con-section" id="register-5">
	    <p title="������Ȳ ���� �հ�� - ��ġ�� �� ���� ����հ��">3. ��������<span>(��-��)</span></p>
	    <div class="margin-box"><span id="total-margin"><fmt:formatNumber value="${sa1000List.COLLECT_FINAL_MARGIN}" pattern="#,###" /></span></div>
	</section>
	<section class="con-section" id="register-6">
	    <p>4. �������� ����</p>
	    <table id="table-2">
	        <tr>
	            <td class="td-short">����</td>
	            <td>ǰ��</td>
	            <td class="td-a">�з�</td>
	            <td class="td-a">��ǰ������</td>
	            <td class="td-a">�˼�������</td>
	            <td class="td-a">Warranty</td>
	            <td class="td-a">������������<br>������</td>
	            <td class="td-a">����ݾ�(��)</td>
	            <td class="td-a">����� ��ü</td>
	            <td class="td-a">����� �ݾ�</td>
	            <td class="td-a">����� ��ǥ<br><span>(�ι��� Ÿ�ٱݾ�)</span></td>
	        </tr>
	        <c:choose>
		        <c:when test="${fn:length(sa1006List) > 0 }">
		        	<tbody id="table-bottom">
		        		<c:forEach var="item" items="${sa1006List}" varStatus="status">
	        				<tr>
					        	<td><span>${status.index + 1}</span></td>
					        	<td><span>${item.SM_ITEM}</span></td>
					        	<td><span id="maintenance-group">${item.SM_CLASS}</span></td>
					        	<td><span id="delivery-date">${item.SM_DELIVERY_DT}</span></td>
					        	<td><span id="inspection-date">${item.SM_INSPECT_DT}</span></td>
					        	<td><span id="warranty">${item.SM_WARRANTY}</span></td>
					        	<td><span id="maintenance-date">${item.SM_MAINTENANCE_DT}</span></td>
					        	<td><span id="maintenance-price">${item.SM_MAINTENANCE_PRICE}</span></td>
					        	<td><span id="back-line">${item.SM_BACKLINE}</span></td>
					        	<td><span id="back-line-price">${item.SM_BACKLINE_PRICE}</span></td>
					        	<td><span id="back-line-goal">${item.SM_BACKLINE_GOAL}</span></td>
					        </tr>
		        		</c:forEach>
		        	</tbody>
		        </c:when>
		        <c:otherwise>
			        <tr>
			        	<td><span>1</span></td>
			        	<td><span></span></td>
			        	<td><span></span></td>
			        	<td><span></span></td>
			        	<td><span></span></td>
			        	<td><span></span></td>
			        	<td><span></span></td>
			        	<td><span></span></td>
			        	<td><span></span></td>
			        	<td><span></span></td>
			        	<td><span></span></td>
			        </tr>
		        </c:otherwise>
		    </c:choose>
	        <tr>
	            <td colspan="2">�հ�</td>
	            <td></td>
	            <td></td>
	            <td></td>
	            <td></td>
	            <td></td>
	            <td><span id="maintenance-price-total"></span></td>
	            <td></td>
	            <td><span id="back-line-price-total"></span></td>
	            <td><span id="back-line-goal-total"></span></td>
	        </tr>
	    </table>
	</section>
	<section class="con-section" id="register-7">
	    <p>5. �󼼳���</p>
	    <table>	    
		    <c:choose>
		        <c:when test="${fn:length(sa1007List) > 0 }">
		        	<tbody id="table-middle">
		        		<c:forEach var="item" items="${sa1007List}" varStatus="status">
		        			<tr>
					            <td colspan="3">�ŷ�����</td>
					            <td><span id="textarea-1">${item.DETAIL_TRANSACTIONAL}</span></td>
					        </tr>
					        <tr>
					            <td colspan="3">Ư�̻���</td>
					            <td><span id="textarea-2">${item.DETAIL_SIGNIFICANT}</span></td>
					        </tr>
		        		</c:forEach>
		        	</tbody>
		        </c:when>
		        <c:otherwise>
			        <tr>
			            <td colspan="3">�ŷ�����</td>
			            <td><span></span></td>
			        </tr>
			        <tr>
			            <td colspan="3">Ư�̻���</td>
			            <td><span></span></td>
			        </tr>
		        </c:otherwise>
		    </c:choose>
	    </table>
	    <p>6. ÷�� : ������, ��༭ ��</p>
	</section>
</div>

<script>
	$(document).ready(function() {
		var buyListLen = 0;
		var mmListLen = 0;
		buyListLen = ${fn:length(sa1002List)};
		mmListLen = ${fn:length(sa1003List)};

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