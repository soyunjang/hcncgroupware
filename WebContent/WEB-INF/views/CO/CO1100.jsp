<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<body>
		<!-- .contents-wrap 컨텐츠영역 START -->
		<div class="contents-wrap an1100-page">
			<!-- .page-title-wrap 타이블영역 START -->
			<div class="page-title-wrap">
				<div class="page-title">
					<h2>법인카드 사용내역 등록</h2>
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
						<dl>
							<dt>카드사</dt>
							<dd>
								<select id="sel01_COMPANY"></select>
							</dd>
						</dl>
						<dl>
							<dt>조회기간</dt>
							<dd>
								<input type="month" id="date01_DATE" pattern="[0-9]{4}-[0-9]{2}">
							</dd>
						</dl>
<!-- 						<dl> -->
<!-- 							<dt>사용자</dt> -->
<!-- 							<dd> -->
<!-- 								<input type="text" id="txt01_USER_NM"> -->
<!-- 							</dd> -->
<!-- 						</dl> -->
						<dl>
							<dt>카드번호</dt>
							<dd>
								<input type="text" id="txt01_CARD_NUM">
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
	                            <h2 class="title1">법인카드 사용목록</h2>
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
	</body>
	
	<script type="text/javascript">
		/**
		 * CO1000	법인카드 사용내역 조회
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
		
		commonCodeSelectAdd("sel01_COMPANY", getCommonCode('CARD'), 'Y');

		/* Document가 로드되었을 때 실행되는 코드 */
		$(document).ready(function() {
			function init() {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
			}
			
			jQuery(window).on('resize.jqGrid', function () {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
			});
			
			// 화면ID, 화면ID사이즈(6:CM1000/13:CM1000_Detail), 다국어
			langHead = getLangCode("CO1100", 6, "${LANG}");
			
			document.getElementById('date01_DATE').value= new Date().toISOString().slice(0, 7);
			
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
					{name: 'USE_DATE'			, align: 'center'	, width: '5%'	, hidden: false}				
					, {name: 'SALES_NUM'		, align: 'center' 	, width: '8%'	, hidden: false}									
					, {name: 'ACCOUNT_SUB'		, align: 'center'	, width: '6%'	, hidden: false}				
					, {name: 'ACCOUNT'			, align: 'center'	, width: '8%'	, hidden: false}				
					, {name: 'BREAKDOWN'		, align: 'center'	, width: '13%'	, hidden: false}				
					, {name: 'APPROVAL'			, align: 'right'	, width: '5%'	, hidden: false, formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}					
					, {name: 'REFUND'			, align: 'right'	, width: '5%'	, hidden: false, formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}
					, {name: 'MEMO'				, align: 'left' 	, width: '12%'	, hidden: false}	
				]
				, autowidth: false
				, shrinkToFit: false
				, rowNum : 1000
			});
			
			searchGridData();
		};
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: CRUD
		/* Table 조회 */
		function searchGridData(){
			var searchParam = {
					COMPANY: $("#sel01_COMPANY").val()
					, DATE: $("#date01_DATE").val()
// 					, USER_NM: $("#txt01_USER_NM").val()
					, CARD_NUM: $("#txt01_CARD_NUM").val()
			};
			
			getAjaxJsonData("co1100Sel", searchParam, "searchGridDataCallBack");
		};
		
		function searchGridDataCallBack(data){
			$("#table1").clearGridData();
			$("#table1").jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");
		};

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 유효성
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: Popup
		
	</script>
</html>