<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<body>
		<!-- .contents-wrap 컨텐츠영역 START -->
		<div class="contents-wrap cm1300-page">
			<!-- .page-title-wrap 타이블영역 START -->
			<div class="page-title-wrap">
				<div class="page-title">
					<h2>권한그룹관리</h2>
					<ul class="title-btn"></ul>
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
							<dt>권한분류명</dt>
							<dd>
								<select id="sel01_AUTH_TYPE_CD"></select>
							</dd>
						</dl>
						<dl>
							<dt>사용유무</dt>
							<dd>
								<select id="sel01_USE_YN"></select>
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
			<!-- .search-wrap 검색영역 END -->
			
			<!-- .title-wrap TABLE영역 START -->
			<div class="row row-1 row-wrap-src">				
				<div class="col col-1 wp40">
					<section>
						<div class="title-wrap">
							<div class="title-zone">
								<h2 class="title1">권한분류코드 목록</h2>
							</div>
							<div class="btn-right-box">
								<ul>
									<li><a href="javascript:void(0);" id="btn01_HEAD_INSERT">추가</a></li>
									<li><a href="javascript:void(0);" id="btn01_HEAD_UPDATE">수정</a></li>
								</ul>
							</div>
						</div>
						<div class="table-wrap">
							<table id="table1"></table>
						</div>
					</section>
				</div>
				<div class="col col-2 wp60">
					<section>
						<div class="title-wrap">
							<div class="title-zone">
								<h2 class="title2">세부코드 목록</h2>
							</div>
							<div class="btn-right-box">
								<ul>
									<li><a href="javascript:void(0);" id="btn01_DETAIL_INSERT">추가</a></li>
									<li><a href="javascript:void(0);" id="btn01_DETAIL_UPDATE">수정</a></li>
								</ul>
							</div>
						</div>
						<div class="table-wrap">
							<table id="table2"></table>
						</div>
					</section>
				</div>
			</div>
			<!-- .title-wrap TABLE영역 END -->
		</div>
		<!-- .contents-wrap 컨텐츠영역 END -->
		
		<!-- .modal-cont 팝업영역 START -->
		<div id="viewForm1" style="display: none;">
			<div class="modal-cont">
				<section>
					<table class="table-write2">
						<caption>권한분류코드</caption>
						<colgroup>
							<col class="wp20">
							<col class="wp30">
						</colgroup>
						<tbody>
							<tr>
								<th class="req">1.권한분류코드</th>
								<td>
									<input type="text" id="pop01_txt01_AUTH_TYPE_CD">
								</td>
							</tr>
							<tr>
								<th class="req">2.권한분류명</th>
								<td>
									<input type="text" id="pop01_txt01_AUTH_TYPE_NM">	
								</td>
							</tr>
							<tr>
								<th class="req">3.사용유무</th>
								<td>
									<select id="pop01_sel01_USE_YN" class="wp100"></select>
								</td>
							</tr>
							<tr>
								<th>4.비고</th>
								<td>
									<input type="text" id="pop01_txt01_MEMO">
								</td>
							</tr>
						</tbody>
					</table>
				</section>
			</div>
		</div>
		
		<!-- 세부코드 추가 팝업 -->
		<div id="viewForm2" style="display: none;">
			<div class="modal-cont">
				<div class="search-zone">
					<div class="search-wrap">
						<div class="sch-box">
							<dl class="dl-3n">
								<dt><label>메뉴명</label></dt>
								<dd>
									<input type="text" id="pop02_txt01_MENU_NM">
								</dd>
							</dl>
						</div>
						<div class="srch-btn wp40">
							<ul class="btn-right-wrap">
								<li><a href="javascript:searchGridDataMenu();" class="btn-search">검색</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row row-1">
					<div class="col col-1 wp50">
						<section>
							<div class="table-wrap h300">
								<table id="table3"></table>
							</div>
						</section>
					</div>
					<div class="col col-1 wp50">
						<section>
							<div class="table-wrap h300">
								<table id="table4"></table>
							</div>
						</section>
					</div>
				</div>
				<div class="row row-2">
					<div class="col col-1 wp100">
						<section>
							<table class="table-write2">
								<colgroup>
									<col class="wp20">
									<col class="wp30">
								</colgroup>
								<tbody>
									<tr>
										<th>1.사용유무</th>
										<td>
											<select id="pop02_sel01_USE_YN" class="wp100"></select>
										</td>
									</tr>
									<tr>
										<th>2.비고</th>
										<td>
											<input type="text" id="pop02_txt01_MEMO">
										</td>
									</tr>
								</tbody>
							</table>
						</section>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 세부코드 수정 팝업 -->
		<div id="viewForm3" style="display: none;">
			<div class="modal-cont">
				<section class="mg-r0">
					<table class="table-write2">
						<caption>화면 및 기능</caption>
						<colgroup>
							<col class="wp20">
							<col class="wp30">
						</colgroup>
						<tbody>
							<tr>
								<th class="req">1.메뉴ID</th>
								<td>
									<input type="text" id="pop03_txt01_MENU_ID" class="readonly" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th class="req">2.메뉴명</th>
								<td>
									<input type="text" id="pop03_txt01_MENU_NM" class="readonly" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th class="req">3.기능코드</th>
								<td>
									<input type="text" id="pop03_txt01_BUTTON_CD" class="readonly" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th class="req">4.기능명</th>
								<td>
									<input type="text" id="pop03_txt01_BUTTON_NM" class="readonly" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th>5.사용유무</th>
								<td>
									<select id="pop03_sel01_USE_YN" class="wp100"></select>
								</td>
							</tr>
							<tr>
								<th>6.비고</th>
								<td>
									<input type="text" id="pop03_txt01_MEMO">
								</td>
							</tr>
						</tbody>
					</table>
				</section>
			</div>
		</div>
		<!-- .modal-cont 팝업영역 END -->
	</body>
	
	<script type="text/javascript">
		/**
		 * CM1300	권한그룹관리
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
		var langHead;
		var langDetail;
		var langPop2;
		var langPop3;
		
		/* 공통코드_콤보박스 */ 
		commonAuthSelectAdd("sel01_AUTH_TYPE_CD", getAuthCode(), 'Y');
		commonCodeSelectAdd("sel01_USE_YN", getCommonCode('USE'), 'Y');
		commonCodeSelectAdd("pop01_sel01_USE_YN", getCommonCode('USE'), 'N');
		commonCodeSelectAdd("pop02_sel01_USE_YN", getCommonCode('USE'), 'N');
		commonCodeSelectAdd("pop03_sel01_USE_YN", getCommonCode('USE'), 'N');
	
		/* Document가 로드되었을 때 실행되는 코드 */
		$(document).ready(function() {
			function init() {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()), true);
				jQuery("#table2").jqGrid('setGridWidth', (jQuery(".table-wrap").width()), true);
				jQuery("#table3").jqGrid('setGridWidth', (jQuery(".table-wrap3").width()), true);
			};
			
			jQuery(window).on("resize.jqGrid", function() {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()), true);
				jQuery("#table2").jqGrid('setGridWidth', (jQuery(".table-wrap").width()), true);
				jQuery("#table3").jqGrid('setGridWidth', (jQuery(".table-wrap3").width()), true);
			});
			
			// 화면ID, 화면ID사이즈(6:CM1000/13:CM1000_Detail), 다국어
			langHead = getLangCode("CM1300", 6, "${LANG}");
			langDetail = getLangCodeDetail("CM1300_Detail", 13, "${LANG}");
			langPop2 = getLangCodeDetail("CM1300_Pop2", 11, "${LANG}");
			langPop3 = getLangCodeDetail("CM1300_Pop3", 11, "${LANG}");
			
			setGrid();
			init();	//그리드 리사이징
		});
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 버튼
		/* 검색 버튼 */
		$("#btn01_SEARCH").on({
			click: function() {
				searchGridDataHead();
			}
		});

		/* Head 추가 버튼 */
		$("#btn01_HEAD_INSERT").on({
			click: function() {
				openHeadUpdatePopup("C");
			}
		});
		
		/* Head 수정 버튼 */
		$("#btn01_HEAD_UPDATE").on({
			click: function() {
				if($("#table1").getGridParam("selrow") == null){
					toast("정보", "선택된 권한분류코드가 없습니다.", "info");
					return false;
				}else {
					openHeadUpdatePopup("U");
				}	
			}
		});

		/* Detail 추가 버튼 */
		$("#btn01_DETAIL_INSERT").on({
			click: function() {
				if($("#table1").getGridParam("selrow") == null){
					toast("정보", "선택된 권한분류코드가 없습니다.", "info");
					return false;
				}else {
					openDetailInsertPopup();
				}
			}
		});
		
		/* Detail 수정 버튼 */
		$("#btn01_DETAIL_UPDATE").on({
			click: function() {
				if($("#table2").getGridParam("selrow") == null){
					toast("정보", "선택된 세부코드가 없습니다.", "info");
					return false;
				}else {
					openDetailUpdatePopup();
				}
			}
		});
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: confirm
		/* confirm 확인버튼 클릭시 */
		function confirmYes(action) {
			if(action == "HEAD") {
				updateGridDataHead();
				$("#viewForm1").dialog("close");
			} else if(action.indexOf("DETAIL_") > -1) {
				if(action == "DETAIL_C") {
					var params = new Array();
					var gridD = $("#table4");
					var idsD = gridD.jqGrid('getDataIDs');
					
					for(var i = 0; i < idsD.length; i++) {
						var retD = gridD.jqGrid('getRowData', idsD[i]);
						
						var param = {
								AUTH_TYPE_CD : $("#table1").getRowData($("#table1").getGridParam("selrow")).AUTH_TYPE_CD
								, MENU_ID : $("#table3").getRowData($("#table3").getGridParam("selrow")).MENU_ID
								, MENU_NAME : $("#table3").getRowData($("#table3").getGridParam("selrow")).MENU_NAME
								, BUTTON_TYPE_CD : retD.BUTTON_TYPE_CD
								, BUTTON_TYPE_NAME : retD.BUTTON_TYPE_NAME
								, USE_YN : $("#pop02_sel01_USE_YN").val()
								, MEMO : $("#pop02_txt01_MEMO").val()
						};
						
						params.push(param);
					}
					
					ajaxSubmit("cm1300DetailCnt", params, "searchDetailCntCallBack", "");
					$("#viewForm2").dialog("close");
				}else if(action == "DETAIL_U") {
					updateGridDataDetail();
					$("#viewForm3").dialog("close");
				}
			}
		};

		/* Detail Table cnt 조회 Callback */
		function searchDetailCntCallBack(data) {
			if(data.cnt > 0) {
				toast("오류", "이미 존재하는 세부코드입니다.", "error");
				return false;
			}
			else {
				ajaxSubmit("cm1300DetailSave", data.param, "reLoadHeadCallback", "저장");
			}
		};
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 그리드
		/* jqGrid 세팅 */
		function setGrid() {
			$("#table1").jqGrid({
				mtype: 'POST'
				, datatype: 'local'
				, height: 540
				, jsonReader: {
					repeatitems: false
				}
				, colNames: langHead
				, colModel: [
					{name: 'AUTH_TYPE_CD'  		, align: 'center'	, width: '20%'}
					, {name: 'AUTH_TYPE_NAME'	, align: 'left'  	, width: '30%'}
					, {name: 'USE_YN'        	, align: 'center'	, width: '15%'}
					, {name: 'MEMO'          	, align: 'left'  	, width: '35%'}
			  	]
				, autowidth: true
				, shrinkToFit: false
				, rowNum : 5000
				, onSelectRow: function(rowid, status, e) {
					searchGridDataDetail();
				}
				, ondblClickRow: function(rowid, iRow, iCol, e) {
					openHeadUpdatePopup("U");
				}
			});
			
			searchGridDataHead();
			
			$("#table2").jqGrid({
				mtype: 'POST'
				, datatype: 'local'
				, height: 540
				, jsonReader: {
					repeatitems: false
				}
				, colNames: langDetail
				, colModel: [
					{name: 'MENU_ID'         	, align: 'center'	, width: '10%'}
					, {name: 'MENU_NAME'       	, align: 'left'  	, width: '20%'}
					, {name: 'BUTTON_TYPE_CD'  	, align: 'center'	, width: '12%'}
					, {name: 'BUTTON_TYPE_NAME'	, align: 'left'  	, width: '15%'}
					, {name: 'USE_YN'          	, align: 'center'	, width: '10%'}
					, {name: 'MEMO'            	, align: 'left'  	, width: '25%'}
				]
				, autowidth: true
				, shrinkToFit: false
				, rowNum : 5000
				, ondblClickRow: function(rowid, status, e) {
					openDetailUpdatePopup();
			  	}
			});
			
			$("#table3").jqGrid({
				mtype: 'POST'
				, datatype: 'local'
				, height: 200
				, jsonReader: {
					repeatitems: false
				}
				, colNames: langPop2
				, colModel: [
					  {name: 'MENU_ID'  	, align: 'center'	, width: '30%'}
					, {name: 'MENU_NAME'	, align: 'left'  	, width: '70%'}
				]
				, autowidth: false
				, shrinkToFit: false
	            , rowNum: 500
	            , scroll: true
				, onSelectRow: function(rowid, status, e) {
					searchGridDataButton();
			  	}
			});
			
			$("#table4").jqGrid({
				  mtype: 'POST'
				, datatype: 'local'
				, height: 200
				, jsonReader: {
					repeatitems: false
				  }
				, colNames: langPop3
				, colModel: [
					{name: 'BUTTON_TYPE_CD'  	, align: 'center'	, width: '20%'}
					, {name: 'BUTTON_TYPE_NAME'	, align: 'left'  	, width: '40%'}
				  ]
				, autowidth: false
				, shrinkToFit: false
	            , rowNum: 500
	            , scroll: true
				, multiselect: true
			});
		};
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: CRUD
		/* Head Table 조회 */
		function searchGridDataHead() {
			var searchParam = {
					AUTH_TYPE_CD : $("#sel01_AUTH_TYPE_CD").val()
					, USE_YN : $("#sel01_USE_YN").val()
			};
			
			getAjaxJsonData("cm1300HeadSel", searchParam, "searchGridDataHeadCallBack");
		};

		/* Head Table 조회 Callback */
		function searchGridDataHeadCallBack(data) {
			$("#table1").clearGridData();
			$("#table1").jqGrid("setGridParam", {
				datatype: "local"
				, data    : data
			}).trigger("reloadGrid");
			
			$("#table2").clearGridData();
			$("#table1").jqGrid('setSelection', 1, true);
		};
		
		/* Detail Table 조회 */
		function searchGridDataDetail() {
			var seachParam = {
					AUTH_TYPE_CD : $("#table1").getRowData($("#table1").getGridParam("selrow")).AUTH_TYPE_CD
					, USE_YN : $("#sel01_USE_YN").val()
			};
			
			getAjaxJsonData("cm1300DetailSel", seachParam, "searchGridDataDetailCallBack");
		};

		/* Detail Table 조회 Callback */
		function searchGridDataDetailCallBack(data) {
			$("#table2").clearGridData();
			$("#table2").jqGrid("setGridParam", {
				datatype: "local"
				, data: data
			}).trigger("reloadGrid");
		};

		/* Head Table 추가 & 수정 */
		function updateGridDataHead() {
			var params = {
					AUTH_TYPE_CD: $("#pop01_txt01_AUTH_TYPE_CD").val()
					, AUTH_TYPE_NAME: $("#pop01_txt01_AUTH_TYPE_NM").val()
					, USE_YN: $("#pop01_sel01_USE_YN").val()
					, MEMO: $("#pop01_txt01_MEMO").val()
			};
			
			getAjaxJsonData("cm1300HeadSave", params, "reLoadHeadCallback");
		};

		/* 저장 후 Head Table 재 조회 */
		function reLoadHeadCallback(data) {
			if(data.length == 1){
				toast("오류", "이미 존재하는 권한분류코드입니다.", "error");
				return;
			}else{
				toast("성공", "정상적으로 저장되었습니다.", "success");
				searchGridDataHead();
			}
		};

		function updateGridDataDetail() {
			var params = new Array();
			var param = {
					AUTH_TYPE_CD : $("#table1").getRowData($("#table1").getGridParam("selrow")).AUTH_TYPE_CD
					, MENU_ID : $("#pop03_txt01_MENU_ID").val()
					, MENU_NAME : $("#pop03_txt01_MENU_NM").val()
					, BUTTON_TYPE_CD : $("#pop03_txt01_BUTTON_CD").val()
					, BUTTON_TYPE_NAME: $("#pop03_txt01_BUTTON_NM").val()
					, USE_YN : $("#pop03_sel01_USE_YN option:selected").val()
					, MEMO : $("#pop03_txt01_MEMO").val()
			};
			
			params.push(param);
			
			ajaxSubmit("cm1300DetailSave", params, "reLoadHeadCallback", "저장");
		};
		
		/* 저장 후 Detail Table 재 조회 */
		function reLoadDetailCallback(data) {
			if(data.length == 1){
				toast("오류", "이미 존재하는 세부코드입니다.", "error");
				return;
			}else{
				toast("성공", "정상적으로 저장되었습니다.", "success");
				searchGridDataDetail();
			}
		};
		
		/* 팝업 Menu Table 조회 */
		function searchGridDataMenu() {
			var searchParam = {
					MENU_NAME: $("#pop02_txt01_MENU_NM").val()
					, USE_YN: "Y"
			};
			
			getAjaxJsonData("cm1300PopMenuSel", searchParam, "searchGridDataMenuCallBack");
		};

		/* 팝업 Menu Table 조회 Callback */
		function searchGridDataMenuCallBack(data) {
			$("#table3").clearGridData();
			$("#table3").jqGrid("setGridParam", {
				  datatype: "local"
				, data    : data
			}).trigger("reloadGrid");
			
			$("#table3").setSelection(1, true);
		};
		
		/* 팝업 Button Table 조회 */
		function searchGridDataButton() {
			var searchParam = {
					AUTH_TYPE_CD: $("#table1").getRowData($("#table1").getGridParam("selrow")).AUTH_TYPE_CD
					, MENU_ID: $("#table3").getRowData($("#table3").getGridParam("selrow")).MENU_ID
					, USE_YN: "Y"
			};
			
			getAjaxJsonData("cm1300PopButtonSel", searchParam, "searchGridDataButtonCallBack");
		};

		/* 팝업 Button Table 조회 Callback */
		function searchGridDataButtonCallBack(data) {
			$("#table4").clearGridData();
			$("#table4").jqGrid("setGridParam", {
				  datatype: "local"
				, data    : data
			}).trigger("reloadGrid");
		};
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 유효성
		/* 권한분류코드 중복확인 */
		function searchValidationHeadCnt(){
			var seachParam = {
				AUTH_TYPE_CD: $("#pop01_txt01_AUTH_TYPE_CD").val()
			};
			
			getAjaxJsonData("cm1300HeadCnt", seachParam, "searchHeadCntCallBack");
		}

		function searchHeadCntCallBack(data) {
			if(data.cnt > 0) {
				toast("오류", "이미 존재하는 권한분류코드입니다.", "error");
				return false;
			}
			else {
				confirms("저장하시겠습니까?", "HEAD");
			}
		};
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: Popup
		/* Head Table 추가 & 수정 */
		function openHeadUpdatePopup(action) {
			// 화면ID, 화면ID사이즈(ex. 6:CM1000 / 13:CM1000_Detail), 팝업ID, 다국어
			var returnPopup = getLangCodePopup("CM1300_Pop1", 11, "viewForm1", "${LANG}");
			var titlePop = returnPopup[0];
			var pop01_btn01_SAVE = returnPopup[1];
			var pop01_btn01_CLOSE = returnPopup[2];
			
			$("#viewForm1").dialog({
				autoOpen: true
				, title: titlePop
				, width: 450
				, modal: true
				, open: function(event, ui) {
					popReset("viewForm1");
					
					if(action == "C") {
						$("#pop01_sel01_USE_YN").val("Y");
						$("#pop01_txt01_AUTH_TYPE_CD").removeClass("readonly");
						$("#pop01_txt01_AUTH_TYPE_CD").attr("readonly", false);
					}
					else if(action == "U") {
						var rowData = $("#table1").getRowData($("#table1").getGridParam("selrow"));
						
						$("#pop01_txt01_AUTH_TYPE_CD").val(rowData.AUTH_TYPE_CD);
						$("#pop01_txt01_AUTH_TYPE_NM").val(rowData.AUTH_TYPE_NAME);
						$("#pop01_sel01_USE_YN").val(rowData.USE_YN == "사용" ? "Y": "N");
						$("#pop01_txt01_MEMO").val(rowData.MEMO);
						
						$("#pop01_txt01_AUTH_TYPE_CD").addClass("readonly");
						$("#pop01_txt01_AUTH_TYPE_CD").attr("readonly", true);
					}
				  }
				, close: function() {
					$(this).dialog("close");
				  }
				, buttons: [
					{
						text : pop01_btn01_SAVE,
	                    click : function(){
							if(action == "C") {
								if($("#pop01_txt01_AUTH_TYPE_CD").val() == '') {
									toast("오류", "권한분류코드를 입력해주세요.", "error");
									return false;
								}
								if($("#pop01_txt01_AUTH_TYPE_NM").val() == ''){
									toast("오류", "권한분류명을 입력해주세요.", "error");
									return false;
								}
								
								searchValidationHeadCnt();
							}
						}
					}
					, {
						text : pop01_btn01_CLOSE,
	                    click : function() {
							$(this).dialog("close");
						}
					}
				]
				, focus: function(event, ui) {}
			}).css("z-index", 1000).prev(".ui-dialog-titlebar").css("background", "#266f80").css("color", "#fff");
		};

		/* Detail Table 추가 */
		function openDetailInsertPopup() {
			// 화면ID, 화면ID사이즈(ex. 6:CM1000 / 13:CM1000_Detail), 팝업ID, 다국어
			var returnPopup = getLangCodePopup("CM1300_Pop2", 11, "viewForm2", "${LANG}");
			var titlePop = returnPopup[0];
			var pop02_btn01_SAVE = returnPopup[1];
			var pop02_btn01_CLOSE = returnPopup[2];
			
			$("#viewForm2").dialog({
				autoOpen: true
				, title: titlePop
				, width: 900
				, modal: true
				, open: function(event, ui) {
					popReset("viewForm2");
					searchGridDataMenu();
					
					$("#pop02_sel01_USE_YN").val("Y");
				  }
				, close: function() {
					$(this).dialog("close");
				  }
				, buttons: [
					{
						text : pop02_btn01_SAVE,
	                    click : function() {
							var rowid = $("#table4").getGridParam("selarrrow");
							if(rowid.length == 0) {
								toast("정보", "선택된 버튼기능이 없습니다.", "info");
								return false;
							}
							
							confirms("저장하시겠습니까?", "DETAIL_C");
						}
					}
					, {
						text : pop02_btn01_CLOSE,
	                    click : function() {
							$(this).dialog("close");
						}
				  	}
				]
				, focus: function(event, ui) {}
			}).css("z-index", 1000).prev(".ui-dialog-titlebar").css("background", "#266f80").css("color", "#fff");
		};
		
		/* Detail Table 수정 */
		function openDetailUpdatePopup() {
			// 화면ID, 화면ID사이즈(ex. 6:CM1000 / 13:CM1000_Detail), 팝업ID, 다국어
			var returnPopup = getLangCodePopup("CM1300_Pop4", 11, "viewForm3", "${LANG}");
			var titlePop = returnPopup[0];
			var pop04_btn01_SAVE = returnPopup[1];
			var pop04_btn01_CLOSE = returnPopup[2];
			
			$("#viewForm3").dialog({
				autoOpen: true
				, title: titlePop
				, width: 500
				, modal: true
				, open: function(event, ui) {
					popReset("viewForm3");
					
					var rowData = $("#table2").getRowData($("#table2").getGridParam("selrow"));
					$("#pop03_txt01_MENU_ID").val(rowData.MENU_ID);
					$("#pop03_txt01_MENU_NM").val(rowData.MENU_NAME);
					$("#pop03_txt01_BUTTON_CD").val(rowData.BUTTON_TYPE_CD);
					$("#pop03_txt01_BUTTON_NM").val(rowData.BUTTON_TYPE_NAME);
					$("#pop03_sel01_USE_YN").val(rowData.USE_YN == "사용" ? "Y": "N");
					$("#pop03_txt01_MEMO").val(rowData.MEMO);
			  	}
				, close: function() {
					$(this).dialog("close");
			  	}
				, buttons: [
					{
						text : pop04_btn01_SAVE,
	                    click : function() {
							confirms("저장하시겠습니까?", "DETAIL_U");
						}
					}
					, {
						text : pop04_btn01_CLOSE,
	                    click : function() {
							popReset("viewForm3");
							$(this).dialog("close");
						}
				  	}
				]
				, focus: function(event, ui) {}
			}).css("z-index", 1000).prev(".ui-dialog-titlebar").css("background", "#266f80").css("color", "#fff");
		};
	</script>
</html>