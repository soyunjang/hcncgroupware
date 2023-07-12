<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<body>
		<!-- .contents-wrap 컨텐츠영역 START -->
		<div class="contents-wrap an1000-page">
			<!-- .page-title-wrap 타이블영역 START -->
			<div class="page-title-wrap">
				<div class="page-title">
					<h2>연차등록</h2>
					<ul class="title-btn">
						<li><a href="javascript:reset();" id="btn01_REFLESH" class="btn-refresh" title="검색조건 초기화"></a></li>
					</ul>
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
<!-- 						<dl> -->
<!-- 							<dt>부서</dt> -->
<!-- 							<dd> -->
<!-- 								<input type="text" id="txt01_DEPT" name="txt01_DEPT"> -->
<!-- 							</dd> -->
<!-- 						</dl> -->
<!-- 						<dl> -->
<!-- 							<dt>성명</dt> -->
<!-- 							<dd> -->
<!-- 								<input type="text" id="txt01_USER_NM" name="txt01_USER_NM"> -->
<!-- 							</dd> -->
<!-- 						</dl>				 -->
<!-- 						<dl> -->
<!-- 							<dt>생년월일</dt> -->
<!-- 							<dd> -->
<!-- 								<input type="date" id="date01_BIRTH" name="date01_BIRTH">  -->
<!-- 							</dd> -->
<!-- 						</dl>				 -->
<!-- 						<dl> -->
<!-- 							<dt>직위</dt> -->
<!-- 							<dd> -->
<!-- 								<input type="text" id="txt01_GRADE" name=""> -->
<!-- 							</dd> -->
<!-- 						</dl>				 -->
						<dl>
							<dt>휴가일수</dt>
							<dd>
								<input type="text" id="txt01_HOLIDAY_TOTAL" name="txt01_HOLIDAY_TOTAL" value="${Holiday.HOLIDAY_TOTAL }" readonly="readonly">
							</dd>
						</dl>				
						<dl>
							<dt>사용일수</dt>
							<dd>
								<input type="text" id="txt01_HOLIDAY_USE" name="txt01_HOLIDAY_USE" value="${Holiday.HOLIDAY_USE }" readonly="readonly">
							</dd>
						</dl>				
						<dl>
							<dt>잔여일수</dt>
							<dd>
								<input type="text" id="txt01_HOLIDAY_REMAIN" name="txt01_HOLIDAY_REMAIN" value="${Holiday.HOLIDAY_REMAIN }" readonly="readonly">
							</dd>
						</dl>				
						<dl>
							<dt>공제일수</dt>
							<dd>
								<input type="text" id="txt01_HOLIDAY_DEDUCT" name="txt01_HOLIDAY_DEDUCT" value="${Holiday.HOLIDAY_DEDUCT }" readonly="readonly">
							</dd>
						</dl>				
