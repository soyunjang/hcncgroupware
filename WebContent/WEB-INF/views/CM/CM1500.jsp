<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<body>
		<!-- .contents-wrap 컨텐츠영역 START -->
		<div class="contents-wrap cm1500-page">
			<!-- .page-title-wrap 타이블영역 START -->
			<div class="page-title-wrap">
				<div class="page-title">
             		<h2>카드관리</h2>
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
							<dt>사업장</dt>
							<dd>
								<select id="sel01_OFFICE_TYPE" class="w160"></select>
							</dd>
						</dl>
						<dl>
							<dt>카드사</dt>
							<dd>
								<select id="sel01_COMPANY" class="w160"></select>
							</dd>
						</dl>
						<dl>
							<dt>카드번호</dt>
							<dd>
								<input type="text" id="txt01_CARD_NUM">
							</dd>
						</dl>
						<dl>
							<dt>사용자</dt>
							<dd>
								<input type="text" id="txt01_USER_NM">
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
	                        	<h2 class="title1">카드 관리 목록</h2>
								<span id="table1_cnt">0</span>
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
		<div id="viewForm1" style="display: none;">
			<div class="modal-cont">
				<div class="row row-1">
					<div class="col col-1 wp100">
						<section>
							<table class="table-write">
			                    <caption>카드 관리 내역</caption>
			                    <colgroup>
			                        <col class="wp20">
			                        <col class="wp30">
			                        <col class="wp20">
			                        <col class="wp30">
			                    </colgroup>
			                    <tbody>
			                        <tr>
			                            <th class="req">1.사업장</th>
			                            <td>
			                            	<select id="pop01_sel01_OFFICE" class="wp100"></select>
			                            </td>
			                            <th class="req">2.사용자</th>
			                            <td>
			                            	<div class="input-srch">
												<input type="text" id="pop01_txt01_USER_ID" placeholder="사용자ID" class="readonly wp100" readonly="readonly" style="display: none;">
												<input type="text" id="pop01_txt01_USER" placeholder="사용자명" class="readonly wp100" readonly="readonly">
												<a href="javascript:void(0);" id="pop01_btn01_USER" class="btn-srch"></a>
											</div>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th class="req">3.카드사</th>
			                            <td>
			                            	<select id="pop01_sel01_COMPANY" class="wp100"></select>
			                            </td>
			                            <th class="req">4.카드번호</th>
			                            <td>
			                            	<input type="text" id="pop01_txt01_CARD_NUM" maxlength="19">
			                            </td>
			                        </tr>
			                        <tr>
			                            <th>5.CVS</th>
			                            <td>
			                            	<input type="text" id="pop01_txt01_CVS" maxlength="3">
			                            </td>
			                            <th>6.한도금액</th>
			                            <td>
			                            	<input type="text" id="pop01_txt01_LIMIT" class="ta-r">
			                            </td>
			                        </tr>
			                        <tr>
			                            <th>7.유효기간</th>
			                            <td>
			                            	<input type="date" id="pop01_date01_CARD_DT" Placeholder="유효기간" size="12">
			                            </td>
			                            <th>8.발급일자</th>
			                            <td>
			                            	<input type="date" id="pop01_date01_ISSUANCE_DT" Placeholder="발급일자" size="12">
			                            </td>
			                        </tr>
			                        <tr>
			                            <th>9.지급일자</th>
			                            <td>
			                            	<input type="date" id="pop01_date01_PROVIDE_DT" Placeholder="지급일자" size="12">
			                            </td>
			                            <th>10.회수일자</th>
			                            <td>
			                            	<input type="date" id="pop01_date01_RETRIEVE_DT" Placeholder="회수일자" size="12">
			                            </td>
			                        </tr>
			                        <tr>
			                            <th>11.비고</th>
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
		
		<!-- 사용자 조회 팝업 -->
		<div id="viewForm2" style="display: none;">
			<div class="modal-cont modal-cont2">
				<div class="search-zone">
					<div class="search-wrap">
						<div class="sch-box">
							<dl class="dl-2n">
								<dt>사용자명</dt>
								<dd><input type="text" id="pop02_txt01_USER_NM" class="w200"></dd>
							</dl>
						</div>
						<div class="srch-btn wp40">
			                <ul>
			                    <li><a href="javascript:searchGridDataUser();" class="btn-search">검색</a></li>
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
		<!-- .modal-cont 팝업영역 END -->
	</body>
	
	<script type="text/javascript">
		/**
		 * CM1500	카드관리
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
		var langPop2;

		/* 변수 선언 */
		var checkAction = "";
		
		/* 공통코드_콤보박스 */ 
		commonCodeSelectAdd("sel01_OFFICE_TYPE", getCommonCode('OFFICE'), 'Y');
		commonCodeSelectAdd("sel01_COMPANY", getCommonCode('CARD'), 'Y');
		commonCodeSelectAdd("pop01_sel01_OFFICE", getCommonCode('OFFICE'), 'N');
		commonCodeSelectAdd("pop01_sel01_COMPANY", getCommonCode('CARD'), 'N');
		
		/* Document가 로드되었을 때 실행되는 코드 */
		$(document).ready(function() {
			function init() {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
			}
			
			jQuery(window).on('resize.jqGrid', function () {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
			});
			
			// 화면ID, 화면ID사이즈(6:CM1000/13:CM1000_Detail), 다국어
			langHead = getLangCode("CM1500", 6, "${LANG}");
			langPop2 = getLangCodeDetail("CM1500_Pop2", 11, "${LANG}");
			
			setGrid();
			init(); //그리드 리사이징
		});
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 버튼
		/* 엑셀 버튼 */
		$("#btn01_EXCEL").on({
			click: function(){
				exportExcel("table1", "카드관리");
			}
		});
		
		/* 검색 버튼 */
		$("#btn01_SEARCH").on({
			click: function() {
				searchGridDataHead();
			}
		});
		
		/* 추가 버튼 */
		$("#btn01_INSERT").on({
			click : function(){
				checkAction = "C";
				openSysHeadPopup(checkAction);
			}
		});
		
		/* 수정 버튼 */
		$("#btn01_UPDATE").on({
			click : function(){
				var rowData = $("#table1").getRowData($("#table1").getGridParam("selrow"));
				if(rowData != null){
					updateGridData(rowData);
					openSysHeadPopup("U");
				}else {
					toast("정보", "선택된 카드정보가 없습니다.", "info");
					return false;
				}
			}
		});
		
		/* 카드정보 추가/수정 팝업의 사용자 버튼 */
		$("#pop01_btn01_USER").on({
			click : function(){
				openModalPopup_User();
			}
		});
		
		var cardNum = document.getElementById('pop01_txt01_CARD_NUM');
		cardNum.onkeyup = function(event) {
			event = event || window.event;
			var value = this.value.trim();
			this.value = cardNumHypen(value);
			console.log("cardNumHypen : ", this.value);
		}
		
		function cardNumHypen(res) {
			if(res.length < 5) {
				return res;
			} else {
				return res.match(/[0-9●]{1,4}/g)?.join('-') || res;
			}
		}

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: confirm
		/* confirm 확인버튼 클릭시 */
		function confirmYes(action){
			var saveParam = {
					OFFICE : $("#pop01_sel01_OFFICE").val()
					, USER_ID : $("#pop01_txt01_USER_ID").val()
					, COMPANY : $("#pop01_sel01_COMPANY").val()
					, CARD_NUM : document.getElementById('pop01_txt01_CARD_NUM').value
					, CVS : $("#pop01_txt01_CVS").val()
					, LIMIT : $("#pop01_txt01_LIMIT").val().replaceAll(",", "")
					, CARD_DT : $("#pop01_date01_CARD_DT").val()
					, ISSUANCE_DT : $("#pop01_date01_ISSUANCE_DT").val()
					, PROVIDE_DT : $("#pop01_date01_PROVIDE_DT").val()
					, RETRIEVE_DT : $("#pop01_date01_RETRIEVE_DT").val()
					, MEMO : $("#pop01_txt01_MEMO").val()
			}
			
			getAjaxJsonData("cm1500Save", saveParam, "menuUpdateCallBack");
			$("#viewForm1").dialog("close");
		}

		/*수정 콜백함수*/
		function menuUpdateCallBack(data){
			if(data.length == 1){
				toast("오류", "이미 존재하는 카드정보입니다.", "error");
				return false;
			}else{
				toast("성공", "정상적으로 저장되었습니다.", "success");
				searchGridDataHead();
			}
		}
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 그리드
		/* jqGrid 셋팅 */
		function setGrid(){
			$("#table1").jqGrid({
				mtype: 'POST'
				, datatype: 'loacl'
				, height: 556
				, jsonReader: {
					repeatitems: false
				}
				, colNames: langHead
				, colModel: [
					{name: 'OFFICE_TYPE'      	, align: 'center'	, width: '4%'	, hidden: false}
					, {name: 'COMPANY'	    	, align: 'center'	, width: '5%'	, hidden: false}
					, {name: 'CARD_NUM'	    	, align: 'left'		, width: '11%'	, hidden: false}
					, {name: 'USER_ID'	    	, align: 'left'		, width: '0%'	, hidden: true}
					, {name: 'USER_NM'  	 	, align: 'center'	, width: '5%'	, hidden: false}
					, {name: 'CARD_CVS'     	, align: 'center'	, width: '4%'	, hidden: false}
					, {name: 'CARD_DT'      	, align: 'center'	, width: '7%'	, hidden: false}
					, {name: 'ISSUANCE_DT'     	, align: 'center'	, width: '7%'	, hidden: false}
					, {name: 'PROVIDE_DT'      	, align: 'center'	, width: '7%'	, hidden: false}
					, {name: 'RETRIEVE_DT'     	, align: 'center'   , width: '7%'	, hidden: false}
					, {name: 'LIMIT'	     	, align: 'right'	, width: '4%'	, hidden: false}
					, {name: 'MEMO'		     	, align: 'left'		, width: '18%'	, hidden: false}
				]
				, autowidth: true
				, shrinkToFit: false
				, rowNum : 5000
				, ondblClickRow: function(rowid){
					var rowdata = $("#table1").getRowData(rowid);
					updateGridData(rowdata);
					openSysHeadPopup("U");
				}
			});
			
			searchGridDataHead();

			$("#table2").jqGrid({
				mtype: 'POST'
				, datatype: 'local'
				, height : 540
				, jsonReader: {
					repeatitems: false 
				}
				, colNames: langPop2
				, colModel: [
					{name: 'USER_ID'     	, align: 'center'	, width: '0'	, hidden: true}
					, {name: 'USER_NM'   	, align: 'center'	, width: '30'	, hidden: false}
					, {name: 'DEPT_CD'   	, align: 'center'	, width: '0'	, hidden: true}
					, {name: 'DEPT_NM'   	, align: 'center'	, width: '40'	, hidden: false}
					, {name: 'GRADE_CD'   	, align: 'center'	, width: '0'	, hidden: true}
					, {name: 'GRADE_NM'    	, align: 'center'	, width: '30'	, hidden: false}
				]
				, autowidth: true
				, shrinkToFit: false
				, ondblClickRow: function(rowid){
					var rowdata = $("#table2").getRowData(rowid);
					
					$("#pop01_txt01_USER_ID").val(rowdata.USER_ID);
					$("#pop01_txt01_USER").val(rowdata.USER_NM);					
					
					$("#viewForm2").dialog("close");
				}
			});
		}

		/* 그리드row 더블클릭 / 수정버튼 클릭시 팝업에 값 세팅 */
		function updateGridData(rowdata){      
			$("#pop01_sel01_OFFICE").val($('#pop01_sel01_OFFICE option:contains(' + rowdata.OFFICE_TYPE + ')').val());
			$('#pop01_txt01_USER_ID').val(rowdata.USER_ID);
			$("#pop01_txt01_USER").val(rowdata.USER_NM);                       
			$("#pop01_sel01_COMPANY").val($('#pop01_sel01_COMPANY option:contains(' + rowdata.COMPANY + ')').val());                       
			$("#pop01_txt01_CARD_NUM").val(rowdata.CARD_NUM);                     
			$('#pop01_txt01_CVS').val(rowdata.CARD_CVS);
			$("#pop01_txt01_LIMIT").val(rowdata.LIMIT);
			$("#pop01_date01_CARD_DT").val(rowdata.CARD_DT);
			$("#pop01_date01_ISSUANCE_DT").val(rowdata.ISSUANCE_DT);
			$("#pop01_date01_PROVIDE_DT").val(rowdata.PROVIDE_DT);
			$("#pop01_date01_RETRIEVE_DT").val(rowdata.RETRIEVE_DT);
			$("#pop01_txt01_MEMO").val(rowdata.MEMO);
		}

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: CRUD
		/* Table 조회 */
		function searchGridDataHead(){
			var searchParam = {
					OFFICE_TYPE : $("#sel01_OFFICE_TYPE").val()
					, COMPANY : $("#sel01_COMPANY").val()
					, CARD_NUM : $("#txt01_CARD_NUM").val()
					, USER_NM : $("#txt01_USER_NM").val()
			};
			
			getAjaxJsonData("cm1500Sel", searchParam, "searchGridDataHeadCallBack");
		};
		
		function searchGridDataHeadCallBack(data) {
			$("#table1").clearGridData();
			$('#table1').jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");

			if(data.length > 0){
				$("#table1_cnt").text(comma(data.length));
			} else {
				$('#table1_cnt').text(0);
			}

			$("#table1").jqGrid('setSelection', 1, true);
		};
		
		/* 메뉴 추가/수정 팝업의 사용자 Table 조회 */
		function searchGridDataUser(){
			var searchParam = {
				USER_NM : $('#pop02_txt01_USER_NM').val()
			};
			
			getAjaxJsonData("cm1500UserSel", searchParam, "searchGridDataUserCallBack");
		};

		function searchGridDataUserCallBack(data) {
			$("#table2").clearGridData();
			$('#table2').jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");
		};
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 유효성
		
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: Popup
		/* 카드정보 내역 팝업 */
		function openSysHeadPopup(action){
			// 화면ID, 화면ID사이즈(ex. 6:CM1000 / 13:CM1000_Detail), 팝업ID, 다국어
			var returnPopup = getLangCodePopup("CM1500_Pop1", 11, "viewForm1", "${LANG}");
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
						
						$("#pop01_txt01_LIMIT").val("0");
					}else if(action == "U"){
						
					}
				}
				, close: function () {
					$(this).dialog("close");
				}
				, buttons: [
					{
						text : pop01_btn01_SAVE,
	                    click : function () {
							if($("#pop01_sel01_OFFICE").val() == ""){
							   toast("경고", "사업장을 선택해주세요.", "error");
							   return false;
							}
							if($("#pop01_txt01_USER").val() == ""){
							   toast("경고", "사용자를 선택해주세요.", "error");
							   return false;
							}
							if(document.getElementById('pop01_txt01_CARD_NUM').value == undefined){
							   toast("경고", "카드사를 선택해주세요.", "error");
							   return false;
							}
							if($("#pop01_txt01_CARD_NUM").val() == ""){
							   toast("경고", "카드번호를 입력해주세요.", "error");
							   return false;
							}
							
							confirms("저장하시겠습니까?", action);
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
		
		/* 사용자조회 팝업 */
		function openModalPopup_User(action){
			// 화면ID, 화면ID사이즈(ex. 6:CM1000 / 13:CM1000_Detail), 팝업ID, 다국어
			var returnPopup = getLangCodePopup("CM1500_Pop2", 11, "viewForm2", "${LANG}");
			var titlePop = returnPopup[0];
			var pop02_btn01_FINISH = returnPopup[1];
			var pop02_btn01_CLOSE = returnPopup[2];
			
			$("#viewForm2").dialog({
				autoOpen: true
				, title: titlePop
				, width: 600
				, modal: true
				, open: function (event, ui) {
					popReset("viewForm2");
					searchGridDataUser();
				}
				, close: function () {
					$(this).dialog("close");
				}
				, buttons: [
					{
						text : pop02_btn01_FINISH,
	                    click : function () {
	                    	var rowid = $("#table2").getGridParam("selrow");
							if(rowid < 1){
								toast("정보", "선택된 사용자가 없습니다.", "info");
								return false;
							} else {
								var rowdata = $("#table2").getRowData(rowid);
								
								$("#pop01_txt01_USER_ID").val(rowdata.USER_ID);
								$("#pop01_txt01_USER").val(rowdata.USER_NM);
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
	</script>
</html>