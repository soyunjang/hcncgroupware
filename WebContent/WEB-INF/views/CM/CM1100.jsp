<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<body>
		<!-- .contents-wrap 컨텐츠영역 START -->
		<div class="contents-wrap cm1100-page">
			<!-- .page-title-wrap 타이블영역 START -->
			<div class="page-title-wrap">
				<div class="page-title">
					<h2>부서 관리</h2>
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
							<dt>부서명</dt>
							<dd>
								<input type="text" id="txt01_DEPT_NM">
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
			<div class="row row-1 row-wrap-tab-305-btn">
				<div class="col col-1 wp100">
					<section>
						<div class="title-wrap">
		                    <div class="title-zone">
								<h2 class="title1">부서 목록</h2>
								<span id="table1_cnt">0</span>
							</div>
							<div class="btn-right-box">
								<ul>
									<li><a href="javascript:void(0);" id="btn01_EXCEL">엑셀</a></li>
									<li><a href="javascript:void(0);" id="btn01_INSERT">추가</a></li>
									<li><a href="javascript:void(0);" id="btn01_UPDATE">저장</a></li>
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
			
			<!-- .contents-wrap 컨텐츠영역 START -->
			<div class="row row-2">
				<section class="wp100">
					<table class="table-write">
				        <caption>부서 관리</caption>
				        <colgroup>
				            <col class="wp10">
				            <col class="wp23">
				            <col class="wp10">
				            <col class="wp23">
				            <col class="wp10">
				            <col class="wp23">
				        </colgroup>
						<tbody>
				            <tr>
				                <th>1.상위부서코드</th>
				                <td>
				                	<input type="text" id="pop01_txt01_DEPT_PID" maxlength="10" placeholder="상위부서코드를 입력해주세요." />
				                </td>
				                <th class="req">2.부서코드</th>
				                <td>
				                	<input type="text" id="pop01_txt01_DEPT_ID" maxlength="10" placeholder="부서코드를 입력해주세요." />
				                </td>
				                <th class="req">3.부서명</th>
				                <td>
				                	<input type="text" id="pop01_txt01_DEPT_NM" placeholder="부서명을 입력헤주세요." />
				                </td>
				            </tr>
				            <tr>
				                <th class="req">4.부서그룹</th>
				                <td>
				                	<select id="pop01_sel01_GROUP" class="wp100"></select>
				                </td>
				                <th class="req">5.정렬순번</th>
				                <td>
				                	<input type="text" id="pop01_txt01_SORT" placeholder="정렬순번을 입력헤주세요." />
				                </td>
				                <th class="req">6.사용유무</th>
				                <td>
				                	<select id="pop01_sel01_USE" class="wp100"></select>
				                </td>
				            </tr>
				            <tr>
				                <th>7.비고</th>
				                <td colspan="5">
				                	<input type="text" id="pop01_txt01_MEMO" class="table-write">
				                </td>
				            </tr>
				        </tbody>
				    </table>
				</section>
			</div>
		</div>
		<!-- .contents-wrap 컨텐츠영역 END -->
	</body>
	
	<script type="text/javascript">
		/**
		 * CM1100	부서관리
		 * -------------------------------------------------------------------
		 * 01. 공통코드
		 * 02. 버튼
		 * 03. confirm
		 * 04. 그리드
		 * 05. CRUD
		 * 06. 유효성
		 * -------------------------------------------------------------------
		 */
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 공통코드
		/* 공통코드_다국어 */
		var langHead;
		
		/* 공통코드_콤보박스 */ 
		commonCodeSelectAdd("pop01_sel01_GROUP", getCommonCode('MGROUP'), 'N');
		commonCodeSelectAdd("pop01_sel01_USE", getCommonCode('USE'), 'N');
		
		/* Document가 로드되었을 때 실행되는 코드 */
		$(document).ready(function() {
			function init() {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
			}
			
			jQuery(window).on('resize.jqGrid', function () {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
			});
			
			// 화면ID, 화면ID사이즈(6:CM1000/13:CM1000_Detail), 다국어
			langHead = getLangCode("CM1100", 6, "${LANG}");
			
			setGrid();
			init(); //그리드 리사이징
		});
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 버튼
		/* 엑셀 버튼 */
		$("#btn01_EXCEL").on({
			click: function(){
				exportExcel("table1", "부서 관리");
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
			click: function(e){
				e.preventDefault();
				
				var maxRow = $("#table1").jqGrid('getGridParam', 'reccount') + 1;
				$("#table1").jqGrid("addRow", {
					rowID : maxRow,
					initdata : {},
					position : "first",
					useDefValues : false,
					useFormatter : false,
					addRowParams : {
						extraparam : {}
					}
				});
				
				$("tr#" + maxRow, $('#table1')).addClass('insert');
				
				$('#pop01_txt01_DEPT_PID').val("");
				$('#pop01_txt01_DEPT_ID').val("");
				$('#pop01_txt01_DEPT_NM').val("");
				$('#pop01_sel01_GROUP').val("GRP01");
				$('#pop01_txt01_SORT').val("");
				$('#pop01_sel01_USE').val("Y");
				$('#pop01_txt01_MEMO').val("");
				
				$('#pop01_txt01_DEPT_PID').attr("disabled", false);
				$('#pop01_txt01_DEPT_ID').attr("readonly", false).attr("disabled", false);
				$('#pop01_txt01_DEPT_NM').attr("readonly", false).attr("disabled", false);
				$('#pop01_sel01_GROUP').attr("disabled", false);
				$('#pop01_txt01_SORT').attr("readonly", false).attr("disabled", false);
				$('#pop01_sel01_USE').attr("disabled", false);
				$('#pop01_txt01_MEMO').attr("readonly", false).attr("disabled", false);
			}
		});
	
		/* 저장 버튼 */
		$("#btn01_UPDATE").on({
			click: function(){
				var rowData = $("#table1").getRowData($("#table1").getGridParam("selrow"));
				if(rowData != null){
					if(rowData.DEPT_ID != ''){
						confirms("저장 하시겠습니까?", "U");
					}else {
						confirms("저장 하시겠습니까?", "C");
					}
				}
			}
		});

		$("#txt01_DEPT_NM").keypress((e) => {
			if(e.key === "Enter") searchGridData();
		});
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: confirm:
		/* confirm 확인버튼 클릭시 */
		function confirmYes(action){
			if($('#pop01_txt01_DEPT_ID').val() == ''){
				toast("오류", "부서코드를 입력해주세요.", "error");
				return false;
			}
			if($('#pop01_txt01_DEPT_NM').val() == ''){
				toast("오류", "부서명을 입력해주세요.", "error");
				return false;	
			}
			if($('#pop01_sel01_GROUP').val() == ''){
				toast("오류", "부서 그룹을 선택해주세요.", "error");
				return false;
			}
			if($('#pop01_txt01_SORT').val() == ''){
				toast("오류", "정렬순번을 입력해주세요.", "error");
				return false;
			}
			if($('#pop01_sel01_USE').val() == ''){
				toast("오류", "사용유무를 선택해주세요.", "error");
				return false;
			}
			
			if(action == "U"){
				updateGridData("U");
			}else if(action == "C"){
				searchVerification();
			}
		}
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 그리드
		/* jqGrid 셋팅 */
		function setGrid(){
			$('#table1').jqGrid({
				mtype: 'POST'
				, datatype: 'loacl'
				, height : 381
				, jsonReader: {
					repeatitems: false
				}
 				, colNames: langHead
				, colModel: [
					{name: 'DEPT_PID'			, align: 'center'	, width:'10%'	, hidden: false}
					, {name: 'DEPT_ID'			, align: 'center'	, width:'10%'	, hidden: false}
					, {name: 'DEPT_NAME'		, align: 'center'	, width:'20%'	, hidden: false}			
					, {name: 'DEPT_GROUP_CD'	, align: 'center'	, width:'10%'	, hidden: true}				
					, {name: 'DEPT_GROUP'		, align: 'center'	, width:'10%'	, hidden: false}				
					, {name: 'SORT_NO'			, align: 'center'	, width:'5%'	, hidden: false}				
					, {name: 'USE_YN'			, align: 'center'	, width:'5%'	, hidden: false}					
					, {name: 'MEMO'				, align: 'left'		, width:'25%'	, hidden: false}
				]
				, autowidth: false
				, shrinkToFit: false
				, rowNum : 500
				, onSelectRow: function(rowid, status, iCol, cellcontent, e){
					var rowData = $("#table1").getRowData(rowid);
					updateSetGridData(rowData);
				}
			});
			
			searchGridData();
		};

		function updateSetGridData(rowdata){
			$('#pop01_txt01_DEPT_PID').val(rowdata.DEPT_PID);
			$('#pop01_txt01_DEPT_ID').val(rowdata.DEPT_ID);
			$('#pop01_txt01_DEPT_NM').val(rowdata.DEPT_NAME);
			$('#pop01_sel01_GROUP').val(rowdata.DEPT_GROUP_CD);
			$('#pop01_txt01_SORT').val(rowdata.SORT_NO);
			$("#pop01_sel01_USE option").filter(function() {return this.text == rowdata.USE_YN;}).attr('selected', true);
			$('#pop01_txt01_MEMO').val(rowdata.MEMO);
						
			$('#pop01_txt01_DEPT_PID').attr("disabled", false);
			$('#pop01_txt01_DEPT_ID').attr("disabled", true);
			$('#pop01_txt01_DEPT_NM').attr("readonly", false).attr("disabled", false);
			$('#pop01_sel01_GROUP').attr("disabled", false);
			$('#pop01_txt01_SORT').attr("readonly", false).attr("disabled", false);
			$('#pop01_sel01_USE').attr("disabled", false);
			$('#pop01_txt01_MEMO').attr("readonly", false).attr("disabled", false);
		}
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: CRUD
		/* Table 조회 */
		function searchGridData(){
			var searchParam = {
				DEPT_NM	: $("#txt01_DEPT_NM").val()
			};
			
			getAjaxJsonData("cm1100Sel", searchParam, "searchGridDataCallBack");
		};
	
		function searchGridDataCallBack(data){
			$("#table1").clearGridData();
			$("#table1").jqGrid('setGridParam', {
				datatype: 'local',
				data: data
			}).trigger("reloadGrid");

			if(data.length > 0){
				$("#table1_cnt").text(comma(data.length));
			} else {
				$('#table1_cnt').text(0);
			}

			$("#table1").jqGrid('setSelection', 1, true);
			
			var selId = $('#table1').jqGrid('getGridParam', 'selrow') -1;			
			$('#pop01_txt01_DEPT_PID').val(data[selId].DEPT_PID);
			$('#pop01_txt01_DEPT_ID').val(data[selId].DEPT_ID);
			$('#pop01_txt01_DEPT_NM').val(data[selId].DEPT_NAME);
			$('#pop01_sel01_GROUP').val(data[selId].DEPT_GROUP_CD);
			$('#pop01_txt01_SORT').val(data[selId].SORT_NO);
			$('#pop01_sel01_USE').val(data[selId].USE_YN = "사용" ? "Y" : "N");
			$('#pop01_txt01_MEMO').val(data[selId].MEMO);
		};
		
		/* 부서 추가 */
		function updateGridData(action){
			var params = {
					DEPT_PID : $("#pop01_txt01_DEPT_PID").val()
					, DEPT_ID : $("#pop01_txt01_DEPT_ID").val()
					, DEPT_NM : $("#pop01_txt01_DEPT_NM").val()
					, DEPT_GROUP : $("#pop01_sel01_GROUP").val()
					, SORT_NO : $("#pop01_txt01_SORT").val()
					, USE_YN : $("#pop01_sel01_USE").val()
					, MEMO : $("#pop01_txt01_MEMO").val()
			};
			
			getAjaxJsonData("cm1100Save", params, "reLoadCallback");
		};

		/* 추가/수정 후 Table 재조회 */
		function reLoadCallback(data){
			if(data.length == 1){
				toast("오류", "이미 존재하는 부서입니다.", "error");
				return;
			}else{
				popReset("viewForm");
				toast("성공", "정상적으로 저장되었습니다.", "success");
				searchGridData();
			}
		};
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 유효성
		/* 부서코드 중복 체크 */
		function searchVerification(){
			var searchParam = {
					DEPT_ID: $("#pop01_txt01_DEPT_ID").val()
			};
				
			getAjaxJsonData("cm1100Verification", searchParam, "searchVerificationCallBack");
		};
		
		function searchVerificationCallBack(data) {
			var check = parseInt(data[0].DEPT_ID);
			
			if (check > 0){
				toast("오류", "이미 존재하는 부서코드입니다.", "error");
			}else{
				updateGridData("C");
			}
		};
	</script>
</html>