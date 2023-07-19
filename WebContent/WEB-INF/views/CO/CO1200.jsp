<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<body>
		<!-- .contents-wrap 컨텐츠영역 START -->
		<div class="contents-wrap an1100-page">
			<!-- .page-title-wrap 타이블영역 START -->
			<div class="page-title-wrap">
				<div class="page-title">
					<h2>법인카드 사용내역 조회</h2>
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
						<dl class="dl-2n">
							<dt>판품번호</dt>
							<dd>
								<ul class="input2-wrap">
									<li class="input-src">
										<input type="search" id="itemNo" name="itemNo" onchange="itemNoChange();">
										<label class="hide">검색</label>
										<input type="button" id="btn01_SALES">
									</li>
									<li><label class="hide">찾은 내용</label><input type="text" id="itemName" name="itemName" readonly></li>
								</ul>
								<input type="hidden" id="equipNo" name="equipNo">
							</dd>
						</dl>
						<dl>
							<dt>사용자</dt>
							<dd>
								<input type="text" id="txt01_USER_NM">
							</dd>
						</dl>
						<dl>
							<dt>부서</dt>
							<dd>
								<select id="sel01_DEPT"></select>
							</dd>
						</dl>
						<dl class="dl-hide"></dl>
						<dl class="dl-hide"></dl>
					</div>
					<div class="srch-btn">
		                <ul>
		                    <li><a href="javascript:void(0);" id="btn01_SEARCH" class="btn-search">검색</a></li>
							<li><a href="#" class="btn-open" title="검색펼치기"></a></li>
		                </ul>
		            </div>
				</div>
			</div>
	        <div class="search-zone-info">
				<div class="search-wrap-info">
					<div class="sch-box-info">
						<dl>
							<dt>경비예산</dt>
							<dd>
								<input type="text" id="txt01_EXPENSE_PRICE" value="0" class="readonly ta-r">
							</dd>
						</dl>
						<dl>
							<dt>사용금액</dt>
							<dd>
								<input type="text" id="txt01_USE_PRICE" value="0" class="readonly ta-r">
							</dd>
						</dl>
						<dl>
							<dt>사용잔액</dt>
							<dd>
								<input type="text" id="txt01_BALANCE" class="readonly ta-r">
							</dd>
						</dl>
					</div>
				</div>
			</div>
			<!-- .search-wrap 검색영역 END -->
			
			<!-- .title-wrap TABLE영역 START -->
			<div class="row row-1 row-wrap-204">
				<div class="col col-1 wp100">
					<section>
						<div class="title-wrap">
	                        <div class="title-zone">
	                            <h2 class="title1">법인카드 사용목록</h2>
								<span id="table1_cnt">0</span>
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

		<!-- 프로젝트 조회 팝업 -->
		<div id="viewForm2" style="display: none;">
			<div class="modal-cont modal-cont2">
				<div class="search-zone">
					<div class="search-wrap">
						<div class="sch-box">
							<dl class="dl-2n">
								<dt>프로젝트명</dt>
								<dd>
									<input type="text" id="pop02_txt01_PROJECT" class="w200">
								</dd>
							</dl>
						</div>
						<div class="srch-btn wp40">
							<ul>
								<li><a href="javascript:searchGridDataProject();" class="btn-search">검색</a></li>
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
	</body>
	
	<script type="text/javascript">
		/**
		 * CO1200	법인카드 사용내역 조회
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

		var ex = '${CORPORATE.APPROVAL}';
		commonCodeSelectAdd("sel01_DEPT", getCommonCode('DEPT'), 'Y');

		/* Document가 로드되었을 때 실행되는 코드 */
		$(document).ready(function() {
			function init() {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
			}
			
			jQuery(window).on('resize.jqGrid', function () {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
			});
			
			// 화면ID, 화면ID사이즈(6:CM1000/13:CM1000_Detail), 다국어
			langHead = getLangCode("CO1200", 6, "${LANG}");
			langPop2 = getLangCodeDetail("CO1100_Pop2", 11, "${LANG}");
			
			var today = new Date();
			var monthAgo = new Date(today);
			monthAgo.setMonth(today.getMonth() - 1);
			
			$("#date01_START").val(monthAgo.toISOString().split('T')[0]);	
			$("#date01_END").val(today.toISOString().split('T')[0]);
			
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

		/* 검색 버튼 */
		$("#btn01_SEARCH").on({
			click: function(){
				searchGridData();
			}
		});

		function itemNoChange() {
			if ($("#itemNo").val() == "") {
				$("#itemName").val("");
			}
		}

		/* 사용내역 수정 팝업의 프로젝트 팝업 버튼 */
		$("#btn01_SALES").on({
			click: function(e){
				e.preventDefault();
				openModalPopup_Project();
			}
		});

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: confirm
		
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
					{name: 'USE_DATE'			, align: 'center'	, width: '6%'	, hidden: false}
					, {name: 'USER_ID'			, align: 'center' 	, width: '0%'	, hidden: true}
					, {name: 'USER_NM'			, align: 'center'	, width: '4%'	, hidden: false}
					, {name: 'SALES_NUM'		, align: 'center'	, width: '8%'	, hidden: false}
					, {name: 'PROJECT_NM'		, align: 'left'		, width: '12%'	, hidden: false}
					, {name: 'ACCOUNT_SUB'		, align: 'left'		, width: '6%'	, hidden: false}
					, {name: 'ACCOUNT'			, align: 'left'		, width: '12%'	, hidden: false}
					, {name: 'BREAKDOWN'		, align: 'left'		, width: '9%'	, hidden: false}
					, {name: 'APPROVAL'			, align: 'right' 	, width: '4%'	, hidden: false, formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}
					, {name: 'REFUND'			, align: 'right' 	, width: '4%'	, hidden: false, formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}
					, {name: 'MEMO'				, align: 'left' 	, width: '9%'	, hidden: false}
				]
				, autowidth: false
				, shrinkToFit: false
				, rowNum : 1000
			});
			
			searchGridData();

			$("#table2").jqGrid({
				mtype : 'POST'
				, datatype : 'local'
				, jsonReader: {
					repeatitems: false
				}
				, colNames: langPop2
				, colModel: [
					{name: 'SALES_NUM'		, align: 'center'	, width: '5%'	, hidden: false}
					, {name: 'PROJECT_NM'	, align: 'left'		, width: '10%'	, hidden: false}
				]
				, autowidth: true
				, shrinkToFit: false
				, ondblClickRow : function(rowid){
					var rowdata = $("#table2").getRowData(rowid);

					$("#itemNo").val(rowdata.SALES_NUM);
					$("#itemName").val(rowdata.PROJECT_NM);

					$("#viewForm2").dialog("close");
				}
			});
		};
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: CRUD
		/* Table 조회 */
		function searchGridData(){
			var searchParam = {
					START: $("#date01_START").val()
					, END: $("#date01_END").val()
					, SALES: $("#itemNo").val()
					, USER_NM: $("#txt01_USER_NM").val()
					, DEPT: $("#sel01_DEPT").val()
			};
			
			getAjaxJsonData("co1200Sel", searchParam, "searchGridDataCallBack");
		};
		
		function searchGridDataCallBack(data){
			$("#table1").clearGridData();
			$("#table1").jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");

			if(data.length > 0){
				$("#table1_cnt").text(comma(data.length));
			} else {
				$('#table1_cnt').text(0);
			}
			debugger;
			var e = '${CORPORATE.EXPENSE_PRICE}';
			var a = '${CORPORATE.APPROVAL}';
			var balance = parseInt($("#txt01_EXPENSE_PRICE").val()) - parseInt($("#txt01_USE_PRICE").val());
			$("#txt01_BALANCE").val(balance);
		};

		/* 사용내역 수정 팝업의 프로젝트 Table 조회  */
		function searchGridDataProject(){
			var searchParam = {
				PROJECT_NM : $("#pop02_txt01_PROJECT").val()
			};

			getAjaxJsonData("co1100SelProject", searchParam, "searchGridDataProjectCallBack");
		};

		function searchGridDataProjectCallBack(data){
			$("#table2").clearGridData();
			$('#table2').jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");
		};

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 유효성
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: Popup
		/* 프로젝트 조회 팝업 */
		function openModalPopup_Project(){
			// 화면ID, 화면ID사이즈(ex. 6:CM1000 / 13:CM1000_Detail), 팝업ID, 다국어
			var returnPopup = getLangCodePopup("CO1100_Pop2", 11, "viewForm2", "${LANG}");
			var titlePop = returnPopup[0];
			var pop02_btn01_FINISH = returnPopup[1];
			var pop02_btn01_CLOSE = returnPopup[2];

			$("#viewForm2").dialog({
				autoOpen: true
				, title: titlePop
				, width: 850
				, modal: true
				, open: function (event, ui) {
					searchGridDataProject();
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
								toast("정보", "선택된 프로젝트가 없습니다.", "info");
								return false;
							} else {
								var rowdata = $("#table2").getRowData(rowid);

								$("#itemNo").val(rowdata.SALES_NUM);
								$("#itemName").val(rowdata.PROJECT_NM);
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