<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<body>
		<!-- .contents-wrap 컨텐츠영역 START -->
		<div class="contents-wrap cm1600-page">
			<!-- .page-title-wrap 타이블영역 START -->
			<div class="page-title-wrap">
				<div class="page-title">
					<h2>메시지 관리</h2>
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
							<dt>한글명</dt>
							<dd>
								<input type="text" id="txt01_KOR" class="w160">
							</dd>
						</dl>
						<dl>
							<dt>영문명</dt>
							<dd>
								<input type="text" id="txt01_ENG" class="w160">
							</dd>
						</dl>
						<dl>
							<dt>중문명</dt>
							<dd>
								<input type="text" id="txt01_CHN" class="w160">
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
								<h2 class="title1">메시지 관리 목록</h2>
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
				                <caption>메시지 관리</caption>
				                <colgroup>
				                    <col class="wp20">
				                    <col class="wp30">
				                    <col class="wp20">
				                    <col class="wp30">
				                </colgroup>
				                <tbody>
				                	<tr>
				                    	<th class="req">1.구분</th>
				                    	<td>
				                    		<select id="pop01_sel01_TYPE" class="wp100"></select>
				                    	</td>
				                    	<th class="req">2.고유ID</th>
				                        <td>
				                        	<input type="text" id="pop01_txt01_UNIQUE_ID">
				                        </td>
				                   	</tr>
				                   	<tr>
				                		<th>3.순번</th>
				                        <td>
				                        	<input type="text" id="pop01_txt01_SORT">
				                        </td>
				                        <th class="req">4.사용유무</th>
				                        <td>
				                        	<select id="pop01_sel01_USE_YN" class="wp100"></select>
				                        </td>
				                	</tr>
				                    <tr>
				                        <th class="req">5.한글명</th>
				                        <td colspan="3">
				                        	<input type="text" id="pop01_txt01_KOR">
				                        </td>
									</tr>
				                   	<tr>
				                    	<th class="req">6.영문명</th>
				                        <td colspan="3">
				                        	<input type="text" id="pop01_txt01_ENG">
				                        </td>
				                  	</tr>
				                  	<tr>
				                    	<th class="req">7.중문명</th>
				                        <td colspan="3">
				                        	<input type="text" id="pop01_txt01_CHN">
				                        </td>
				                  	</tr>
				                   	<tr>
				                    	<th>8.비고</th>
				                        <td colspan="3">
				                        	<input type="text" id="pop01_txt01_MEMO">
				                        </td>
									</tr>
									<tr style="display: none;">
										<th class="req">9.순번</th>
				                        <td>
				                        	<input type="text" id="pop01_txt01_SEQ">
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
		 * CM1600	메시지 관리
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
		commonCodeSelectAdd("pop01_sel01_USE_YN", getCommonCode('USE'), 'N');
		commonCodeSelectAdd("pop01_sel01_TYPE", getCommonCode('TYPE'), 'N');

		/* Document가 로드되었을 때 실행되는 코드 */
		$(document).ready(function() {
			function init() {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
			}
			
			jQuery(window).on('resize.jqGrid', function () {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
			});

			// 화면ID, 화면ID사이즈(6:CM1000/13:CM1000_Detail), 다국어
			langHead = getLangCode("CM1600", 6, "${LANG}");
			
			setGrid();
			init(); //그리드 리사이징
		});
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 버튼
		/* 엑셀 버튼 */
		$("#btn01_EXCEL").on({
			click: function() {
				exportExcel("table1", "메시지 관리");
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
			click: function() {
				openSysHeadPopup("C");
			}
		});
		
		/* 수정 버튼 */
		$("#btn01_UPDATE").on({
			click: function() {
				var rowData = $("#table1").getRowData($("#table1").getGridParam("selrow"));
				if(rowData != null){
					openSysHeadPopup("U", rowData);
				}else {
					toast("정보", "선택된 메시지가 없습니다.", "info");
					return false;
				}
			}
		});

		$("#txt01_KOR").keypress((e) => {
			if (e.key === "Enter") searchGridDataHead();
		});

		$("#txt01_ENG").keypress((e) => {
			if (e.key === "Enter") searchGridDataHead();
		});

		$("#txt01_CHN").keypress((e) => {
			if (e.key === "Enter") searchGridDataHead();
		});
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: confirm
		/* confirm 확인버튼 클릭시 */
		function confirmYes(action){
			var params = {
				SEQ_NO : $("#pop01_txt01_SEQ").text().length <= 0 ? "" : $("#pop01_txt01_SEQ").text()
				, USE_YN : $("#pop01_sel01_USE_YN").val()
				, TYPE : $("#pop01_sel01_TYPE").val()
				, UNIQUE_ID : $("#pop01_txt01_UNIQUE_ID").val()
				, KOR_NM : $("#pop01_txt01_KOR").val()
				, ENG_NM : $("#pop01_txt01_ENG").val()
				, CHN_NM : $("#pop01_txt01_CHN").val()
				, SORT_NO : $("#pop01_txt01_SORT").val()
				, MEMO : $("#pop01_txt01_MEMO").val()
			}
			
			getAjaxJsonData("cm1600HeadSave", params, "testCallback");
			$("#viewForm1").dialog("close");
		}
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 그리드
		/* jqGrid 셋팅 */
		function setGrid(){
			$("#table1").jqGrid({
				mtype: 'POST'
				, datatype: 'local'
				, height: 556
				, jsonReader: {
					repeatitems: false
				}
				, colNames: langHead
				, colModel: [
					{name:'TYPE'		, align:'center'	, width:'10%'}
					, {name:'UNIQUE_ID'	, align:'left'		, width:'15%'}
					, {name:'KOR_NM'	, align:'left'		, width:'15%'}
					, {name:'ENG_NM'	, align:'left'		, width:'20%'}
					, {name:'CHN_NM'	, align:'left'		, width:'20%'}
					, {name:'SORT_NO'	, align:'center'	, width:'5%'}
					, {name:'USE_YN'	, align:'center'	, width:'5%'}
					, {name:'MEMO'		, align:'left'		, width:'20%'}
				]
				, autowidth: true
				, shrinkToFit: false
				, rowNum: 10000
				, ondblClickRow: function(rowid, status, e){
					var rowdata = $("#table1").getRowData(rowid);
					openSysHeadPopup("U", rowdata);
				}
			});
			
			searchGridDataHead();
		};

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: CRUD
		/* Table 조회 */
		function searchGridDataHead(){
			var searchParam = {
				KOR_NM: $("#txt01_KOR").val()
				, ENG_NM: $("#txt01_ENG").val()
				, CHN_NM: $("#txt01_CHN").val()
			};
			
			getAjaxJsonData("cm1600HeadSel", searchParam, "searchGridDataHeadCallBack");
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

		function testCallback(data) {
			searchGridDataHead();
		}
		
		function searchDataDetailCallBack(data) {			
			clearDetailValue();

			if (data.length > 0)
			{
				setDeteailValue(data[0]);
			}
		};

		function setDetailValue(value) {
			$('#pop01_txt01_SEQ').attr("readonly",true).attr("disabled",true);
			$('#pop01_sel01_TYPE').attr("readonly",true).attr("disabled",true);
			$('#pop01_txt01_UNIQUE_ID').attr("readonly",true).attr("disabled",true);
			
			$("#pop01_sel01_TYPE").val(value.TYPE);
			$("#pop01_txt01_UNIQUE_ID").val(value.UNIQUE_ID);
			$("#pop01_txt01_SORT").val(value.SORT_NO);
			$("#pop01_sel01_USE_YN").val(value.USE_YN == "사용" ? "Y": "N");
			$("#pop01_txt01_KOR").val(value.KOR_NM);
			$("#pop01_txt01_ENG").val(value.ENG_NM);
			$("#pop01_txt01_CHN").val(value.CHN_NM);
			$("#pop01_txt01_MEMO").val(value.MEMO);
			$("#pop01_txt01_SEQ").val(value.SEQ_NO);
		}
		
		function clearDetailValue() {
			$('#pop01_txt01_SEQ').attr("readonly",true).attr("disabled",true);
			$('#pop01_txt01_UNIQUE_ID').attr("readonly",false).attr("disabled",false);
			
			$("#pop01_txt01_SORT").val("");
			$("#pop01_sel01_USE_YN").val("Y");
			$("#pop01_sel01_TYPE option:eq(0)").prop("selected", true);
			$("#pop01_txt01_UNIQUE_ID").val("");
			$("#pop01_txt01_KOR").val("");
			$("#pop01_txt01_ENG").val("");
			$("#pop01_txt01_CHN").val("");
			$("#pop01_txt01_MEMO").val("");
			$("#pop01_txt01_SEQ").val("");
		};
		
		$(function(){
	       $("#txt01_KOR, #pop01_txt01_KOR").keyup(function (event) {
	            regexp = /[a-z]|[A-Z]/g;
	            v = $(this).val();
	            if (regexp.test(v)) {
	                $(this).val(v.replace(regexp, ''));
	            }
	        });
	       
	       $("#txt01_ENG, #pop01_txt01_ENG").keyup(function (event) {
	            regexp = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;
	            v = $(this).val();
	            if (regexp.test(v)) {
	                $(this).val(v.replace(regexp, ''));
	            }
	        });
		});
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: Popup
		function openSysHeadPopup(action, value){
			// 화면ID, 화면ID사이즈(ex. 6:CM1000 / 13:CM1000_Detail), 팝업ID, 다국어
			var returnPopup = getLangCodePopup("CM1600_Pop1", 11, "viewForm1", "${LANG}");
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
						clearDetailValue();
					}
					else if(action == "U"){
						setDetailValue(value);
					}
				}
				, close: function () {
					$(this).dialog("close");
				}
				, buttons: [
					{
						text : pop01_btn01_SAVE,
	                    click : function () {
							if ($("#pop01_txt01_UNIQUE_ID").val().length <= 0) {
								toast("오류", "고유ID를 입력해주세요.", "error");
								return false;
							}
							
							if ($("#pop01_txt01_KOR").val().length <= 0) {
								toast("오류", "한글명을 입력해주세요.", "error");
								return false;
							}
							
							if ($("#pop01_txt01_ENG").val().length <= 0) {
								toast("오류", "영문명을 입력해주세요.", "error");
								return false;
							} 
							
							if ($("#pop01_txt01_CHN").val().length <= 0) {
								toast("오류", "중문명을 입력해주세요.", "error");
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
	</script>
</html>