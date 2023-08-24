<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<body>
		<!-- .contents-wrap 컨텐츠영역 START -->
		<div class="contents-wrap an1000-page">
			<!-- .page-title-wrap 타이블영역 START -->
			<div class="page-title-wrap">
				<div class="page-title">
					<h2>휴가등록</h2>
	           </div>
	           <div class="page-btn-wrap">
		            <ul>
		                <li><a href="javascript:void(0);" id="btn01_IFRAME_CLOSE" class="btn-close">닫기</a></li>
		            </ul>
	           </div>
	       </div>
			<!-- .page-title-wrap 타이블영역 END -->
	           
	        <!-- .search-wrap 검색영역 START -->
			<div class="search-zone">
				<div class="search-wrap">
					<div class="sch-box">
						<dl>
							<dt>휴가일수</dt>
							<dd>
								<input type="text" id="txt01_HOLIDAY_TOTAL" name="txt01_HOLIDAY_TOTAL" value="${Holiday.HOLIDAY_TOTAL }" readonly>
							</dd>
						</dl>				
						<dl>
							<dt>사용일수</dt>
							<dd>
								<input type="text" id="txt01_HOLIDAY_USE" name="txt01_HOLIDAY_USE" value="${Holiday.HOLIDAY_USE }" readonly>
							</dd>
						</dl>				
						<dl>
							<dt>잔여일수</dt>
							<dd>
								<input type="text" id="txt01_HOLIDAY_REMAIN" name="txt01_HOLIDAY_REMAIN" value="${Holiday.HOLIDAY_REMAIN }" readonly>
							</dd>
						</dl>				
						<dl>
							<dt>공제일수</dt>
							<dd>
								<input type="text" id="txt01_HOLIDAY_DEDUCT" name="txt01_HOLIDAY_DEDUCT" value="${Holiday.HOLIDAY_DEDUCT }" readonly>
							</dd>
						</dl>
					</div>
				</div>
			</div>
			<!-- .search-wrap 검색영역 END -->
			
			<!-- .title-wrap TABLE영역 START -->
			<div class="row row-1 row-wrap-src">
				<div class="col col-1 wp100">
					<section>
						<div class="title-wrap">
	                        <div class="title-zone">
	                            <h2 class="title1">휴가사용 목록</h2>
								<span id="table1_cnt">0</span>
	                        </div>
	                        <div class="btn-right-box">
	                            <ul>
									<li><a href="javascript:void(0);" id="btn01_PRINT">출력</a></li>
	                            	<li><a href="javascript:void(0);" id="btn01_INSERT">추가</a></li>
									<li><a href="javascript:void(0);" id="btn01_UPDATE" class="dis-n">신청취소</a></li>
	                            </ul>
	                        </div>
	                    </div> 
						<div class="table-wrap">
							<table id="table1"></table>
						</div>
					</section>
				</div>
			</div>
			<!-- .title-wrap TABLE영역 END -->
		</div>
		<!-- .contents-wrap 컨텐츠영역 END -->
		
		<!-- .modal-cont 팝업영역 START -->
		<!-- 연차신청 추가 팝업 -->
		<div id="viewForm1" style="display: none;">
			<div class="modal-cont">
				<div class="row row-1">
					<div class="col col-1 wp100">
						<section>
							<table class="table-write">
			                    <caption>연차신청 내역</caption>
			                    <colgroup>
			                        <col class="wp20">
			                        <col class="wp30">
			                        <col class="wp20">
			                        <col class="wp30">
			                    </colgroup>
								<tbody>
									<tr id="trUserInfo" class="dis-n">
										<th class="req">사용자명</th>
										<td>
											<div class="input-srch">
												<input type="text" id="pop01_txt01_USER_ID" placeholder="사용자ID" class="readonly" readonly="readonly" style="display: none;">
												<input type="text" id="pop01_txt01_USER_NM" placeholder="사용자명" class="readonly" readonly="readonly">
												<a href="javascript:void(0);" id="pop01_btn01_USER" class="btn-srch"></a>
											</div>
										</td>
										<th>직급</th>
										<td>
											<input type="text" id="pop01_txt01_DEPT_CD" placeholder="부서코드" class="readonly wp100" readonly="readonly" style="display: none;">
											<input type="text" id="pop01_txt01_GRADE_CD" placeholder="직급코드" class="readonly wp100" readonly="readonly" style="display: none;">
											<input type="text" id="pop01_txt01_GRADE_NM" placeholder="직급" class="readonly wp100" readonly="readonly">
										</td>
									</tr>
									<tr>
										<th class="req">휴가종류</th>
										<td>
											<select id="pop01_sel01_TYPE" class="wp100"></select>
										</td>
										<th class="req">휴가일수</th>
										<td>
			                            	<input type="number" id="pop01_txt01_COUNT" Placeholder="휴가일수" class="wp100" disabled>
										</td>
									</tr>
									<tr>
										<th class="req">휴가기간</th>
										<td colspan="3">
											<div class="fl-sb">
												<label for="pop01_date01_START" class="hide">날짜 시작</label>
												<input type="date" id="pop01_date01_START" name="pop01_date01_START">
												<span>~</span>
												<label for="pop01_date01_END" class="hide">날짜끝</label>
												<input type="date" id="pop01_date01_END" name="pop01_date01_END">
											</div>
										</td>
									</tr>
									<tr>
										<th class="req">신청일자</th>
										<td>
											<input type="date" id="pop01_date01_REG" name="pop01_date01_START" disabled>
										</td>
										<th>비상연락망</th>
										<td>
			                            	<input type="text" id="pop01_txt01_EMERGENCY" Placeholder="비상연락망" class="wp100">
										</td>
									</tr>
									<tr>
										<th>담당업무</th>
										<td>
											<input type="text" id="pop01_txt01_TASK" Placeholder="담당업무" class="wp100">
										</td>
										<th>업무인수자</th>
										<td>
											<input type="text" id="pop01_txt01_ACQUIRER" Placeholder="업무인수자" class="wp100">
										</td>
									</tr>
									<tr>
										<th class="req">사유</th>
										<td colspan="3">
											<input type="text" id="pop01_txt01_REASON" Placeholder="사유" class="wp100">
										</td>
									</tr>
								</tbody>
							</table>
						</section>
					</div>
				</div>
			</div>
		</div>

		<!-- 연차신청 추가 팝업 -->
		<div id="viewForm2" style="display: none;">
			<div class="modal-cont">
				<div class="row row-1">
					<div class="col col-1 wp100">
						<section id="viewForm2Content"></section>
					</div>
				</div>
			</div>
		</div>

		<!-- 사용자 조회 팝업 -->
		<div id="viewForm3" style="display: none;">
			<div class="modal-cont">
				<div class="search-zone">
					<div class="search-wrap">
						<div class="sch-box">
							<dl class="dl-4n">
								<dt>사용자명</dt>
								<dd>
									<input type="text" id="pop01_USER_NM">
								</dd>
							</dl>
						</div>
						<div class="srch-btn wp40">
							<ul>
								<li><a href="javascript:searchGridDataUser();" class="btn-search">검색</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row row-1">
					<div class="col col-1 wp100">
						<section>
							<div class="table-wrap h240">
								<table id="table3"></table>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
		<!-- .modal-cont 팝업영역 END -->

	<input type="hidden" id="holidayOfficeValue" value="${HolidayOffice.get(0)}">
	<form>
		<input type="hidden" name="test" value="test">
	</form>
	</body>
	
	<script type="text/javascript">
		/**
		 * AN1000	연차등록
		 * -------------------------------------------------------------------
		 * 01. 공통코드
		 * 02. 버튼
		 * 03. confirm
		 * 04. 그리드
		 * 05. CRUD
		 * 06. 유효성
		 * 07. 팝업
		 * -------------------------------------------------------------------
		 */
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 공통코드
		/* 공통코드_다국어 */
		let langHead;
		let langPop1;
		let userId = '${User.USER_ID}';

		/* 공통코드_콤보박스 */ 
		commonCodeSelectAdd("pop01_sel01_TYPE", getCommonCode('HOLIDAY'), 'N');
		
		/* Document가 로드되었을 때 실행되는 코드 */
		$(document).ready(function() {
			function init() {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
			}
			
			jQuery(window).on('resize.jqGrid', function () {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
			});
			
			// 화면ID, 화면ID사이즈(6:CM1000/13:CM1000_Detail), 다국어
			langHead = getLangCode("AN1000", 6, "${LANG}");
			langPop1 = getLangCodeDetail("AN1000_Pop3", 11, "${LANG}");

			if(userId == "eunjin") {
				$('#trUserInfo').removeClass('dis-n');
				$('#btn01_UPDATE').removeClass('dis-n');
			} else {
				$('#trUserInfo').addClass('dis-n');
				$('#btn01_UPDATE').addClass('dis-n');
			}

			setGrid();
			init(); //그리드 리사이징

			const count = ${Count};
			if (count == 0) {
				autoOpenModalPopup();
			}
		});

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 버튼
		/* 출력 버튼 */
		$("#btn01_PRINT").on({
			click: function(){
				let rowData = $("#table1").getRowData($("#table1").getGridParam("selrow"));
				let valueArr = [rowData.GRADE_CD, rowData.GRADE_NM, rowData.HOLIDAY_CNT, rowData.HOLIDAY_START, rowData.HOLIDAY_END, rowData.HOLIDAY_REASON, rowData.HOLIDAY_TYPE, rowData.USER_NM];
				let nameArr = ["gradeCd", "gradeNm", "holidayCnt", "holidayStart", "holidayEnd", "holidayReason", "holidayType","userNm"];
				if (rowData.length > 1 || (rowData instanceof Array == true && rowData instanceof Object == true) ) {
					toast("정보", "출력할 휴가를 선택해주시기 바랍니다.", "info");
					return false;
				}
				let windowWidth = window.outerWidth;
				let windowHeight = window.outerHeight;
				let openWidth = 1025;
				let openHeight = 1000;
				let top = (windowHeight - openHeight) / 2;
				let left = (windowWidth - openWidth) / 2;
				const url = '/an1000/print';
				const target = 'an1000Print';
				const option = 'width=' + openWidth + 'px , height=' + openWidth + 'px , top=' + top + 'px , left=' + left + 'px , toolbar=no, menubar=no, lacation=no, scrollbars=no, status=no';

				const form = document.querySelector('form');
				form.action = url;
				form.method = 'post';
				form.target = target

				valueArr.forEach((item, i) => {
					let hiddenField = document.createElement("input");
					hiddenField.setAttribute("type", "hidden");
					hiddenField.setAttribute("name", nameArr[i]);
					hiddenField.setAttribute("value", item);
					form.appendChild(hiddenField);
				});

				window.open("", target, option);
				form.submit();
				form.innerHTML = "";
			}
		});

		/* 검색 버튼 */
		$("#btn01_SEARCH").on({
			click: function(){
				searchGridData();
			}
		});
		
		/* 추가 버튼 */
		$("#btn01_INSERT").on({
			click: function(){
				checkAction = "C";
				openModalPopup(checkAction);
			}
		});

		/* 수정 버튼 */
		$("#btn01_UPDATE").on({
			click: function(){
				let rowData = $("#table1").getRowData($("#table1").getGridParam("selrow"));

				let holidayEnd = new Date(new Date(rowData.HOLIDAY_END).getFullYear(), new Date(rowData.HOLIDAY_END).getMonth(), new Date(rowData.HOLIDAY_END).getDate());
				let today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());

				if(rowData != null && rowData.length == undefined){
					confirms("신청을 취소하시겠습니까?", "D");
				} else {
					toast("정보", "신청 취소할 목록을 선택해 주시기 바랍니다.", "info");
					return false;
				}
				// if(rowData != null && rowData.length == undefined && (today <= holidayEnd)){
				// 	confirms("신청을 취소하시겠습니까?", "D");
				// } else if (today > holidayEnd) {
				// 	toast("경고", "휴가 종료일이 지난 목록은 삭제할 수 없습니다.", "error");
				// } else {
				// 	toast("정보", "신청 취소할 목록을 선택해 주시기 바랍니다.", "info");
				// 	return false;
				// }
			}
		});

		$("#pop01_btn01_USER").on({
			click: function(e){
				e.preventDefault();
				openModalPopup_User();
			}
		});

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: confirm
		/* confirm 확인버튼 클릭시 */
		function confirmYes(action){
			if(action == "C"){
				var userID = "", deptCD = "", postCD = "";
				if(userId == "eunjin") {
					userID = $("#pop01_txt01_USER_ID").val();
					deptCD = $("#pop01_txt01_DEPT_CD").val();
					postCD = $("#pop01_txt01_GRADE_CD").val();
				} else {
					userID = '${User.USER_ID}';
					deptCD = '${User.DEPT_CD}';
					postCD = '${User.GRADE_CD}';
				}

				const param = {
					USER_ID : userID,
					DEPT_CD : deptCD,
					POST_CD : postCD,
					HOLIDAY_TYPE : $('#pop01_sel01_TYPE').val(),
					HOLIDAY_CNT : $('#pop01_txt01_COUNT').val(),
					HOLIDAY_START : $('#pop01_date01_START').val(),
					HOLIDAY_END : $('#pop01_date01_END').val(),
					EMERGENCY : $('#pop01_txt01_EMERGENCY').val(),
					TASK : $('#pop01_txt01_TASK').val(),
					ACQUIRER : $('#pop01_txt01_ACQUIRER').val(),
					HOLIDAY_REASON : $('#pop01_txt01_REASON').val()
				}

				getAjaxJsonData('/an1000', param, 'searchGridDataCallBack', 'POST')
				$("#viewForm1").dialog("close");
			}else if (action == "D") {
				const param = $("#table1").getRowData($("#table1").getGridParam("selrow"));
				getAjaxJsonData('/an1000', param, 'searchGridDataCallBack', 'PATCH')
			}
		}
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 그리드
		/* jqGrid 셋팅 */
		function setGrid(){
			$('#table1').jqGrid({
				mtype: 'POST'
				, datatype: 'loacl'
				, height : 240
				, jsonReader: {
					repeatitems: false
				}
				, colNames: langHead
				, colModel: [
					{name: 'USER_NM'			, align: 'center'	, width: '7%'	, hidden: false}
					, {name: 'GRADE_CD'			, align: 'center' 	, width: '0%'	, hidden: true}
					, {name: 'GRADE_NM'			, align: 'center' 	, width: '8%'	, hidden: false}
					, {name: 'HOLIDAY_START'	, align: 'center'	, width: '10%'	, hidden: false}
					, {name: 'HOLIDAY_END'		, align: 'center'	, width: '10%'	, hidden: false}
					, {name: 'HOLIDAY_CNT'		, align: 'center' 	, width: '5%'	, hidden: false}
					, {name: 'HOLIDAY_TYPE'		, align: 'center'	, width: '5%'	, hidden: false}
					, {name: 'HOLIDAY_REASON'	, align: 'left'		, width: '15%'	, hidden: false}
				]
				, autowidth: false
				, shrinkToFit: false
				, rowNum : 500
				, multiselect: false
			});
			
			searchGridData();

			$("#table3").jqGrid({
				mtype : 'POST'
				, datatype : 'local'
				, jsonReader: {
					repeatitems: false
				}
				, colNames: langPop1
				, colModel: [
					{name: 'USER_ID'		, align: 'center'	, width: '0%'	, hidden: true}
					, {name: 'USER_NM'		, align: 'center'	, width: '6%'	, hidden: false}
					, {name: 'PDEPT_CD'		, align: 'center'	, width: '0%'	, hidden: true}
					, {name: 'PDEPT_NM'		, align: 'center'	, width: '4%'	, hidden: false}
					, {name: 'DEPT_CD'		, align: 'center'	, width: '0%'	, hidden: true}
					, {name: 'DEPT_NM'		, align: 'center'	, width: '4%'	, hidden: false}
					, {name: 'GRADE_CD'		, align: 'center'	, width: '0%'	, hidden: true}
					, {name: 'GRADE_NM'		, align: 'center'	, width: '2%'	, hidden: false}
					, {name: 'ENTER_DT'		, align: 'center'	, width: '4%'	, hidden: false}
				]
				, autowidth: true
				, shrinkToFit: false
				, rowNum : 5000
				, ondblClickRow : function(rowid){
					var rowdata = $("#table3").getRowData(rowid);

					$("#pop01_txt01_USER_ID").val(rowdata.USER_ID);
					$("#pop01_txt01_USER_NM").val(rowdata.USER_NM);
					$("#pop01_txt01_GRADE_CD").val(rowdata.GRADE_CD);
					$("#pop01_txt01_GRADE_NM").val(rowdata.GRADE_NM);

					$("#viewForm3").dialog("close");
				}
			});
		};
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: CRUD
		/* Table 조회 */
		function searchGridData(){
			let searchParam = {};
			
			getAjaxJsonData("an1000Sel", searchParam, "searchGridDataCallBack");
		};
		
		function searchGridDataCallBack(data){
			$("#table1").clearGridData();
			$("#table1").jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");

			$("#table1_cnt").text(data.length)

			getAjaxJsonData("an1000/holidayInfo", "", "holidayInfoSel", "GET")
		};

		/**	휴가 보유 현황  */
		function holidayInfoSel(data) {
			$("#txt01_HOLIDAY_USE").val((data.HOLIDAY_USE).toFixed(1))
			$("#txt01_HOLIDAY_REMAIN").val((data.HOLIDAY_REMAIN).toFixed(1))
			$("#txt01_HOLIDAY_DEDUCT").val((data.HOLIDAY_DEDUCT).toFixed(1))
		}

		/* 추가/수정 후 Table 재조회 */
		function reLoadCallback(data){
			if(data.length == 1){
				toast("경고", "이미 존재하는 사용자입니다.", "error");
				return false;
			}else{
				popReset("viewForm1");
				toast("성공", "정상적으로 저장되었습니다.", "success");
				searchGridData();
			}
		}

		function searchGridDataUser(){
			var searchParam = {
				USER_NM : $("#pop01_USER_NM").val()
			};

			getAjaxJsonData("an1000SelUser", searchParam, "searchGridDataUserCallBack");
		};

		function searchGridDataUserCallBack(data){
			$("#table3").clearGridData();
			$("#table3").jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");
		};

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 유효성
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: Popup
		/* 사용자 추가/수정 팝업 */
		function openModalPopup(action){
			// 화면ID, 화면ID사이즈(ex. 6:CM1000 / 13:CM1000_Detail), 팝업ID, 다국어
			let returnPopup = getLangCodePopup("AN1000_Pop1", 11, "viewForm1", "${LANG}");
			let titlePop = returnPopup[0];
			let pop01_btn01_SAVE = returnPopup[1];
			let pop01_btn01_CLOSE = returnPopup[2];
			
			$("#viewForm1").dialog({
				autoOpen: true
				, title: titlePop
				, width: 900
				, modal: true
				, open: function () {
					if(action == "C"){
						popReset("viewForm1");
						document.getElementById('pop01_date01_REG').valueAsDate = new Date();
						$("#pop01_txt01_USER_ID").val('${User.USER_ID}');
						$("#pop01_txt01_USER_NM").val('${User.USER_NM}');
						$("#pop01_txt01_GRADE_CD").val('${User.GRADE_CD}');
						$("#pop01_txt01_GRADE_NM").val('${User.GRADE_NM}');
					}
					else if(action == "U"){
						
					}
				}
				, close: function () {
					$(this).dialog("close");
				}
				, buttons: [
					{
						text : pop01_btn01_SAVE,
	                    click : function(){
							if($('#pop01_date01_START').val() == ''){
								toast("경고", "휴가시작일을 입력해주세요.", "error");
								return false;
							} else if($('#pop01_date01_END').val() == ''){
								toast("경고", "휴가종료일을 입력해주세요.", "error");
								return false;
							} else if($('#pop01_txt01_REASON').val() == ''){
								toast("경고", "사유을 입력해주세요.", "error");
								return false;
							}
							var idsH = $("#table1").jqGrid('getDataIDs');
							
							for (var i = 0; i < idsH.length; i++) {
								var retH = $("#table1").jqGrid('getRowData', idsH[i]);
								
								if(retH.HOLIDAY_START == $("#pop01_date01_START").val()) {
									toast("오류", "이미 존재하는 휴가입니다.", "error");
									return;
								}
							}
							
							confirms("저장 하시겠습니까?", "C");
						}
					}
					, {
						text : pop01_btn01_CLOSE,
	                    click : function () {
							$(this).dialog("close");
						} 
					}
				]
				, focus: function (event, ui) {}
			}).css("z-index", 1000).prev(".ui-dialog-titlebar").css("background","#266f80").css("color","#fff");
		};

		function autoOpenModalPopup(action){
			// 화면ID, 화면ID사이즈(ex. 6:CM1000 / 13:CM1000_Detail), 팝업ID, 다국어
			let returnPopup = getLangCodePopup("AN1000_Pop2", 11, "viewForm2", "${LANG}");
			let titlePop = returnPopup[0];
			let pop02_btn01_SAVE = returnPopup[1];
			let pop02_btn01_CLOSE = returnPopup[2];

			$("#viewForm2").dialog({
				autoOpen: true
				, title: titlePop
				, width: 560
				, modal: true
				, open: function (event, ui) {
					let weeks = ['일', '월', '화', '수', '목', '금', '토'];
					const holidayOfficeDay = new Date($("#holidayOfficeValue").val());
					let year = holidayOfficeDay.getFullYear();
					let month = holidayOfficeDay.getMonth() + 1;
					let day = holidayOfficeDay.getDate();
					let week = weeks[holidayOfficeDay.getDay()];
					let message = '<strong style="color: red">' + year + '년 ' + month + '월 ' + day + '일(' + week + ') </strong> ' + '은 회사 공식 휴무일입니다.' +
							'<br> 출근 하시는 분들께서도 \'공식 휴무일/출근\' 으로 사유를 작성 후 필히 등록해주세요.';
					$("#viewForm2Content").html(message);
				}
				, close: function () {
					$(this).dialog("close");
				}
				, buttons: [
					{
						text : pop02_btn01_SAVE,
						click : function(){
							$(this).dialog("close");
							checkAction = "C";
							openModalPopup(checkAction);
							$("#pop01_sel01_TYPE").val("OFFICE01")
							$("#pop01_txt01_COUNT").val("1")
							$("#pop01_date01_START").val($("#holidayOfficeValue").val())
							$("#pop01_date01_END").val($("#holidayOfficeValue").val())
							$("#pop01_txt01_REASON").val("회사 공식 휴무일")
						}
					}
					, {
						text : pop02_btn01_CLOSE,
						click : function () {
							$(this).dialog("close");
						}
					}
				]
				, focus: function (event, ui) {}
			}).css("z-index", 1000).prev(".ui-dialog-titlebar").css("background","#266f80").css("color","#fff");
		};

		function openModalPopup_User(){
			// 화면ID, 화면ID사이즈(ex. 6:CM1000 / 13:CM1000_Detail), 팝업ID, 다국어
			var returnPopup = getLangCodePopup("AN1000_Pop3", 11, "viewForm3", "${LANG}");
			var titlePop = returnPopup[0];
			var pop03_btn01_FINISH = returnPopup[1];
			var pop03_btn01_CLOSE = returnPopup[2];

			$("#viewForm3").dialog({
				autoOpen: true
				, title: titlePop
				, width: 750
				, modal: true
				, open: function (event, ui) {
					searchGridDataUser();
				}
				, close: function () {
					$(this).dialog("close");
				}
				, buttons: [
					{
						text : pop03_btn01_FINISH,
						click : function(){
							var rowid = $("#table3").getGridParam("selrow");
							if(rowid < 1){
								toast("정보", "선택된 사용자가 없습니다.", "info");
								return false;
							} else {
								var rowdata = $("#table3").getRowData(rowid);

								$("#pop01_txt01_USER_ID").val(rowdata.USER_ID);
								$("#pop01_txt01_USER_NM").val(rowdata.USER_NM);
								$("#pop01_txt01_GRADE_CD").val(rowdata.GRADE_CD);
								$("#pop01_txt01_GRADE_NM").val(rowdata.GRADE_NM);
							}

							$(this).dialog("close");
						}
					}
					, {
						text : pop03_btn01_CLOSE,
						click : function () {
							$(this).dialog("close");
						}
					}
				]
				, focus: function (event, ui) {}
			}).css("z-index", 1000).prev(".ui-dialog-titlebar").css("background","#266f80").css("color","#fff");
		};

		$('#pop01_sel01_TYPE').change(() => {
			holidayDateCheck();
		});
		$('#pop01_date01_START').change(() => {
			checkStartDateAndEndDate();
			holidayOverlapCheck();
			holidayDateCheck();
		});
		$('#pop01_date01_END').change(() => {
			holidayOverlapCheck();
			holidayDateCheck();
		});

		/**
		 * 휴가기간 중복 체크
		 */
		function holidayOverlapCheck() {
			let ids = $("#table1").jqGrid('getRowData');

			const checkStart = new Date($('#pop01_date01_START').val());
			const checkEnd = new Date($('#pop01_date01_END').val());

			if (checkStart != '' && checkEnd != '') {
				ids.forEach(item => {
					let itemStart = new Date(item.HOLIDAY_START);
					let itemEnd = new Date(item.HOLIDAY_END);
					let check = [
						itemStart <= checkStart && checkEnd <= itemEnd,
						itemStart <= checkStart && (checkStart <= itemEnd && itemEnd <= checkEnd),
						checkStart <= itemStart && (itemStart <= checkEnd && checkEnd <= itemEnd),
						(checkStart <= itemStart && checkStart <=checkEnd) && itemEnd <= checkEnd
					]
					if (check.indexOf(true) >= 0) {
						console.log(check.indexOf(true));
						toast("경고", "휴가기간 중복으로 확인해 주세요.(" + $('#pop01_date01_START').val() + "~" + $('#pop01_date01_END').val()+")", "error");
						$('#pop01_date01_START').val("")
						$('#pop01_date01_END').val("");
						return;
					}
				});
			}
		}

		/**
		 * 반차 체크 및 휴가기간 체크(휴가시작일 >= 휴가종료일)
		 */
		function holidayDateCheck() {
			const HALF_CHECK = ($('#pop01_sel01_TYPE').val() == 'HALF01' || $('#pop01_sel01_TYPE').val() == 'HALF02'
					|| $('#pop01_sel01_TYPE').val() == 'CIVIL01' || $('#pop01_sel01_TYPE').val() == 'CIVIL02');
			const OFFICE_CHECK = ($('#pop01_sel01_TYPE').val() == 'OFFICE01');
			const OFFICE_CHECK2 = ($('#pop01_sel01_TYPE').val() == 'OFFICE02');
			let startDate = $('#pop01_date01_START').val();
			let endDate = $('#pop01_date01_END').val();

			if (HALF_CHECK) {
				// 반차 및 민방위인 경우
				$('#pop01_date01_END').val($('#pop01_date01_START').val());
				$('#pop01_txt01_COUNT').val('0.5');
			} else if (OFFICE_CHECK) {
				// 공식 휴무일(연차)
				$("#pop01_date01_START").val($("#holidayOfficeValue").val())
				$("#pop01_date01_END").val($("#holidayOfficeValue").val())
				$('#pop01_txt01_COUNT').val('1');
			} else if (OFFICE_CHECK2) {
				// 공식 휴무일(연차 및 출근)
				$("#pop01_date01_START").val($("#holidayOfficeValue").val())
				$("#pop01_date01_END").val($("#holidayOfficeValue").val())
				$('#pop01_txt01_COUNT').val('0');
			} else if (startDate != '' && endDate != '') {
				// 반차, 민방위, 공식 휴무일이 아닌 경우
				if (new Date(startDate) > new Date(endDate)) {
					toast("경고", "휴가기간을 확인해 주세요.", "error");
					$('#pop01_date01_END').val(startDate);
				}
				let url = '/an1000/publicHoliday?startDate=' + startDate + '&endDate=' + endDate;
				getAjaxJsonData(url, '', 'holidayDateCount', 'GET');
			}
		}

		/**
		 * 휴가일수 계산(주말, 공휴일 제외)
		 */
		function holidayDateCount(data){
			let dataArray = new Array();
			data.forEach(date => dataArray.push(new Date(date)));

			const holiday_start = $('#pop01_date01_START');
			const holiday_end = $('#pop01_date01_END');
			const holiday_count = $('#pop01_txt01_COUNT');

			let start = new Date(holiday_start.val());
			let end = new Date(holiday_end.val());

			if (start.getDay() == 0 || start.getDay() == 6) { // 주말 체크
				holiday_start.val("");
				holiday_end.val("");
				holiday_count.val("")
			} else if (end.getDay() == 0 || end.getDay() == 6) { // 주말 체크
				holiday_end.val("");
				holiday_count.val("");
			} else {
				let difference = Math.abs(end - start);
				let dayTime = 1000 * 3600 * 24;
				let count = difference / dayTime + 1; // +1은 당일 포함
				let weekend = parseInt(count / 7);
				if (end.getDay() < start.getDay() && weekend == 0) {
					count = difference / dayTime + 1 - 2; // -2는 주말 빼기
				} else {
					count = difference / dayTime + 1 - (weekend * 2);
				}
				dataArray.forEach(date => {
					if (end >= date && start <= date) {
						if (date.getDay() == 0 || date.getDay() == 6) {
							return;
						} else {
							count = count - 1;
						}
					}
				});
				holiday_count.val(count);
			}
		};

		/**
		 * 휴가 시작일, 휴가 종료일 체크
		 */
		function checkStartDateAndEndDate() {
			if ($('#pop01_date01_END').val() == "") {
				$('#pop01_date01_END').val($('#pop01_date01_START').val());
			} else if ($('#pop01_date01_END').val() != "" && new Date($('#pop01_date01_END').val()) < new Date($('#pop01_date01_START').val())) {
				$('#pop01_date01_END').val($('#pop01_date01_START').val());
			}
		}
	</script>
</html>