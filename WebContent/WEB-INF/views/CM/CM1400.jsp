<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<body>
		<!-- .contents-wrap 컨텐츠영역 START -->
		<div class="contents-wrap cm1400-page">
			<!-- .page-title-wrap 타이블영역 START -->
			<div class="page-title-wrap">
				<div class="page-title">
					<h2>메뉴관리</h2>
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
		                   <dt>메뉴ID</dt>
		                   <dd>
		                       <input type="text" id="txt01_MENU_ID">
		                   </dd>
		               </dl>
		               <dl>
		                   <dt>메뉴명</dt>
		                   <dd>
		                       <input type="text" id="txt01_MENU_NM">
		                   </dd>
		               </dl>
						<dl>
		                   <dt>메뉴그룹</dt>
		                   <dd>
		                       <select id="sel01_MENU_GROUP"></select>
		                   </dd>
						</dl>
						<dl>
							<dt>프로그램ID</dt>
							<dd>
								<input type="text" id="txt01_PROGRAM_ID">
							</dd>
						</dl>
						<dl>
							<dt>프로그램경로</dt>
							<dd>
								<input type="text" id="txt01_PROGRAM_PATH">
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
			<div class="row row-1 row-wrap-src-162">
				<div class="col col-1 wp100">
					<section>
						<div class="title-wrap">
							<div class="title-zone">
								<h2 class="title1">메뉴 관리 목록</h2>
							</div>
							<div class="btn-right-box">
								<ul>
									<li><a href="javascript:void(0);" id="btn01_EXCEL">엑셀</a></li>
									<li><a href="javascript:void(0);" id="btn01_INSERT">추가</a></li>
									<li><a href="javascript:void(0);" id="btn01_UPDATE">저장</a></li>
								</ul>
							</div>
						</div>
						<div id = "table-wrap" class="table-wrap">
							<table id="table1"></table>
						</div>
					</section>
				</div>
			</div>
			<!-- .title-wrap TABLE영역 END -->
			
			<!-- .table-write TABLE영역 START -->
			<div class="row row-2">
				<div class="col col-1 wp100">
					<section>
						<table class="table-write">
			        		<caption>메뉴 마스터</caption>
					        <colgroup>
					            <col class="wp8">
					            <col class="wp15">
					            <col class="wp8">
					            <col class="wp15">
					            <col class="wp8">
					            <col class="wp15">
					            <col class="wp8">
					            <col class="wp10">
					        </colgroup>
							<tbody>
					            <tr>
					            	<th>1.상위메뉴ID</th>
					                <td>
					                	<input type="text" id="pop01_txt01_MENU_PID"/>
					                </td>
					                <th class="req">2.메뉴ID</th>
					                <td>
					                	<div class="input-btn">
						                	<input type="text" id="pop01_txt01_MENU_ID" maxlength='5' placeholder="5자리까지 입력 가능합니다." style="text-transform: uppercase;"/>
					    					<a href="javascript:void(0);" id="pop01_btn01_VERIFICATION" class="btn">중복확인</a>
					                		<a href="javascript:void(0);" id="pop01_btn01_CHANGE" class="btn">변경</a>
					                	</div>
					                </td>
					                <th class="req">3.메뉴명</th>
					                <td>
					                	<input type="text" id="pop01_txt01_MENU_NM"/>
					                </td>     		                
					                <th class="req">4.사용유무</th>
					                <td>
					                	<select id="pop01_sel01_USE_YN" class="wp100"></select>
					                </td> 
					            </tr>
					            <tr>
					                <th class="req">5.프로그램ID</th>
					                <td>
					                	<input type="text" id="pop01_txt01_PROG_ID" maxlength='6' placeholder="6자리까지 입력 가능합니다." style="text-transform: uppercase;"/>
					                </td> 
					                <th>6.프로그램경로</th>
					                <td>
					                	<input type="text" id="pop01_txt01_PROG_PATH" style="text-transform: lowercase;"/>
					                </td>
					                <th class="req">7.메뉴그룹</th>
					                <td>
					                	<select id="pop01_sel01_MENU_GROUP" class="wp100"></select>
					                </td>  
					                <th class="req">8.정렬순번</th>
					                <td>
					                	<input type="text" id="pop01_txt01_SORT" />
					                </td>
					            </tr>
					            <tr>
					            	<th>9.메뉴 설명</th>
					                <td colspan="3">
					                	<input type="text" id="pop01_txt01_MENU_DESC"/>
					                </td>     
					                <th>10.비고</th>
					                <td colspan="3">
					                	<input type="text" id="pop01_txt01_MEMO" class="table-write">
					                </td>
					            </tr>    	            
					        </tbody>
					    </table>
					</section>
				</div>
			</div>
			<!-- .table-write TABLE영역 END -->
		</div>
		<!-- .contents-wrap 컨텐츠영역 END -->
	</body>
	
	<script type="text/javascript">
		/**
		 * CM1400	메뉴관리
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
		
		/* 변수 선언 */
		var verification = 0; // 중복확인 여부 CHECK 지역변수 (0: 중복확인 안눌려짐, 1: 중복확인 버튼 눌려짐)
	
		/* 공통코드_콤보박스 */ 
		// 검색조건
		commonCodeSelectAdd("sel01_MENU_GROUP", getCommonCode('MGROUP'), 'Y');	// 메뉴그룹
		commonCodeSelectAdd("sel01_USE_YN", getCommonCode('USE'), 'N');			// 사용유무
		
		// 추가 정보 입력
		commonCodeSelectAdd("pop01_sel01_MENU_GROUP", getCommonCode('MGROUP'), 'N');	// 메뉴그룹
		commonCodeSelectAdd("pop01_sel01_USE_YN", getCommonCode('USE'), 'N');			// 사용유무
		
		/* Document가 로드되었을 때 실행되는 코드 */
		$(document).ready(function() {
			function init() {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
			}
			
			jQuery(window).on('resize.jqGrid', function () {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
			});
	
			$("#sel01_USE_YN").find("option:eq(1)").prop("selected", "selected");
 			$('#pop01_btn01_CHANGE').css("display", "none");
			$('#pop01_btn01_VERIFICATION').css("display", "block");

			// 화면ID, 화면ID사이즈(6:CM1000/13:CM1000_Detail), 다국어
			langHead = getLangCode("CM1400", 6, "${LANG}");
			
			setGrid();
			init(); //그리드 리사이징
		});
			
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 버튼
		/* 엑셀 버튼 */
		$("#btn01_EXCEL").on({
			click: function() {
				exportExcel("table1", "메뉴 관리 목록");
			}
		});
			
		/* 검색 버튼 */
		$("#btn01_SEARCH").on({
			click: function() {
				searchGridDataHead();
			}
		});
			
		//  그리드 데이터 『추가』 Button Click Event.
		$("#btn01_INSERT").on({
			click: function() {
				$("#table1").jqGrid("addRowData", $("#table1").getGridParam("reccount") + 1, {}, 'last');
				$('#pop01_txt01_MENU_PID').val("");
				$('#pop01_txt01_MENU_ID').val("");
				$('#pop01_txt01_MENU_NM').val("");
				$('#pop01_sel01_USE_YN').val("Y");
				$('#pop01_txt01_PROG_ID').val("");
				$('#pop01_txt01_PROG_PATH').val("");
				$('#pop01_sel01_MENU_GROUP').val("GRP01");
				$('#pop01_txt01_SORT').val("");
				$('#pop01_txt01_MENU_DESC').val("");
				$('#pop01_txt01_MEMO').val("");
				
				$('#pop01_txt01_MENU_PID').attr("readonly", false).attr("disabled", false);
				$('#pop01_txt01_MENU_ID').attr("readonly", false).attr("disabled", false);
				$('#pop01_txt01_MENU_NM').attr("readonly", false).attr("disabled", false);
				$('#pop01_sel01_USE_YN').attr("disabled", false);
				$('#pop01_txt01_PROG_ID').attr("readonly", false).attr("disabled", false);
				$('#pop01_txt01_PROG_PATH').attr("readonly", false).attr("disabled", false);
				$('#pop01_sel01_MENU_GROUP').attr("disabled", false);
				$('#pop01_txt01_SORT').attr("disabled", false);
				$('#pop01_txt01_MENU_DESC').attr("readonly", false).attr("disabled", false);
				$('#pop01_txt01_MEMO').attr("readonly", false).attr("disabled", false);
				
				$('#pop01_btn01_VERIFICATION').css("display", "block");
				$('#pop01_btn01_CHANGE').css("display", "none");
			}
		});
			
		/* 저장 버튼 */
		$("#btn01_UPDATE").on({
			click: function() {
				confirms("저장하시겠습니까?", "S");
			}
		});
			
		/* 메뉴ID 중복확인 버튼 */
		$("#pop01_btn01_VERIFICATION").on({
			click: function() {
				if($("#pop01_txt01_MENU_ID").val() == ''){
					toast("경고", "메뉴ID를 입력해주세요", "error");
					return;
				}
				
				searchVerification();
			}
		});
			
		/* 메뉴ID 변경 버튼 */
		$("#pop01_btn01_CHANGE").on({
			click: function() {
				if($("#pop01_txt01_MENU_ID").val() == ''){
					toast("경고", "메뉴ID를 입력해주세요", "error");
					return;
				}
				
				changeGridData();
			}
		});
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: confirm:
		/* confirm 확인버튼 클릭시 */
		function confirmYes(action){
			if(verification == 1){	
				if(action == "S"){
					if($('#pop01_txt01_MENU_ID').val() == ''){
						toast("오류", "메뉴ID를 입력해주세요.", "error");
						return;
					}
					if($('#pop01_txt01_MENU_NM').val() == ''){
						toast("오류", "메뉴명을 입력해주세요.", "error");
						return;
					}
					if($('#pop01_sel01_USE_YN').val() == ''){
						toast("오류", "사용유무를 선택해주세요.", "error");
						return;
					}					
					if($('#pop01_txt01_PROG_ID').val() == ''){
						toast("오류", "프로그램ID를 입력해주세요.", "error");
						return;
					}
					if($('#pop01_sel01_MENU_GROUP').val() == ''){
						toast("오류", "메뉴그룹을 선택해주세요.", "error");
						return;
					}
					if($('#pop01_txt01_SORT').val() == ''){
						toast("오류", "정렬순번을 입력해주세요.", "error");
						return;
					}
				}
			} else if($("#table1").getRowData($("#table1").getGridParam("selrow")).MENU_ID != $('#pop01_txt01_MENU_ID').val()){
				toast("경고", "메뉴ID 중복확인을 해주세요.", "error");
				return;
			}
			
			searchGridDetailSave();
		};
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 그리드
		/* jqGrid 셋팅 */
		function setGrid(){
			$("#table1").jqGrid({
				mtype: 'POST'
				, datatype: 'local'
				, jsonReader: {
					repeatitems: false
				}
				, colNames: langHead
				, colModel: [
					{name:'MENU_PID'		, align:'center'	, width: '5%'}
					, {name:'MENU_ID'		, align:'center'	, width: '5%'}
					, {name:'MENU_NAME'		, align:'left'		, width: '15%'}
					, {name:'MENU_GROUP'	, align:'center'	, width: '5%'}
					, {name:'MENU_DES'		, align:'center'	, width: '20%'}
					, {name:'PROG_ID'		, align:'center'	, width: '8%'}
					, {name:'PROG_PATH'		, align:'center'	, width: '8%'}
					, {name:'SORT_NO'		, align:'center'	, width: '5%'}
					, {name:'USE_YN'		, align:'center'	, width: '5%'}
					, {name:'MEMO'			, align:'left'		, width: '20%'}
				]
				, autowidth: true
				, shrinkToFit: false
				, rowNum : 5000
			 	, onSelectRow: function(rowid, status, iCol, cellcontent, e){
			 		var rowData = $("#table1").getRowData(rowid);
			 		updateGridData(rowData);
				}
			});
			
			searchGridDataHead();
		};
		
		function updateGridData(rowdata){
			$('#pop01_txt01_MENU_PID').val(rowdata.MENU_PID);
			$('#pop01_txt01_MENU_ID').val(rowdata.MENU_ID);
			$('#pop01_txt01_MENU_NM').val(rowdata.MENU_NAME);
	 		$("#pop01_sel01_USE_YN option").filter(function() {return this.text == rowdata.USE_YN;}).attr('selected', true);
			$('#pop01_txt01_PROG_ID').val(rowdata.PROG_ID);
			$('#pop01_txt01_PROG_PATH').val(rowdata.PROG_PATH);
	 		$('#pop01_sel01_MENU_GROUP').val(rowdata.MENU_GROUP);
			$('#pop01_txt01_SORT').val(rowdata.SORT_NO);
			$('#pop01_txt01_MENU_DESC').val(rowdata.MENU_DES);
			$('#pop01_txt01_MEMO').val(rowdata.MEMO);
			
			$('#pop01_txt01_MENU_PID').attr("readonly", false).attr("disabled", false);
			$('#pop01_txt01_MENU_ID').attr("readonly", true).attr("disabled", true);
			$('#pop01_txt01_MENU_NM').attr("readonly", false).attr("disabled", false);
			$('#pop01_sel01_USE_YN').attr("disabled", false);
			$('#pop01_txt01_PROG_ID').attr("readonly", false).attr("disabled", false);
			$('#pop01_txt01_PROG_PATH').attr("readonly", false).attr("disabled", false);
			$('#pop01_sel01_MENU_GROUP').attr("disabled", false);
			$('#pop01_txt01_SORT').attr("disabled", false);
			$('#pop01_txt01_MENU_DESC').attr("readonly", false).attr("disabled", false);
			$('#pop01_txt01_MEMO').attr("readonly", false).attr("disabled", false);
			
			$('#pop01_btn01_VERIFICATION').css("display", "none");
			$('#pop01_btn01_CHANGE').css("display", "block");
		}

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: CRUD
		/* Table 조회 */
		function searchGridDataHead(){
			var searchParam = {
					MENU_ID: $('#txt01_MENU_ID').val()
			        , MENU_NAME: $('#txt01_MENU_NM').val()
			        , MENU_GROUP: $("#sel01_MENU_GROUP option:selected").val()
			        , PROG_ID: $('#txt01_PROGRAM_ID').val()
			        , PROG_PATH: $('#txt01_PROGRAM_PATH').val()
			        , USE_YN : $("#sel01_USE_YN option:selected").val()
			};
			
			getAjaxJsonData("cm1400Sel", searchParam, "searchGridDataHeadCallBack");
		};
		
		function searchGridDataHeadCallBack(data) {		
			$("#table1").clearGridData();
			$('#table1').jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");

			$("#table1").jqGrid('setSelection', 1, true);

// 			$('#pop01_txt01_MENU_PID').val("");
// 			$('#pop01_txt01_MENU_ID').val("");
// 			$('#pop01_txt01_MENU_NM').val("");
// 			$('#pop01_sel01_USE_YN').val("Y");
// 			$('#pop01_txt01_PROG_ID').val("");
// 			$('#pop01_txt01_PROG_PATH').val("");
// 			$("#pop01_sel01_MENU_GROUP option:eq(0)").prop("selected", true);
// 			$('#pop01_txt01_SORT').val("");
// 			$('#pop01_txt01_MENU_DESC').val("");
// 			$('#pop01_txt01_MEMO').val("");
			
// 			$('#pop01_txt01_MENU_PID').attr("disabled", true);
// 			$('#pop01_txt01_MENU_ID').attr("disabled", true);
// 			$('#pop01_txt01_MENU_NM').attr("disabled", true);
// 			$('#pop01_sel01_USE_YN').attr("disabled", true);
// 			$('#pop01_txt01_PROG_ID').attr("disabled", true);
// 			$('#pop01_txt01_PROG_PATH').attr("disabled", true);
// 			$('#pop01_sel01_MENU_GROUP').attr("disabled", true);
// 			$('#pop01_txt01_SORT').attr("disabled", true);
// 			$('#pop01_txt01_MENU_DESC').attr("disabled", true);
// 			$('#pop01_txt01_MEMO').attr("disabled", true);
			
// 			$('#pop01_btn01_VERIFICATION').css("display", "block");
// 			$('#pop01_btn01_CHANGE').css("display", "none");
		};
			
		/* 메뉴 마스터 추가 */
		function searchGridDetailSave(){
			var saveParam = {
					MENU_PID: $("#pop01_txt01_MENU_PID").val()
					, MENU_ID: $("#pop01_txt01_MENU_ID").val()
				    , MENU_NAME: $("#pop01_txt01_MENU_NM").val()
				    , USE_YN: $("#pop01_sel01_USE_YN").val()
				    , PROG_ID: $("#pop01_txt01_PROG_ID").val()
				    , PROG_PATH: $("#pop01_txt01_PROG_PATH").val()
				    , MENU_GROUP: $("#pop01_sel01_MENU_GROUP").val()
				    , SORT_NO: $("#pop01_txt01_SORT").val()
				    , MENU_DESC: $("#pop01_txt01_MENU_DESC").val()
				    , MEMO: $("#pop01_txt01_MEMO").val()
			};
			
			getAjaxJsonData("cm1400Save", saveParam, "searchGridDetailSaveCallBack");
		};
			
		function searchGridDetailSaveCallBack(data) {
			if(data.length == 1){
				toast("오류", "이미 존재하는 메뉴입니다.", "error");
				return;
			}else{
				toast("성공", "정상적으로 저장되었습니다.", "success");
				setGrid();	
			}
		};
	
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 유효성
		/* 메뉴 ID 중복확인 */
		function searchVerification(){
			var searchParam = {
					MENU_ID: $("#pop01_txt01_MENU_ID").val()
			};
			
			getAjaxJsonData("cm1400Verification", searchParam, "searchVerificationCallBack");
		};
			
		function searchVerificationCallBack(data) {
			var check = parseInt(data[0].MENU_ID);
			
			if (check > 0){
				toast("경고", "이미 존재하는 메뉴ID입니다.", "error");
			}else{
				verification = 1;	// 중복확인 여부 CHECK 지역변수 (0: 중복확인 안눌려짐, 1: 중복확인 버튼 눌려짐)
				toast("성공", "사용 가능한 메뉴ID입니다.", "success");
				
				$("#pop01_txt01_MENU_ID").attr("disabled",true);
			}
		};
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: Popup
		// Func. 그리드 상세내역 메뉴ID 『변경』 Button
		function changeGridData(){
			verification = 0;	// 중복확인 여부 CHECK 지역변수 (0: 중복확인 안눌려짐, 1: 중복확인 버튼 눌려짐)
			
			$('#pop01_txt01_MENU_ID').attr("readonly",false).attr("disabled",false);
			$('#pop01_btn01_CHANGE').css("display", "none");
			$('#pop01_btn01_VERIFICATION').css("display", "block");
		};
	</script>
</html>