<!-- 						<dl> -->
<!-- 							<dt>입사일</dt> -->
<!-- 							<dd> -->
<!-- 								<input type="date" id="txt01_ENTER_DT" name="startDate1"> -->
<!-- 							</dd> -->
<!-- 						</dl>				 -->
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
	                        </div>
	                        <div class="btn-right-box">
	                            <ul>
									<li><a href="javascript:void(0);" id="btn01_EXCEL">엑셀</a></li>
	                            	<li><a href="javascript:void(0);" id="btn01_INSERT">추가</a></li>
									<li><a href="javascript:void(0);" id="btn01_UPDATE">신청취소</a></li>
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
									<tr>
										<th class="req">1.휴가종류</th>
										<td>
											<select id="pop01_sel01_TYPE" class="wp100"></select>
										</td>
										<th class="req">2.휴가일수</th>
										<td>
			                            	<input type="number" id="pop01_txt01_COUNT" Placeholder="휴가일수" class="wp100">
										</td>
									</tr>
									<tr>
										<th class="req">3.휴가기간</th>
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
										<th class="req">4.신청일자</th>
										<td>
											<input type="date" id="pop01_date01_REG" name="pop01_date01_START" disabled>
										</td>
										<th class="req">5.비상연락망</th>
										<td>
			                            	<input type="text" id="pop01_txt01_EMERGENCY" Placeholder="비상연락망" class="wp100">
										</td>
									</tr>
									<tr>
										<th class="req">6.담당업무</th>
										<td>
											<input type="text" id="pop01_txt01_TASK" Placeholder="담당업무" class="wp100">
										</td>
										<th class="req">7.업무인수자</th>
										<td>
											<input type="text" id="pop01_txt01_ACQUIRER" Placeholder="업무인수자" class="wp100">
										</td>
									</tr>
									<tr>
										<th class="req">8.사유</th>
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
		<!-- .modal-cont 팝업영역 END -->
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
		var langHead;

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
			
			setGrid();
			init(); //그리드 리사이징
		});

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 버튼
		/* 초기화 버튼 */
		$("#btn01_RESET").on({
			click: function() {
				reset();
			}
		});

		/* 엑셀 버튼 */
		$("#btn01_EXCEL").on({
			click: function(){
				exportExcel("table1", "연차사용내역");
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
				var rowData = $("#table1").getRowData($("#table1").getGridParam("selrow"));
				if(rowData != null){
					checkAction = "U";
					updateGridData(rowData);
					openModalPopup(checkAction);
				}else {
					toast("정보", "선택된 사용자가 없습니다.", "info");
					return false;
				}
			}
		});

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: confirm
		/* confirm 확인버튼 클릭시 */
		function confirmYes(action){
			if(action == "C"){
				var params = {
						EMP_ID : $("#pop01_txt01_EMP_ID").val()
						, USER_ID : $("#pop01_txt01_USER_ID").val()
						, PASSWORD : $("#pop01_txt01_PW").val()
						, START_YMD : $("#pop01_txt01_START_YMD").val()
						, END_YMD : $("#pop01_txt01_END_YMD").val()
						, AUTH_TYPE_CD : $("#pop01_txt01_AUTH_TYPE_CD").val()
						, USE_YN : $("#pop01_sel01_USE_YN").val()
						, MEMO : $("#pop01_txt01_MEMO").val()
				}
			}else if(action == "U"){
				var rowData = $("#table1").getRowData($("#table1").getGridParam("selrow"));
				var params = {
						EMP_ID : rowData.EMP_ID
						, USER_ID : rowData.USER_ID
						, PASSWORD : ""
						, START_YMD : $("#pop01_txt01_START_YMD").val()
						, END_YMD : $("#pop01_txt01_END_YMD").val()
						, AUTH_TYPE_CD : $("#pop01_txt01_AUTH_TYPE_CD").val()
						, USE_YN : $("#pop01_sel01_USE_YN").val()
						, MEMO : $("#pop01_txt01_MEMO").val()
				}
			}
			
			getAjaxJsonData("cm1200Save", params, "reLoadCallback");
			$("#viewForm1").dialog("close");
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
				, multiselect: true
			});
			
			searchGridData();
		};
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: CRUD
		/* Table 조회 */
		function searchGridData(){
			var searchParam = {};
			
			getAjaxJsonData("an1000Sel", searchParam, "searchGridDataCallBack");
		};
		
		function searchGridDataCallBack(data){
			$("#table1").clearGridData();
			$("#table1").jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");
		};

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

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 유효성
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: Popup
		/* 사용자 추가/수정 팝업 */
		function openModalPopup(action){
			// 화면ID, 화면ID사이즈(ex. 6:CM1000 / 13:CM1000_Detail), 팝업ID, 다국어
			var returnPopup = getLangCodePopup("CM1200_Pop1", 11, "viewForm1", "${LANG}");
			var titlePop = returnPopup[0];
			var pop01_btn01_SAVE = returnPopup[1];
			var pop01_btn01_CLOSE = returnPopup[2];
			
			$("#viewForm1").dialog({
				autoOpen: true
				, title: titlePop
				, width: 900
				, modal: true
				, open: function (event, ui) {
					if(action == "C"){
						popReset("viewForm1");			 			

			 			var date = new Date();
						document.getElementById('pop01_date01_REG').valueAsDate = new Date();
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

							if($('#pop01_txt01_COUNT').val() == ''){
								toast("경고", "휴가일수를 선택해주세요.", "error");
								return false;
							}else if($('#pop01_date01_START').val() == ''){
								toast("경고", "휴가시작일을 입력해주세요.", "error");
								return false;
							}else if($('#pop01_date01_END').val() == ''){
								toast("경고", "휴가종료일을 입력해주세요.", "error");
								return false;
							}else if($('#pop01_txt01_EMERGENCY').val() == ''){
								toast("경고", "비상연락망을 입력해주세요.", "error");
								return false;
							}else if($('#pop01_txt01_TASK').val() == ''){
								toast("경고", "담당업무을 입력해주세요.", "error");
								return false;
							}else if($('#pop01_txt01_ACQUIRER').val() == ''){
								toast("경고", "업무인수자을 입력해주세요.", "error");
								return false;
							}else if($('#pop01_txt01_REASON').val() == ''){
								toast("경고", "사유을 입력해주세요.", "error");
								return false;
							}

							const param = {
								HOLIDAY_TYPE : $('#pop01_sel01_TYPE').val(),
								HOLIDAY_CNT : $('#pop01_txt01_COUNT').val(),
								HOLIDAY_START : $('#pop01_date01_START').val(),
								HOLIDAY_END : $('#pop01_date01_END').val(),
								EMERGENCY : $('#pop01_txt01_EMERGENCY').val(),
								TASK : $('#pop01_txt01_TASK').val(),
								ACQUIRER : $('#pop01_txt01_ACQUIRER').val(),
								HOLIDAY_REASON : $('#pop01_txt01_REASON').val()
							}
							getAjaxJsonData('/an1000', param, 'testDataCallBack')
							function testDataCallBack(data){
								console.log(data);
							};

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
	</script>
</html>