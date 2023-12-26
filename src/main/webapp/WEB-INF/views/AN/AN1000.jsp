<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
	.search-zone-info {
		height: 112px;
	}
	.search-wrap-info2 {
		top: 56px;
		position: relative;
	}
	#holiday-info-text1, #holiday-info-text2 {
		font-size: 1.3rem;
		letter-spacing: 2px;
	}
	#holiday-info-text1 {
		margin: 10px 0px 0px 30px;
		padding-top: 10px;

	}
	#holiday-info-text2 {
		color: red;
		margin-top: 0;
		margin-left: 50px;
	}

	input[type="date"] {
		position: relative;
		width: 100%;
		border-radius: 0;
	}
	input[type="date"]::-webkit-calendar-picker-indicator {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: transparent;
		color: transparent;
		cursor: pointer;
		z-index: 1;
	}
</style>
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
			<div id="searchZone" class="search-zone dis-n">
				<div class="search-wrap">
					<div class="sch-box">
						<dl>
							<dt>성명</dt>
							<dd>
								<input type="text" id="txt01_USER_NM" value="${User.USER_NM}">
							</dd>
						</dl>
						<dl class="dl-2n">
							<dt>조회기간</dt>
							<dd>
								<div class="period">
									<label for="date01_START" class="hide">날짜 시작</label>
									<input type="date" id="date01_START" name="date01_START" max="9999-12-31">
									<span>~</span>
									<label for="date01_END" class="hide">날짜 종료</label>
									<input type="date" id="date01_END" name="date01_END" max="9999-12-31">
								</div>
							</dd>
						</dl>
						<dl>
							<dt>연차종류</dt>
							<dd>
								<select id="sel01_HOLIDAY_TYPE"></select>
							</dd>
						</dl>
					</div>
					<div class="srch-btn">
						<ul>
							<li><a href="javascript:void(0);" id="btn01_SEARCH" class="btn-search">검색</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="search-zone-info">
				<div class="search-wrap-info">
					<div class="sch-box-info">
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
				<div class="search-wrap-info2">
					<div class="sch-box-info">
						<p id="holiday-info-text1"></p>
						<p id="holiday-info-text2"></p>
					</div>
				</div>
			</div>
			<!-- .search-wrap 검색영역 END -->
			
			<!-- .title-wrap TABLE영역 START -->
			<div id="rowWrap" class="row row-1 row-wrap-src">
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
	                            	<li><a href="javascript:void(0);" id="btn01_INSERT">작성</a></li>
	                            	<li><a href="javascript:void(0);" id="btn01_UPDATE">수정</a></li>
									<li><a href="javascript:void(0);" id="btn01_DELETE" class="dis-n">신청취소</a></li>
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
												<input type="hidden" id="pop01_txt01_USER_ID" placeholder="사용자ID" class="readonly">
												<input type="text" id="pop01_txt01_USER_NM" placeholder="사용자명" class="readonly" readonly="readonly">
												<a href="javascript:void(0);" id="pop01_btn01_USER" class="btn-srch"></a>
											</div>
										</td>
										<th>직급</th>
										<td>
											<input type="hidden" id="pop01_txt01_DEPT_CD" placeholder="부서코드" class="readonly wp100">
											<input type="hidden" id="pop01_txt01_GRADE_CD" placeholder="직급코드" class="readonly wp100">
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
									<tr>
										<th class="req" colspan="4">
											* 휴가신청서는 서면 결재 받으셔야 합니다.<br>
											* 작성하신 신청서는 삭제가 불가합니다(관리팀 문의)
										</th>
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

	<form>
		<input type="hidden" name="test" value="test">
	</form>
	</body>
	
	<script type="text/javascript">
		/**
		 * AN1000	휴가등록
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
		const userDept = '${User.DEPT_CD}'
		const userEnterDate = '${Holiday.ENTER_DT}'
		const userName = '${User.USER_NM}'
		const holidayOfficeInfo = ${HolidayOfficeInfo};

		/* 공통코드_콤보박스 */
		commonCodeSelectAdd("pop01_sel01_TYPE", getCommonCode('HOLIDAY'), 'N');
		commonCodeSelectAdd("sel01_HOLIDAY_TYPE", getCommonCode('HOLIDAY'), 'Y');

		/* Document가 로드되었을 때 실행되는 코드 */
		$(document).ready(function() {
			function init() {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
			}

			jQuery(window).on('resize.jqGrid', function () {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
			});

			// 화면ID, 화면ID사이즈(6:CM1000/13:CM1000_Detail), 다국어
			langHead = ["사용자ID", "성명", "직급", "직위", "시작일자", "종료일자", "휴가일자", "휴가종류", "사유", "담당업무", "인수인계자", "비상연락망", "등록일"];
			<%--langHead = getLangCode("AN1000", 6, "${LANG}");--%>
			langPop1 = getLangCodeDetail("AN1000_Pop3", 11, "${LANG}");

			let today = new Date();
			let monthAgo = new Date(today);
			let monthLater = new Date(today);
			monthAgo.setMonth(today.getMonth() - 1);
			monthLater.setMonth(today.getMonth() + 1);

			$("#date01_START").val(monthAgo.toISOString().split('T')[0]);
			$("#date01_END").val(monthLater.toISOString().split('T')[0]);

			if(userDept.indexOf("M") > -1) {
				$('#trUserInfo').removeClass('dis-n');
				$('#btn01_UPDATE').removeClass('dis-n');
				$('#btn01_DELETE').removeClass('dis-n');
				$('#searchZone').removeClass('dis-n');
				$('#rowWrap').removeClass('row-wrap-src');
				$('#rowWrap').addClass('row-wrap-262');
			} else {
				$('#trUserInfo').addClass('dis-n');
				$('#btn01_UPDATE').addClass('dis-n');
				$('#btn01_DELETE').addClass('dis-n');
				$('#rowWrap').removeClass('row-wrap-262');
				$('#rowWrap').addClass('row-wrap-src');
			}

			setGrid();
			init(); //그리드 리사이징

			holidayOfficeInfo.some(item => {
				if (item.COUNT == 0) {
					autoOpenModalPopup(item.OFFICE_HOLIDAY);
					return true;
				}
			});

			holidayPeriodGuideWord(userEnterDate);
		});

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 버튼

		/* 출력 버튼 */
		$("#btn01_PRINT").on({
			click: function(){
				let rowData = $("#table1").getRowData($("#table1").getGridParam("selrow"));

				if (rowData.length > 1 || (rowData instanceof Array == true && rowData instanceof Object == true) ) {
					toast("정보", "출력할 휴가를 선택해주시기 바랍니다.", "info");
					return false;
				}
				let valueArr = [
					rowData.GRADE_CD, rowData.GRADE_NM,
					rowData.HOLIDAY_CNT, rowData.HOLIDAY_START,
					rowData.HOLIDAY_END, rowData.HOLIDAY_REASON,
					rowData.HOLIDAY_TYPE, rowData.USER_NM,
					rowData.USER_ID
				];

				holidayPrint(valueArr);
			}
		});

		/* 검색 버튼 */
		$("#btn01_SEARCH").on({
			click: function(){
				holidayInfoSel(null);
				searchGridDataUsers();
				// if($("#txt01_USER_NM").val().length > 0) {
				// } else {
				// 	toast("정보", "성명을 입력해 주시기 바랍니다.", "info");
				// 	return false;
				// }
			}
		});

		/* 작성 버튼 */
		$("#btn01_INSERT").on({
			click: function(){
				checkAction = "C";
				openModalPopup(checkAction);
			}
		});

		/* 수정 버튼 */
		$("#btn01_UPDATE").on({
			click: function(){
				checkAction = "U";
				openModalPopup(checkAction);
			}
		});

		/* 휴가취소 버튼 */
		$("#btn01_DELETE").on({
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

		$("#txt01_USER_NM").keypress((e) => {
			if(e.key === "Enter") searchGridDataUsers();
		});

		$("#sel01_HOLIDAY_TYPE").change(() => searchGridDataUsers());

		$("#date01_START").change(() => searchPeriodCheck());

		$("#date01_END").change(() =>  searchPeriodCheck());

		$("#pop01_USER_NM").keypress((e) => {
			if(e.key === "Enter") searchGridDataUser();
		});

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: confirm
		/* confirm 확인버튼 클릭시 */
		function confirmYes(action){
			if(action == "C"){
				let check = userDept.indexOf("M") > -1;

				const param = {
					USER_ID: check ? $("#pop01_txt01_USER_ID").val() : '${User.USER_ID}',
					DEPT_CD: check ? $("#pop01_txt01_DEPT_CD").val() : '${User.DEPT_CD}',
					POST_CD: check ? $("#pop01_txt01_GRADE_CD").val() : '${User.GRADE_CD}',
					HOLIDAY_TYPE: $('#pop01_sel01_TYPE').val(),
					HOLIDAY_CNT: $('#pop01_txt01_COUNT').val(),
					HOLIDAY_START: $('#pop01_date01_START').val(),
					HOLIDAY_END: $('#pop01_date01_END').val(),
					EMERGENCY: $('#pop01_txt01_EMERGENCY').val(),
					TASK: $('#pop01_txt01_TASK').val(),
					ACQUIRER: $('#pop01_txt01_ACQUIRER').val(),
					HOLIDAY_REASON: $('#pop01_txt01_REASON').val()
				}

				getAjaxJsonData('/an1000', param, 'holidayGetAfterSave', 'POST');

				setTimeout(() => {
					if($("#txt01_USER_NM").val().length > 0) {
						searchGridDataUsers();
					} else {
						searchGridData();
					}
				}, 300);

				holidayInfoSel(null);

				$("#viewForm1").dialog("close");
			} else if (action == "D") {
				const param = $("#table1").getRowData($("#table1").getGridParam("selrow"));

				new Promise(function(resolve, reject) {
					getAjaxJsonData('/an1000', param, '', 'PATCH');
					return resolve();
				}).then(function() {
					setTimeout(function() {
						if($("#txt01_USER_NM").val().length > 0) {
							searchGridDataUsers();
						} else {
							searchGridData();
						}
					}, 300);
				});

				holidayInfoSel(null);
			} else if(action == "U") {
				let rowData = $("#table1").getRowData($("#table1").getGridParam("selrow"));
				let param = {
					HOLIDAY_TYPE : $("#pop01_sel01_TYPE").val(),
					HOLIDAY_CNT : $("#pop01_txt01_COUNT").val(),
					HOLIDAY_START : $("#pop01_date01_START").val(),
					HOLIDAY_END : $("#pop01_date01_END").val(),
					HOLIDAY_REASON : $("#pop01_txt01_REASON").val(),
					TASK: $("#pop01_txt01_TASK").val(),
					ACQUIRER: $("#pop01_txt01_ACQUIRER").val(),
					EMERGENCY: $("#pop01_txt01_EMERGENCY").val(),
					USER_ID: rowData.USER_ID,
					START : rowData.HOLIDAY_START,
					END : rowData.HOLIDAY_END
				};
				getAjaxJsonData('an1000/updateHolidayInfo', param, 'searchGridDataCallBack');
				$("#viewForm1").dialog("close");
			}
		}

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 그리드
		/* jqGrid 셋팅 */
		function setGrid(){
			$('#table1').jqGrid({
				mtype: 'POST',
				datatype: 'loacl',
				height : 240,
				jsonReader: {
					repeatitems: false
				},
				colNames: langHead,
				colModel: [
					{name: 'USER_ID'		, align: 'center'	, width: '0%'	, hidden: true},
					{name: 'USER_NM'		, align: 'center'	, width: '6%'	, hidden: false},
					{name: 'GRADE_CD'		, align: 'center' 	, width: '0%'	, hidden: true},
					{name: 'GRADE_NM'		, align: 'center' 	, width: '6%'	, hidden: false},
					{name: 'HOLIDAY_START'	, align: 'center'	, width: '9%'	, hidden: false},
					{name: 'HOLIDAY_END'	, align: 'center'	, width: '9%'	, hidden: false},
					{name: 'HOLIDAY_CNT'	, align: 'center' 	, width: '5%'	, hidden: false},
					{name: 'HOLIDAY_TYPE'	, align: 'center'	, width: '8%'	, hidden: false},
					{name: 'HOLIDAY_REASON'	, align: 'left'		, width: '15%'	, hidden: false},
					{name: 'TASK'			, align: 'left'		, width: '10%'	, hidden: false},
					{name: 'ACQUIRER'		, align: 'left'		, width: '10%'	, hidden: false},
					{name: 'EMERGENCY'		, align: 'left'		, width: '10%'	, hidden: false},
					{name: 'REG_DT'			, align: 'center'	, width: '9%'	, hidden: false}
				],
				autowidth: false,
				shrinkToFit: false,
				rowNum : 500,
				multiselect: false,
				onSelectRow: function (index, status) {
					if (index) {
						let row = $("#table1").jqGrid('getRowData', index);
						console.log(row);
						let url = "an1000/holidayInfo?targetId=" + row.USER_ID.toString() + "&holidayStart=" + row.HOLIDAY_START + "&holidayEnd=" + row.HOLIDAY_END;
						getAjaxJsonData(url, '', "holidayInfoSel", "GET")
					}
				},
			});

			searchGridData();

			$("#table3").jqGrid({
				mtype : 'POST',
				datatype : 'local',
				jsonReader: {
					repeatitems: false
				},
				colNames: langPop1,
				colModel: [
					{name: 'USER_ID'	, align: 'center'	, width: '0%'	, hidden: true},
					{name: 'USER_NM'	, align: 'center'	, width: '6%'	, hidden: false},
					{name: 'PDEPT_CD'	, align: 'center'	, width: '0%'	, hidden: true},
					{name: 'PDEPT_NM'	, align: 'center'	, width: '4%'	, hidden: false},
					{name: 'DEPT_CD'	, align: 'center'	, width: '0%'	, hidden: true},
					{name: 'DEPT_NM'	, align: 'center'	, width: '4%'	, hidden: false},
					{name: 'GRADE_CD'	, align: 'center'	, width: '0%'	, hidden: true},
					{name: 'GRADE_NM'	, align: 'center'	, width: '2%'	, hidden: false},
					{name: 'ENTER_DT'	, align: 'center'	, width: '4%'	, hidden: false}
				],
				autowidth: true,
				shrinkToFit: false,
				rowNum : 5000,
				ondblClickRow : function(rowid){
					let rowdata = $("#table3").getRowData(rowid);

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

			getAjaxJsonData("an1000/list", searchParam, "searchGridDataCallBack");
		};

		function searchGridDataCallBack(data){
			$("#table1").clearGridData();
			$("#table1").jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");

			if(data != null) {
				$("#table1_cnt").text(comma(data.length));
			} else {
				$('#table1_cnt').text(0);
			}

			getAjaxJsonData("an1000/holidayInfo", "", "holidayInfoSel", "GET")
		};

		function searchGridDataUsers(){
			let searchParam = {
				USER_NM : $("#txt01_USER_NM").val(),
				START : $("#date01_START").val(),
				END : $("#date01_END").val(),
				TYPE : $("#sel01_HOLIDAY_TYPE").val()
			};

			getAjaxJsonData("an1000/list", searchParam, "searchGridDataUsersCallBack");
		};

		function searchGridDataUsersCallBack(data){
			$("#table1").clearGridData();
			$("#table1").jqGrid('setGridParam', {
				datatype: 'local',
				data: data
			}).trigger("reloadGrid");

			let count;
			if (data.length == 0) count = data.length;
			else count = comma(data.length);

			$("#table1_cnt").text(count);
			toast("성공", count + "건수가 조회되었습니다.", "success");
		};

		/**	휴가 보유 현황  */
		function holidayInfoSel(data) {
			if (data === null) {
				$("#txt01_HOLIDAY_TOTAL").val((0.0));
				$("#txt01_HOLIDAY_USE").val((0.0));
				$("#txt01_HOLIDAY_REMAIN").val((0.0));
				$("#txt01_HOLIDAY_DEDUCT").val((0.0));
			} else {
				$("#txt01_HOLIDAY_TOTAL").val((data.HOLIDAY_TOTAL).toFixed(1));
				$("#txt01_HOLIDAY_USE").val((data.HOLIDAY_USE).toFixed(1));
				$("#txt01_HOLIDAY_REMAIN").val((data.HOLIDAY_REMAIN).toFixed(1));
				$("#txt01_HOLIDAY_DEDUCT").val((data.HOLIDAY_DEDUCT).toFixed(1));
			}
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
			let searchParam = {
				USER_NM : $("#pop01_USER_NM").val()
			};

			getAjaxJsonData("/an1000/SelUser", searchParam, "searchGridDataUserCallBack");
			// 	toast("정보", "성명을 입력해 주시기 바랍니다.", "info");
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
		/* 휴가 추가/수정 팝업 */
		function openModalPopup(action){
			// 화면ID, 화면ID사이즈(ex. 6:CM1000 / 13:CM1000_Detail), 팝업ID, 다국어
			let returnPopup = getLangCodePopup("AN1000_Pop1", 11, "viewForm1", "${LANG}");
			let titlePop = returnPopup[0];
			let pop01_btn01_SAVE = returnPopup[1];
			let pop01_btn01_CLOSE = returnPopup[2];

			$("#viewForm1").dialog({
				autoOpen: true,
				title: titlePop,
				width: 900,
				modal: true,
				open: function () {
					if(action == "C"){
						popReset("viewForm1");
						document.getElementById('pop01_date01_REG').valueAsDate = new Date();
						$("#pop01_txt01_USER_ID").val('${User.USER_ID}');
						$("#pop01_txt01_USER_NM").val('${User.USER_NM}');
						$("#pop01_txt01_GRADE_CD").val('${User.GRADE_CD}');
						$("#pop01_txt01_GRADE_NM").val('${User.GRADE_NM}');
					}
					else if(action == "U"){
						let rowData = $("#table1").getRowData($("#table1").getGridParam("selrow"));
						$("#pop01_txt01_USER_ID").val(rowData.USER_ID);
						$("#pop01_txt01_USER_NM").val(rowData.USER_NM);
						$("#pop01_txt01_GRADE_CD").val(rowData.GRADE_CD);
						$("#pop01_txt01_GRADE_NM").val(rowData.GRADE_NM);
						$("select[id='pop01_sel01_TYPE'] option:contains(" + rowData.HOLIDAY_TYPE + ")").attr("selected", "selected");
						$("#pop01_txt01_COUNT").val(rowData.HOLIDAY_CNT);
						$("#pop01_date01_START").val(rowData.HOLIDAY_START);
						$("#pop01_date01_END").val(rowData.HOLIDAY_END);
						$("#pop01_date01_REG").val(rowData.REG_DT);
						$("#pop01_txt01_EMERGENCY").val(rowData.EMERGENCY);
						$("#pop01_txt01_TASK").val(rowData.TASK);
						$("#pop01_txt01_ACQUIRER").val(rowData.ACQUIRER);
						$("#pop01_txt01_REASON").val(rowData.HOLIDAY_REASON);
					}
				},
				close: function () {
					$(this).dialog("close");
				},
				buttons: [
					{
						text : pop01_btn01_SAVE,
	                    click : function(){
							if($('#pop01_date01_START').val() == ''){
								toast("정보", "휴가시작일을 입력해주세요.", "info");
								return false;
							} else if($('#pop01_date01_END').val() == ''){
								toast("정보", "휴가종료일을 입력해주세요.", "info");
								return false;
							} else if($('#pop01_txt01_REASON').val() == ''){
								toast("정보", "사유을 입력해주세요.", "info");
								return false;
							}

							if(action == "C") {
								let idsH = $("#table1").jqGrid('getDataIDs');
								const checkId = $('#pop01_txt01_USER_ID').val();

								for (let i = 0; i < idsH.length; i++) {
									let retH = $("#table1").jqGrid('getRowData', idsH[i]);
									let idCheck = (checkId == retH.USER_ID);

									if (retH.HOLIDAY_START == $("#pop01_date01_START").val() && idCheck) {
										toast("오류", "이미 존재하는 휴가입니다.", "error");
										return;
									}
								}

								confirms("저장 하시겠습니까?", "C");
							} else if(action == "U"){
								confirms("저장 하시겠습니까?", "U");
							}
						}
					},
					{
						text : pop01_btn01_CLOSE,
	                    click : function () {
							$(this).dialog("close");
						}
					}
				],
				focus: function (event, ui) {}
			}).css("z-index", 1000).prev(".ui-dialog-titlebar").css("background","#266f80").css("color","#fff");
		};

		function autoOpenModalPopup(date){
			// 화면ID, 화면ID사이즈(ex. 6:CM1000 / 13:CM1000_Detail), 팝업ID, 다국어
			let returnPopup = getLangCodePopup("AN1000_Pop2", 11, "viewForm2", "${LANG}");
			let titlePop = returnPopup[0];
			let pop02_btn01_SAVE = returnPopup[1];
			let pop02_btn01_CLOSE = returnPopup[2];

			$("#viewForm2").dialog({
				autoOpen: true,
				title: titlePop,
				width: 560,
				modal: true,
				open: function (event, ui) {
					const holidayOfficeDay = new Date(date);
					let weeks = ['일', '월', '화', '수', '목', '금', '토'];
					let year = holidayOfficeDay.getFullYear();
					let month = holidayOfficeDay.getMonth() + 1;
					let day = holidayOfficeDay.getDate();
					let week = weeks[holidayOfficeDay.getDay()];
					let message = '<strong style="color: red">' + year + '년 ' + month + '월 ' + day + '일(' + week + ') </strong> ' + '은 회사 공식 휴무일입니다.' +
							'<br> 출근 하시는 분들께서도 \'공식 휴무일/출근\' 으로 사유를 작성 후 필히 등록해주세요.';
					$("#viewForm2Content").html(message);
				},
				close: function () {
					$(this).dialog("close");
				},
				buttons: [
					{
						text : pop02_btn01_SAVE,
						click : function(){
							$(this).dialog("close");
							checkAction = "C";
							openModalPopup(checkAction);
							$("#pop01_sel01_TYPE").val("OFFICE01");
							$("#pop01_txt01_COUNT").val("1");
							$("#pop01_date01_START").val(date);
							$("#pop01_date01_END").val(date);
							$("#pop01_txt01_REASON").val("회사 공식 휴무일");
						}
					},
					{
						text : pop02_btn01_CLOSE,
						click : function () {
							$(this).dialog("close");
						}
					}
				],
				focus: function (event, ui) {}
			}).css("z-index", 1000).prev(".ui-dialog-titlebar").css("background","#266f80").css("color","#fff");
		};

		function openModalPopup_User(){
			// 화면ID, 화면ID사이즈(ex. 6:CM1000 / 13:CM1000_Detail), 팝업ID, 다국어
			let returnPopup = getLangCodePopup("AN1000_Pop3", 11, "viewForm3", "${LANG}");
			let titlePop = returnPopup[0];
			let pop03_btn01_FINISH = returnPopup[1];
			let pop03_btn01_CLOSE = returnPopup[2];

			$("#viewForm3").dialog({
				autoOpen: true,
				title: titlePop,
				width: 750,
				modal: true,
				open: function (event, ui) {
					searchGridDataUser();
				},
				close: function () {
					$(this).dialog("close");
				},
				buttons: [
					{
						text : pop03_btn01_FINISH,
						click : function(){
							let rowid = $("#table3").getGridParam("selrow");
							if(rowid < 1){
								toast("정보", "선택된 사용자가 없습니다.", "info");
								return false;
							} else {
								let rowdata = $("#table3").getRowData(rowid);

								$("#pop01_txt01_USER_ID").val(rowdata.USER_ID);
								$("#pop01_txt01_USER_NM").val(rowdata.USER_NM);
								$("#pop01_txt01_GRADE_CD").val(rowdata.GRADE_CD);
								$("#pop01_txt01_GRADE_NM").val(rowdata.GRADE_NM);
							}

							$(this).dialog("close");
						}
					},
					{
						text : pop03_btn01_CLOSE,
						click : function () {
							$(this).dialog("close");
						}
					}
				],
				focus: function (event, ui) {}
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
			const checkId = $('#pop01_txt01_USER_ID').val();

			if (checkStart != '' && checkEnd != '') {
				ids.forEach(item => {
					console.log(item)
					let itemStart = new Date(item.HOLIDAY_START);
					let itemEnd = new Date(item.HOLIDAY_END);
					let idCheck = (checkId == item.USER_ID);
					let check = [
						idCheck && itemStart <= checkStart && checkEnd <= itemEnd,
						idCheck && itemStart <= checkStart && (checkStart <= itemEnd && itemEnd <= checkEnd),
						idCheck && checkStart <= itemStart && (itemStart <= checkEnd && checkEnd <= itemEnd),
						idCheck && (checkStart <= itemStart && checkStart <= checkEnd) && itemEnd <= checkEnd,
					];
					if (check.indexOf(true) >= 0) {
						console.log(check.indexOf(true));
						toast("정보", "휴가기간 중복으로 확인해 주세요.(" + $('#pop01_date01_START').val() + "~" + $('#pop01_date01_END').val()+")", "info");
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
			let searchParam = {};
			getAjaxJsonData("an1000/holidayInfo", searchParam, "searchHolidatInfoCallBack");
		}

		function searchHolidatInfoCallBack(res) {
			const HALF_CHECK = ($('#pop01_sel01_TYPE').val() == 'HALF01' || $('#pop01_sel01_TYPE').val() == 'HALF02' || $('#pop01_sel01_TYPE').val() == 'CIVIL01' || $('#pop01_sel01_TYPE').val() == 'CIVIL02');
			const OFFICE_CHECK = ($('#pop01_sel01_TYPE').val() == 'OFFICE01');
			const OFFICE_CHECK2 = ($('#pop01_sel01_TYPE').val() == 'OFFICE02');
			let startDate = $('#pop01_date01_START').val();
			let endDate = $('#pop01_date01_END').val();

			let url = '/an1000/publicHoliday?startDate=' + startDate + '&endDate=' + endDate;

			if (HALF_CHECK) {
				// 반차 및 민방위인 경우
				$('#pop01_date01_END').val($('#pop01_date01_START').val());
				$('#pop01_txt01_COUNT').val('0.5');
			} else if (OFFICE_CHECK) {
				// 공식 휴무일(연차)
				res.some(item => {
					if (item.COUNT == 0) {
						console.log(item);
						$("#pop01_date01_START").val(item.OFFICE_HOLIDAY);
						$("#pop01_date01_END").val(item.OFFICE_HOLIDAY);
						$('#pop01_txt01_COUNT').val('1');
						return true;
					}
				});
				// if (holidayOfficeInfo.length == 0) {
				getAjaxJsonData(url, '', 'holidayDateCount', 'GET');
				// }
			} else if (OFFICE_CHECK2) {
				// 공식 휴무일(출근)
				res.some(item => {
					if (item.COUNT == 0) {
						$("#pop01_date01_START").val(item.OFFICE_HOLIDAY);
						$("#pop01_date01_END").val(item.OFFICE_HOLIDAY);
						return true;
					}
				});
				$('#pop01_txt01_COUNT').val('0');
			} else if (startDate != '' && endDate != '') {
				// 반차, 민방위, 공식 휴무일이 아닌 경우
				if (new Date(startDate) > new Date(endDate)) {
					toast("정보", "휴가기간을 확인해 주세요.", "info");
					$('#pop01_date01_END').val(startDate);
				}
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

		/**
		 * 검색 조건 기간 체크
		 */
		function searchPeriodCheck() {
			// 조회 시작일 >  조회 종료일일 경우
			if (new Date($("#date01_START").val()) > new Date($("#date01_END").val())) {
				$("#date01_END").val($("#date01_START").val())
			}
		}

		/**
		 * 휴가 저장 후 출력 조회
		 */
		function holidayGetAfterSave(data) {
			let valueArr = [
				data.GRADE_CD, data.GRADE_NM,
				data.HOLIDAY_CNT, data.HOLIDAY_START,
				data.HOLIDAY_END, data.HOLIDAY_REASON,
				data.HOLIDAY_TYPE, data.USER_NM,
				data.USER_ID
			];
			holidayPrint(valueArr);
		}

		/**
		 * 휴가 출력
		 */
		function holidayPrint(valueArr) {
			let nameArr = [
				"gradeCd", "gradeNm",
				"holidayCnt", "holidayStart",
				"holidayEnd", "holidayReason",
				"holidayType", "userNm",
				"userId"
			];

			let windowWidth = window.outerWidth;
			let windowHeight = window.outerHeight;
			let openWidth = 880;
			let openHeight = 1075;
			let top = (windowHeight - openHeight) / 2;
			let left = (windowWidth - openWidth) / 2;
			const url = '/an1000/print';
			const target = 'an1000Print';
			const option = 'width=' + openWidth + 'px , height=' + openHeight + 'px , top=' + top + 'px , left=' + left + 'px , toolbar=no, menubar=no, lacation=no, scrollbars=no, status=no';

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

		/**
		 * 연차 기간 안내 문구
		 */
		function holidayPeriodGuideWord (enterDate) {
			let userEnterDate = new Date(enterDate);
			let userEnterDateNext = new Date(new Date(userEnterDate).setDate(userEnterDate.getDate() - 1));
			let today = new Date();
			let startDate, endDate;

			for (let i = 0; i < 100; i++) {
				startDate = new Date(userEnterDate.getFullYear() + i, userEnterDate.getMonth() + 1, userEnterDate.getDate());
				endDate = new Date(userEnterDateNext.getFullYear() + i + 1, userEnterDateNext.getMonth() + 1, userEnterDateNext.getDate());
				if (startDate <= today && today < endDate) {
					break;
				}
			}

			const holidayInfoText1 = document.querySelector('#holiday-info-text1');
			const holidayInfoText2 = document.querySelector('#holiday-info-text2');
			holidayInfoText1.innerText = ""
					.concat(" ※ ")
					.concat(userName)
					.concat("님의 미사용 연차는 갱신 시 이월되지 않으니 기한 내에 모두 사용하여 주십시오.");
			holidayInfoText2.innerText = ""
					.concat("(사용기한: ")
					.concat(startDate.getFullYear())
					.concat(".").concat(startDate.getMonth() < 10 ? "0" + startDate.getMonth() : startDate.getMonth())
					.concat(".").concat((startDate.getDate() < 10 ? "0" + startDate.getDate() : startDate.getDate()))
					.concat("~")
					.concat(endDate.getFullYear())
					.concat(".").concat(endDate.getMonth() < 10 ? "0" + endDate.getMonth() : endDate.getMonth())
					.concat(".").concat((endDate.getDate() < 10 ? "0" + endDate.getDate() : endDate.getDate()))
					.concat(", 입사일 기준으로 갱신)");
		}
	</script>
</html>