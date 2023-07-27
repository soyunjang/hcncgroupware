<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<body>
		<!-- .contents-wrap 컨텐츠영역 START -->
		<div class="contents-wrap sa1000-page">
			<!-- .page-title-wrap 타이블영역 START -->
			<div class="page-title-wrap">
				<div class="page-title">
					<h2>사용자관리</h2>
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
							<dt>사용자ID</dt>
							<dd>
								<input type="text" id="txt01_USER_ID" autocomplete="one-time-code">
							</dd>
						</dl>
						<dl>
							<dt>사용자명</dt>
							<dd>
								<input type="text" id="txt01_USER_NM" autocomplete="one-time-code">
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
				<div class="col col-1 wp100">
					<section>
						<div class="title-wrap">
	                        <div class="title-zone">
	                            <h2 class="title1">사용자 목록</h2>
	                        </div>
	                        <div class="btn-right-box">
	                            <ul>
									<li><a href="javascript:void(0);" id="btn01_EXCEL">엑셀</a></li>
	                            	<li><a href="javascript:void(0);" id="btn01_INSERT">추가</a></li>
									<li><a href="javascript:void(0);" id="btn01_UPDATE">수정</a></li>
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
		<!-- 사용자 추가/수정 팝업 -->
		<div id="viewForm1" style="display: none;">
			<div class="modal-cont">
				<div class="row row-1">
					<div class="col col-1 wp100">
						<section>
							<table class="table-write">
			                    <caption>사용자관리 내역</caption>
			                    <colgroup>
			                        <col class="wp20">
			                        <col class="wp30">
			                        <col class="wp20">
			                        <col class="wp30">
			                    </colgroup>
								<tbody>
									<tr>
										<th class="req">1.사용자ID</th>
										<td>
											<div class="input-btn">
												<input type="text" id="pop01_txt01_USER_ID" Placeholder="사용자ID" class="wp100">
												<a href="javascript:void(0);" id="pop01_btn01_VERIFICATION" class="btn">중복확인</a>
											</div>
										</td>
										<th class="req">2.사용자명</th>
										<td>
											<input type="text" id="pop01_txt01_USER_NM" placeholder="사용자명">
										</td>
									</tr>
									<tr>
										<th>3.상위부서명</th>
										<td>
											<input type="text" id="pop01_txt01_DEPT_PID" placeholder="상위부서코드" class="readonly" readonly="readonly" style="display: none;">
											<input type="text" id="pop01_txt01_PDEPT" placeholder="상위부서명" class="readonly" readonly="readonly">
										</td>										
										<th>4.부서명</th>
										<td>
											<div class="input-srch">
												<input type="text" id="pop01_txt01_DEPT_ID" placeholder="부서코드" class="readonly wp100" readonly="readonly" style="display: none;">
												<input type="text" id="pop01_txt01_DEPT" placeholder="부서명" class="readonly wp100" readonly="readonly">
												<a href="javascript:void(0);" id="pop01_btn01_DEPT" class="btn-srch"></a>
											</div>
										</td>										
									</tr>
									<tr>
										<th>5.직급</th>
										<td>
			                            	<select id="pop01_sel01_GRADE"></select>
										</td>
										<th>6.입사일자</th>
										<td>
											<input type="date" id="pop01_date01_ENTER" Placeholder="입사일자" size="12">
										</td>
									</tr>
									<tr>
										<th class="req">7.권한그룹</th>
										<td>
			                            	<div class="input-srch">
												<input type="text" id="pop01_txt01_AUTH_TYPE_CD" placeholder="권한그룹코드" class="readonly wp100" readonly="readonly" style="display: none;">
												<input type="text" id="pop01_txt01_AUTH_TYPE" placeholder="권한그룹" class="readonly wp100" readonly="readonly">
												<a href="javascript:void(0);" id="pop01_btn01_AUTH_TYPE" class="btn-srch"></a>
											</div>
										</td>
										<th class="req">8.사용유무</th>
										<td>
											<select id="pop01_sel01_USE"></select>
										</td>
									</tr>
									<tr>
										<th>9.이메일</th>
										<td colspan="3">
											<input type="text" id="pop01_txt01_EMAIL" Placeholder="이메일">
										</td>
									</tr>
									<tr>
										<th>10.전화번호</th>
										<td>
											<input type="text" id="pop01_txt01_PHONE" Placeholder="전화번호">
										</td>
										<th>11.생일</th>
										<td>
											<input type="date" id="pop01_txt01_BIRTHDAY" Placeholder="생일" size="12">
										</td>
									</tr>
									<tr>
										<th>12.비고</th>
										<td colspan="3">
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
		
		<!-- 부서 조회 팝업 -->
		<div id="viewForm2" style="display: none;">
			<div class="modal-cont modal-cont2">
				<div class="search-zone">
					<div class="search-wrap">
						<div class="sch-box">
							<dl class="dl-2n">
								<dt>부서명</dt>
								<dd>
									<input type="text" id="pop02_txt01_DEPT" class="w200">
								</dd>
							</dl>
						</div>
						<div class="srch-btn wp40">
			                <ul>
			                    <li><a href="javascript:searchGridDataDept();" class="btn-search">검색</a></li>
			                </ul>
			            </div>
					</div>
				</div>
				<div class="row row-1 h300">
					<div class="col col-1 wp100">
						<section>
							<div class="table-wrap hp100">
								<table id="table2"></table>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 권한그룹 조회 팝업 -->
		<div id="viewForm3" style="display: none;">
			<div class="modal-cont">
				<div class="search-zone">
					<div class="search-wrap">
						<div class="sch-box">
							<dl class="dl-4n">
								<dt>권한분류명</dt>
								<dd>
									<select id="pop03_sel01_AUTH_TYPE"></select>
								</dd>
							</dl>
						</div>
						<div class="srch-btn wp40">
			                <ul>
			                    <li><a href="javascript:searchGridDataAuth();" class="btn-search">검색</a></li>
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
	</body>
	
	<script type="text/javascript">
		/**
		 * CM1200	사용자관리관리
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
		var langPop1;
		var langPop2;

		/* 변수 선언 */
		var checkAction = "";
		var checkUserID = false;
		var checkAuthChange = ""; // 권한그룹 변경 확인
		
		/* 공통코드_콤보박스 */ 
		commonCodeSelectAdd("pop01_sel01_GRADE", getCommonCode('ROLE'), 'N');
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
			langHead = getLangCode("CM1200", 6, "${LANG}");
			langPop1 = getLangCodeDetail("CM1200_Pop1", 11, "${LANG}");
			langPop2 = getLangCodeDetail("CM1200_Pop2", 11, "${LANG}");
			
			setGrid();
			init(); //그리드 리사이징
		});

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 버튼
		/* 엑셀 버튼 */
		$("#btn01_EXCEL").on({
			click: function(){
				exportExcel("table1", "사용자 관리");
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

		/* 사용자 추가/수정 팝업의 부서팝업 버튼 */
		$("#pop01_btn01_DEPT").on({
			click: function(e){
				e.preventDefault();
				openModalPopup_Dept();
			}
		});
		
		/* 사용자 추가/수정 팝업의 권한그룹팝업 버튼 */
		$("#pop01_btn01_AUTH_TYPE").on({
			click: function(e){
				e.preventDefault();
				openModalPopup_Auth();
			}
		});

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: confirm
		/* confirm 확인버튼 클릭시 */
		function confirmYes(action){
			var checkAuth = "";
			
			if($("#table1").getRowData($("#table1").getGridParam("selrow")).AUTH_TYPE_CD != $('#pop01_txt01_AUTH_TYPE_CD').val()){
				checkAuth = "CHANGEAHTU";
			}
			
			var params = {
					USER_ID : $("#pop01_txt01_USER_ID").val()
					, USER_NM : $("#pop01_txt01_USER_NM").val()
					, PDEPT_CD : $("#pop01_txt01_DEPT_PID").val()
					, DEPT_CD : $("#pop01_txt01_DEPT_ID").val()
					, GRADE_CD : $("#pop01_sel01_GRADE").val()
					, ENTER_DT : $("#pop01_date01_ENTER").val()
					, AUTH_TYPE_CD : $("#pop01_txt01_AUTH_TYPE_CD").val()
					, USE_YN : $("#pop01_sel01_USE").val()
					, EMAIL : $("#pop01_txt01_EMAIL").val()
					, PHONE_NUM : $("#pop01_txt01_PHONE").val()
					, BIRTHDAY : $("#pop01_txt01_BIRTHDAY").val()
					, MEMO : $("#pop01_txt01_MEMO").val()
					, CHANGE : checkAuth
					, ACTION : action
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
				, height : 540
				, jsonReader: {
					repeatitems: false
				}
				, colNames: langHead
				, colModel: [
					{name: 'USER_ID'			, align: 'center'	, width: '8%'	, hidden: false}					
					, {name: 'USER_NM'			, align: 'center'	, width: '9%'	, hidden: false}				
					, {name: 'PDEPT_CD'			, align: 'center'	, width: '0%'	, hidden: true}				
					, {name: 'PDEPT_NM'			, align: 'center'	, width: '12%'	, hidden: false}				
					, {name: 'DEPT_CD'			, align: 'center'	, width: '0%'	, hidden: true}				
					, {name: 'DEPT_NM'			, align: 'center'	, width: '12%'	, hidden: false}				
					, {name: 'GRADE_CD'			, align: 'center' 	, width: '0%'	, hidden: true}									
					, {name: 'GRADE_NM'			, align: 'center' 	, width: '6%'	, hidden: false}									
					, {name: 'ENTER_DT'			, align: 'center' 	, width: '9%'	, hidden: false}									
					, {name: 'BIRTHDAY'			, align: 'center'	, width: '9%'	, hidden: false}					
					, {name: 'EMAIL'			, align: 'left'		, width: '12%'	, hidden: false}				
					, {name: 'PHONE_NUM'		, align: 'left'		, width: '12%'	, hidden: false}				
					, {name: 'USE_YN'			, align: 'left' 	, width: '6%'	, hidden: false}
					, {name: 'AUTH_TYPE_CD'		, align: 'left'		, width: '0%'	, hidden: true}					
					, {name: 'AUTH_TYPE_NAME'	, align: 'left'		, width: '7%'	, hidden: false}					
					, {name: 'MEMO'				, align: 'left'		, width: '13%'	, hidden: false}
				]
				, autowidth: false
				, shrinkToFit: false
				, rowNum : 5000
				, ondblClickRow : function(rowid){
					var rowdata = $("#table1").getRowData(rowid);
					updateGridData(rowdata);
					openModalPopup("U");
				}
			});
			
			searchGridData();
			
			$("#table2").jqGrid({
				mtype : 'POST'
				, datatype : 'local'
				, jsonReader: {
					repeatitems: false 
				}
				, colNames: langPop1
				, colModel: [
					{name: 'DEPT_PID'		, align: 'center'	, width: '0%'	, hidden: true}
					, {name: 'DEPT_PNM'		, align: 'center'	, width: '15%'	, hidden: false}
					, {name: 'DEPT_ID'		, align: 'center'	, width: '0%'	, hidden: true}
					, {name: 'DEPT_NM'		, align: 'center'	, width: '15%'	, hidden: false}
					, {name: 'MEMO'			, align: 'left'		, width: '20%'	, hidden: false}
				]
				, autowidth: true
				, shrinkToFit: false
				, ondblClickRow : function(rowid){
					var rowdata = $("#table2").getRowData(rowid);
					
					$("#pop01_txt01_DEPT_PID").val(rowdata.DEPT_PID);
		 			$("#pop01_txt01_PDEPT").val(rowdata.DEPT_PNM);
		 			$("#pop01_txt01_DEPT_ID").val(rowdata.DEPT_ID);
		 			$("#pop01_txt01_DEPT").val(rowdata.DEPT_NM);
		 			
					$("#viewForm2").dialog("close");
				}
			});

			$("#table3").jqGrid({
				mtype : 'POST'
				, datatype : 'local'
				, jsonReader: {
					repeatitems: false 
				}
				, colNames: langPop2
				, colModel: [
					{name:'AUTH_TYPE_CD'		, align: 'center'	, width: '200%'	, hidden: true}
					, {name: 'AUTH_TYPE_NAME'	, align: 'center'	, width: '200%'	, hidden: false}
					, {name: 'MEMO'				, align: 'left'		, width: '200%'	, hidden: false}
				]
				, autowidth: true
				, shrinkToFit: false
				, ondblClickRow : function(rowid){
					var rowdata = $("#table3").getRowData(rowid);
					
					$("#pop01_txt01_AUTH_TYPE_CD").val(rowdata.AUTH_TYPE_CD);
					$("#pop01_txt01_AUTH_TYPE").val(rowdata.AUTH_TYPE_NAME);
					
					$("#viewForm3").dialog("close");
				}
			});
		};

		/* 그리드row 더블클릭 / 수정버튼 클릭시 팝업에 값 세팅 */
		function updateGridData(selRowData){
 			$("#pop01_txt01_USER_ID").val(selRowData.USER_ID);
 			$("#pop01_txt01_USER_NM").val(selRowData.USER_NM);
 			$("#pop01_txt01_DEPT_PID").val(selRowData.PDEPT_CD);
 			$("#pop01_txt01_PDEPT").val(selRowData.PDEPT_NM);
 			$("#pop01_txt01_DEPT_ID").val(selRowData.DEPT_CD);
 			$("#pop01_txt01_DEPT").val(selRowData.DEPT_NM);
 			$("#pop01_sel01_GRADE").val(selRowData.GRADE_CD);
 			$("#pop01_date01_ENTER").val(selRowData.ENTER_DT);
 			$("#pop01_txt01_AUTH_TYPE_CD").val(selRowData.AUTH_TYPE_CD);
 			$("#pop01_txt01_AUTH_TYPE").val(selRowData.AUTH_TYPE_NAME);
 			$("#pop01_sel01_USE option").filter(function() {return this.text == selRowData.USE_YN;}).attr('selected', true); 			
 			$("#pop01_txt01_EMAIL").val(selRowData.EMAIL);
 			$("#pop01_txt01_PHONE").val(selRowData.PHONE_NUM);
 			$("#pop01_txt01_BIRTHDAY").val(selRowData.BIRTHDAY);
 			$("#pop01_txt01_MEMO").val(selRowData.MEMO);
 			
 			$('#pop01_txt01_USER_ID').attr("disabled", true);			 			
 			$('#pop01_txt01_DEPT_PID').attr("disabled", true);	
 			$('#pop01_txt01_DEPT').attr("disabled", true);	
 			$('#pop01_txt01_AUTH_TYPE').attr("disabled", true);	
		}
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: CRUD
		/* Table 조회 */
		function searchGridData(){
			var searchParam = {
				USER_ID	: $("#txt01_USER_ID").val()
				, USER_NM : $("#txt01_USER_NM").val()
			};
			
			getAjaxJsonData("cm1200Sel", searchParam, "searchGridDataCallBack");
		};
		
		function searchGridDataCallBack(data){
			$("#table1").clearGridData();
			$("#table1").jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");

			$("#table1").jqGrid('setSelection', 1, true);
		};

		/* 추가/수정 후 Table 재조회 */
		function reLoadCallback(data){
			if(data.length == 1){
				toast("경고", "이미 존재하는 사용자입니다.", "error");
				return false;
			}else{
				if(checkAuthChange == "insert"){
					insertAuthChage("권한부여", "중");
				}else if(checkAuthChange == "change"){
					insertAuthChage("권한변경", "중");
				} 
				
				popReset("viewForm1");
				toast("성공", "정상적으로 저장되었습니다.", "success");
				searchGridData();
			}
		}

		/* 권한그룹 변경 로그 저장 */
		function insertAuthChage(name, svry){
			var evntNm = name;
			var evntSvry = svry;
			
			var searchParam = {
					EVNT_NM : evntNm
					, EVNT_SVRY : evntSvry
			};
			
			getAjaxJsonData("insertAuthChange", searchParam, "");
		}

		/* 사용자 추가/수정 팝업의 부서 Table 조회  */
		function searchGridDataDept(){
			var searchParam = {
					DEPT_NM : $("#pop02_txt01_DEPT").val()
			};
			
			getAjaxJsonData("cm1200DeptSel", searchParam, "searchGridDataDeptCallBack");
		};
		
		function searchGridDataDeptCallBack(data){
			$("#table2").clearGridData();
			$('#table2').jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");
		};
		
		/* 사용자 추가/수정 팝업의 권한그룹 Table 조회  */
		function searchGridDataAuth(){
			var searchParam = {
					AUTH_TYPE_CD : $("#pop03_sel01_AUTH_TYPE").val()
			};
			
			getAjaxJsonData("cm1200AuthSel", searchParam, "searchGridDataAuthCallBack");
		};
		
		function searchGridDataAuthCallBack(data){
			$("#table3").clearGridData();
			$('#table3').jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");
		};
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 유효성
		/* 사용자ID 중복확인 */
		$("#pop01_btn01_VERIFICATION").on({
			click: function() {
				if($("#pop01_txt01_USER_ID").val() == ''){
					toast("경고", "사용자ID를 입력해주세요.", "error");
					return false;
				}else{
					searchVerificationUserID();
				}
			}
		});

		function searchVerificationUserID(){
			var searchParam = {
					USER_ID: $("#pop01_txt01_USER_ID").val()
			};
				
			getAjaxJsonData("cm1200Verification", searchParam, "searchVerificationUserIDCallBack");
		};

		function searchVerificationUserIDCallBack(data) {
			if(checkAction == "C"){
				var check = parseInt(data[0].USER_ID);
				
				if (check > 0){
					checkUserID = false;
					toast("경고", "이미 존재하는 아이디입니다.", "error");
					return false;
				}else{
					checkUserID = true;
					toast("성공", "사용 가능한 사용자ID입니다.", "success");
				}
			}else if(checkAction == "U"){
				checkUserID = true;
			}
		};
		
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

			 			$('#pop01_txt01_USER_ID').attr("disabled", false);
						$('#pop01_btn01_VERIFICATION').css("display", "block");
						$("#pop01_sel01_USE").find("option:eq(1)").prop("selected", "selected");
						
						document.getElementById('pop01_date01_ENTER').valueAsDate = new Date();
					}
					else if(action == "U"){
						$('#pop01_btn01_VERIFICATION').css("display", "none");
					}
				}
				, close: function () {
					$(this).dialog("close");
				}
				, buttons: [
					{
						text : pop01_btn01_SAVE,
	                    click : function(){
							if($('#pop01_txt01_USER_ID').val() == ''){
								toast("경고", "사용자ID를 입력해주세요.", "error");
								return false;	
							}else if($('#pop01_txt01_AUTH_TYPE').val() == ''){
								toast("경고", "권한그룹을 선택해주세요.", "error");
								return false;
							}else {
								if(action == "C"){
									if(!checkUserID){
										toast("경고", "사용자ID 중복확인을 해주세요.", "error");
										return false;
									}
									confirms("저장 하시겠습니까?", "C");
								}
								else if(action == "U"){
									confirms("저장 하시겠습니까?", "U");
								}
							}
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

		/* 부서/사용자 조회 팝업 */
		function openModalPopup_Dept(){
			// 화면ID, 화면ID사이즈(ex. 6:CM1000 / 13:CM1000_Detail), 팝업ID, 다국어
			var returnPopup = getLangCodePopup("CM1200_Pop2", 11, "viewForm2", "${LANG}");
			var titlePop = returnPopup[0];
			var pop02_btn01_FINISH = returnPopup[1];
			var pop02_btn01_CLOSE = returnPopup[2];
			
			$("#viewForm2").dialog({
				autoOpen: true
				, title: titlePop
				, width: 675
				, modal: true
				, open: function (event, ui) {
					commonCodeSelectAdd("pop02_sel01_DEPT_CD", getCommonCode('DEPT'), 'Y');
					searchGridDataDept();
				}
				, close: function () {
					$(this).dialog("close");
				}
				, buttons: [
					{
						text : pop02_btn01_FINISH,
	                    click : function(){
							var rowid = $("#table2").getGridParam("selrow");
							if(rowid < 1){
								toast("정보", "선택된 부서가 없습니다.", "info");
								return false;
							} else {
								var rowdata = $("#table2").getRowData(rowid);
								
								$("#pop01_txt01_DEPT_PID").val(rowdata.DEPT_PID);
					 			$("#pop01_txt01_PDEPT").val(rowdata.DEPT_PNM);
					 			$("#pop01_txt01_DEPT_ID").val(rowdata.DEPT_ID);
					 			$("#pop01_txt01_DEPT").val(rowdata.DEPT_NM);
							}
							
							$(this).dialog("close");
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

		/* 권한그룹 선택 팝업 */
		function openModalPopup_Auth(){
			// 화면ID, 화면ID사이즈(ex. 6:CM1000 / 13:CM1000_Detail), 팝업ID, 다국어
			var returnPopup = getLangCodePopup("CM1200_Pop3", 11, "viewForm3", "${LANG}");
			var titlePop = returnPopup[0];
			var pop03_btn01_FINISH = returnPopup[1];
			var pop03_btn01_CLOSE = returnPopup[2];
			
			$("#viewForm3").dialog({
				autoOpen: true
				, title: titlePop
				, width: 485
				, modal: true
				, open: function (event, ui) {
					commonAuthSelectAdd("pop03_sel01_AUTH_TYPE", getAuthCode(), 'Y');
					searchGridDataAuth();
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
								toast("정보", "선택된 권한그룹이 없습니다.", "info");
								return false;
							} else {
								var rowdata = $("#table3").getRowData(rowid);
								
								$("#pop01_txt01_AUTH_TYPE_CD").val(rowdata.AUTH_TYPE_CD);
								$("#pop01_txt01_AUTH_TYPE").val(rowdata.AUTH_TYPE_NAME);
							}
							
							checkAuthChange = "change";	// change : 권한변경 버튼 클릭 후 완료 버튼 클릭
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
			}).css("z-index", 1000).prev(".ui-dialog-titlebar").css("background","#266f80").css("color","#fff");
		};
	</script>
</html>