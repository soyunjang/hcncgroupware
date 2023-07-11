<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<body>
		<!-- .contents-wrap 컨텐츠영역 START -->
		<div class="contents-wrap cm1000-page">
			<!-- .page-title-wrap 타이블영역 START -->
			<div class="page-title-wrap">
				<div class="page-title">
					<h2>공통코드관리</h2>
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
							<dt>시스템코드</dt>
							<dd>
								<input type="text" id="txt01_SYS_CD" class="w160">
							</dd>
						</dl>
						<dl>
							<dt>시스템명</dt>
							<dd>
								<input type="text" id="txt01_SYS_NM" class="w160">
							</dd>
						</dl>
						<dl>
							<dt>사용유무</dt>
							<dd>
								<select id="sel01_USE_YN" class="w160"></select>
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
				<div class="col col-1 wp50">
					<section>
						<div class="title-wrap">
							<div class="title-zone">
								<h2 class="title1">시스템코드 목록</h2>
							</div>
							<div class="btn-right-box">
								<ul>
									<li><a href="javascript:void(0);" id="btn01_SYS_INSERT">추가</a></li>
									<li><a href="javascript:void(0);" id="btn01_SYS_UPDATE">수정</a></li>
								</ul>
							</div>
						</div>
						<div class="table-wrap">
							<table id="table1"></table>
						</div>
					</section>
				</div>
				<div class="col col-2 wp50">
					<section>
						<div class="title-wrap">
							<div class="title-zone">
								<h2 class="title2">세부코드 목록</h2>
							</div>
							<div class="btn-right-box">
								<ul>
									<li><a href="javascript:void(0);" id="btn01_ITEM_INSERT">추가</a></li>
									<li><a href="javascript:void(0);" id="btn01_ITEM_UPDATE">수정</a></li>
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
				<div class="row row-1">
					<div class="col col-1 wp100">
						<section>
							<table class="table-write2">
								<caption>시스템코드</caption>
								<colgroup>
									<col class="wp20">
									<col class="wp30">
								</colgroup>
								<tbody>
									<tr>
										<th class="req">1.시스템코드</th>
										<td>
											<input type="text" id="pop01_txt01_SYS_CD" placeholder="시스템코드">
										</td>
									</tr>
									<tr>
										<th class="req">2.시스템코드명</th>
										<td>
											<input type="text" id="pop01_txt01_SYS_NM" placeholder="시스템코드명">
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
			</div>
		</div>
		<div id="viewForm2" style="display: none;">
			<div class="modal-cont">
				<div class="row row-1">
					<div class="col col-1 wp100">
						<section>
							<table class="table-write2">
								<caption>세부코드</caption>
								<colgroup>
									<col class="wp20">
									<col class="wp30">
								</colgroup>
								<tbody>
									<tr>
										<th class="req">1.세부코드</th>
										<td>
											<input type="text" id="pop02_txt01_ITEM_CD">
										</td>
									</tr>
									<tr>
										<th class="req">2.세부코드명</th>
										<td>
											<input type="text" id="pop02_txt01_ITEM_NM">
										</td>
									</tr>
									<tr>
										<th class="req">3.사용유무</th>
										<td>
											<select id="pop02_sel01_USE_YN" class="wp100"></select>
										</td>
									</tr>
									<tr>
										<th>4.비고</th>
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
		<!-- .modal-cont 팝업영역 END -->
	</body>
	
	<script type="text/javascript">
		/**
		 * CM1000	공통코드관리
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
		
		/* 변수 선언 */
		var gridSetChK2 = "N";
		
		/* 공통코드_콤보박스 */ 
		commonCodeSelectAdd("sel01_USE_YN", getCommonCode('USE'), 'N');
		commonCodeSelectAdd("pop01_sel01_USE_YN", getCommonCode('USE'), 'N');
		commonCodeSelectAdd("pop02_sel01_USE_YN", getCommonCode('USE'), 'N');
	
		/* Document가 로드되었을 때 실행되는 코드 */
		$(document).ready(function() {			
			function init() {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
				jQuery("#table2").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
			}
			
			jQuery(window).on('resize.jqGrid', function () {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
				jQuery("#table2").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
			});
			
			$("#sel01_USE_YN").find("option:eq(1)").prop("selected", "selected");
			
			// 화면ID, 화면ID사이즈(6:CM1000/13:CM1000_Detail), 다국어
			langHead = getLangCode("CM1000", 6, "${LANG}");
			langDetail = getLangCodeDetail("CM1000_Detail", 13, "${LANG}");
			
			setGrid();
			init(); //그리드 리사이징
		});
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 버튼
		/* 검색 버튼 */
		$("#btn01_SEARCH").on({
			click: function() {
				searchGridDataHead();
			}
		});
		
		//시스템코드 추가 버튼
		$("#btn01_SYS_INSERT").on({
			click: function() {
				openHeadPopup("HEAD_C");
			}
		});
		
		//시스템코드 수정 버튼
		$("#btn01_SYS_UPDATE").on({
			click: function() {
				if($("#table1").getGridParam("selrow") == null){
					toast("정보", "선택된 시스템코드가 없습니다.", "info");
					return;
				}
				openHeadPopup("HEAD_U");
			}
		});
		
		//세부코드 추가 버튼
		$("#btn01_ITEM_INSERT").on({
			click: function() {
				if($("#table1").getGridParam("selrow") == null){
					toast("정보", "선택된 시스템코드가 없습니다.", "info");
					return false;
				}
				openDetailPopup("DETAIL_C");
			}
		});
		
		//세부코드 수정 버튼
		$("#btn01_ITEM_UPDATE").on({
			click: function() {
				if($("#table1").getGridParam("selrow") == null){
					toast("정보", "선택된 시스템코드가 없습니다.", "info");
					return false;
				}
				if($("#table2").getGridParam("selrow") == null){
					toast("정보", "선택된 세부코드가 없습니다.", "info");
					return false;
				}
				openDetailPopup("DETAIL_U");
			}
		});

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: confirm
		/* confirm 확인버튼 클릭시 */
		function confirmYes(action){
			if(action.indexOf("HEAD_") > -1){
				var param = {
						SYS_CLASS_CD : $("#pop01_txt01_SYS_CD").val()
						, SYS_CLASS_NAME : $("#pop01_txt01_SYS_NM").val()
						, USE_YN : $("#pop01_sel01_USE_YN").val()
						, MEMO : $("#pop01_txt01_MEMO").val()
				};
				
				if(action == "HEAD_C"){
					getAjaxJsonData("cm1000HeadCnt", param, "HeadCntCallBack");
				}
				else if(action == "HEAD_U"){
					$("#viewForm1").dialog("close");
					
					gridSetChK = "Y";
					getAjaxJsonData("cm1000HeadSave", param, "HeadDataControlCallBack");
				}
			} else{
				var param = {
						SYS_CLASS_CD : $("#table1").getRowData($("#table1").getGridParam("selrow")).SYS_CLASS_CD
						, SYS_ITEM_CD : $("#pop02_txt01_ITEM_CD").val()
						, SYS_ITEM_NAME : $("#pop02_txt01_ITEM_NM").val()
						, USE_YN : $("#pop02_sel01_USE_YN").val()
						, MEMO : $("#pop02_txt01_MEMO").val()
				}
				
				if(action == "DETAIL_C"){
					getAjaxJsonData("cm1000DetailCnt", param, "DetailCntCallBack");
				}else if(action == "DETAIL_U"){
					$("#viewForm2").dialog("close");
					
					gridSetChK2 = "Y";
					getAjaxJsonData("cm1000DetailSave", param, "detailDataControlCallBack");
				}
			}
		}
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 그리드
		function setGrid(){
			$("#table1").jqGrid({
				mtype: 'POST'
				, datatype: 'local'
				, height: 540
				, jsonReader: {
					repeatitems: false
				}
				, colNames: langHead
				, colModel: [
					{name: 'SYS_CLASS_CD'		, align:'center'	, width: '20%'}
					, {name: 'SYS_CLASS_NAME'	, align:'left'		, width: '30%'}
					, {name: 'USE_YN'			, align:'center'	, width: '10%'}
					, {name: 'MEMO'				, align:'left'		, width: '30%'}
				]
				, autowidth: true		// 컬럼 사이즈 조절시 필요 (true)
				, shrinkToFit: false	// 컬럼 사이즈 조절시 필요 (false)
	            , viewrecords: false
				, onSelectRow: function(rowid, status, e){
					gridSetChK2 = "N";
					searchGridDataDetail();
				}
				, ondblClickRow : function(rowid, iRow, iCol, e) {
					openHeadPopup("HEAD_U");
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
					{name:'SYS_ITEM_CD'		, align:'center'	, width: '20%'}
					, {name:'SYS_ITEM_NAME'	, align:'left'		, width: '30%'}
					, {name:'USE_YN'		, align:'center'	, width: '10%'}
					, {name:'MEMO'			, align:'left'		, width: '30%'}
				]
				, autowidth: true
				, shrinkToFit: false
				, ondblClickRow : function(rowid, iRow, iCol, e) {
					openDetailPopup("DETAIL_U");
				}
			});
		};

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: CRUD
		/* Head Table 조회 */
		function searchGridDataHead(){
			var searchParam = {
				SYS_CLASS_CD: $("#txt01_SYS_CD").val()
				, SYS_CLASS_NAME: $("#txt01_SYS_NM").val()
				, USE_YN : $("#sel01_USE_YN").val()
			};
			
			getAjaxJsonData("cm1000HeadSel", searchParam, "searchGridDataHeadCallBack");
		};
		
		function searchGridDataHeadCallBack(data) {
			$("#table1").clearGridData();
			$('#table1').jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");
			
			$("#table2").clearGridData();
			$("#table1").jqGrid('setSelection', 1, true);
		};

		/* Detail Table 조회 */
		function searchGridDataDetail() {
			var seachParam = {
				SYS_CLASS_CD : $("#table1").getRowData($("#table1").getGridParam("selrow")).SYS_CLASS_CD
				, USE_YN : $("#sel01_USE_YN").val()
			};
			
			getAjaxJsonData("cm1000DetailSel", seachParam, "searchGridDataDetailCallBack");
		};

		function searchGridDataDetailCallBack(data) {
			$("#table2").clearGridData();
			$('#table2').jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");
			
			if(gridSetChK2 == "Y"){
				$("#table2").setSelection(1, true);
			}
		};
		
		//시스템 코드 저장/삭제 후 CallBack
		function HeadDataControlCallBack(data){
			if(data.length == 1){
				toast("오류", "이미 존재하는 시스템코드입니다.", "error");
				return;
			}else{
				toast("성공", "정상적으로 저장되었습니다.", "success");
				searchGridDataHead();
			}
		}

		//상세코드 코드 저장/삭제 후 CallBack
		function detailDataControlCallBack(data){
			if(data.length == 1){
				toast("오류", "이미 존재하는 세부코드입니다.", "error");
				return;
			}else{
				toast("성공", "정상적으로 저장되었습니다.", "success");
				searchGridDataDetail();
			}
		}

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 유효성
		/* 시스템코드 중복확인 */
		function HeadCntCallBack(data){
			if(data.CNT > 0){
				toast("오류", "시스템코드는 중복될 수 없습니다.", "error");
				$("#pop01_txt01_SYS_CD").focus();
				return;
			}
			else{
				$("#viewForm1").dialog("close");
				
				var param = {
						SYS_CLASS_CD : $("#pop01_txt01_SYS_CD").val()
						, SYS_CLASS_NAME : $("#pop01_txt01_SYS_NM").val()
						, USE_YN : $("#pop01_sel01_USE_YN").val()
						, MEMO : $("#pop01_txt01_MEMO").val()
				}
				
				getAjaxJsonData("cm1000HeadSave", param, "HeadDataControlCallBack");
			}
		}
		
		/* 세부코드 중복확인 */
		function DetailCntCallBack(data){
			if(data.CNT > 0){
				toast("오류", "세부코드는 중복될 수 없습니다.", "error");
				$("#pop02_txt01_ITEM_CD").focus();
				return;
			}
			else{
				$("#viewForm2").dialog("close");
				
				var param = {
						SYS_CLASS_CD : $("#table1").getRowData($("#table1").getGridParam("selrow")).SYS_CLASS_CD
						, SYS_ITEM_CD : $("#pop02_txt01_ITEM_CD").val()
						, SYS_ITEM_NAME : $("#pop02_txt01_ITEM_NM").val()
						, USE_YN : $("#pop02_sel01_USE_YN").val()
						, MEMO : $("#pop02_txt01_MEMO").val()
				}
				
				gridSetChK2 = "Y";
				getAjaxJsonData("cm1000DetailSave", param, "detailDataControlCallBack");
			}
		}
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: Popup
		function openHeadPopup(action) {
			// 화면ID, 화면ID사이즈(ex. 6:CM1000 / 13:CM1000_Detail), 팝업ID, 다국어
			var returnPopup = getLangCodePopup("CM1000_Pop1", 11, "viewForm1", "${LANG}");
			var titlePop = returnPopup[0];
			var pop01_btn01_SAVE = returnPopup[1];
			var pop01_btn01_CLOSE = returnPopup[2];
			
			$("#viewForm1").dialog({
				autoOpen : true
				, title : titlePop
				, width : 600
				, height : 350
				, modal : true
				, open : function(event, ui) {
					popReset("viewForm1");
					
					$("#pop01_txt01_SYS_CD").removeClass("readonly");
					$("#pop01_txt01_SYS_CD").attr("readonly", false);
					$("#pop01_sel01_USE_YN").find("option:eq(1)").prop("selected", "selected");
					
					if(action == "HEAD_U"){
						var rowData = $("#table1").getRowData($("#table1").getGridParam("selrow"));
						$("#pop01_txt01_SYS_CD").val(rowData.SYS_CLASS_CD);
						$("#pop01_txt01_SYS_CD").addClass("readonly");
						$("#pop01_txt01_SYS_CD").attr("readonly", true);
						
						$("#pop01_txt01_SYS_NM").val(rowData.SYS_CLASS_NAME);
						$("#pop01_sel01_USE_YN").val(rowData.USE_YN == "사용" ? "Y" : "N");
						$("#pop01_txt01_MEMO").val(rowData.MEMO);
					}
				}
				, close : function() {
					$(this).dialog("close");
				}
				, buttons : [
					{
						text : pop01_btn01_SAVE
						, click : function() {
							if(action == "HEAD_C"){
								if($("#pop01_txt01_SYS_CD").val() == ""){
									toast("오류", "시스템코드를 입력해주세요.", "error");
									$("#pop01_txt01_SYS_CD").focus();
									return;
								}
								
								if($("#pop01_txt01_SYS_NM").val() == ""){
									toast("오류", "시스템코드명을 입력해주세요.", "error");
									$("#pop01_txt01_SYS_NM").focus();
									return;
								}
							}else if(action == "HEAD_U"){
								if($("#pop01_txt01_SYS_NM").val() == ""){
									toast("오류", "세부코드명을 입력해주세요.", "error");
									$("#pop01_txt01_SYS_NM").focus();
									return;
								}
							}
							
							confirms("저장하시겠습니까?", action);
						}
					}
					, {
						text : pop01_btn01_CLOSE,
	                    click : function() {
							$(this).dialog("close");
						}
					}
				]
			}).css("z-index", 1000).prev(".ui-dialog-titlebar").css("background", "#266f80").css("color", "#fff");
		};
		
		function openDetailPopup(action) {
			// 화면ID, 화면ID수, 팝업ID, 다국어
			var returnPopup = getLangCodePopup("CM1000_Pop2", 11, "viewForm2 ", "${LANG}");
			var titlePop = returnPopup[0];
			var pop02_btn01_SAVE = returnPopup[1];
			var pop02_btn01_CLOSE = returnPopup[2];
			
			$("#viewForm2").dialog({
				autoOpen : true
				, title : titlePop
				, width : 600
				, height : 350
				, modal : true
				, open : function(event, ui) {
					popReset("viewForm2");
					
					$("#pop02_txt01_ITEM_CD").removeClass("readonly");
					$("#pop02_txt01_ITEM_CD").attr("readonly", false);
					$("#pop02_sel01_USE_YN").find("option:eq(1)").prop("selected", "selected");
					
					if(action == "DETAIL_U"){
						var rowData = $("#table2").getRowData($("#table2").getGridParam("selrow"));
						$("#pop02_txt01_ITEM_CD").val(rowData.SYS_ITEM_CD);
						$("#pop02_txt01_ITEM_CD").addClass("readonly");
						$("#pop02_txt01_ITEM_CD").attr("readonly", true);
						
						$("#pop02_txt01_ITEM_NM").val(rowData.SYS_ITEM_NAME);
						$("#pop02_sel01_USE_YN").val(rowData.USE_YN == "사용" ? "Y" : "N");
						$("#pop02_txt01_MEMO").val(rowData.MEMO);
					}
				}
				, close : function() {
					$(this).dialog("close");
				}
				, buttons : [
					{
						text : pop02_btn01_SAVE,
	                    click : function() {
							if(action == "DETAIL_C"){
								if($("#pop02_txt01_ITEM_CD").val() == ""){
									toast("오류", "세부코드를 입력해주세요.", "error");
									$("#pop02_txt01_ITEM_CD").focus();
									return;
								}
								
								if($("#pop02_txt01_ITEM_NM").val() == ""){
									toast("오류", "세부코드명을 입력해주세요.", "error");
									$("#pop02_txt01_ITEM_NM").focus();
									return;
								}
								
								confirms("저장하시겠습니까?", "DETAIL_C");
							}
							else if(action == "DETAIL_U"){
								
								if($("#pop02_txt01_ITEM_NM").val() == ""){
									toast("오류", "세부코드명을 입력해주세요.", "error");
									$("#pop02_txt01_ITEM_NM").focus();
									return;
								}
								
								confirms("저장하시겠습니까?", "DETAIL_U");
							}
						}
					}
					, {
						text : pop02_btn01_CLOSE
						, click : function() {
							$(this).dialog("close");
						}
					}
				]
			}).css("z-index", 1000).prev(".ui-dialog-titlebar").css("background", "#266f80").css("color", "#fff");
		};
	</script>
</html>