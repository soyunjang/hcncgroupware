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
										<label for="" class="hide">검색</label>
										<input type="button" class="btnPopup" data-url="/pu3000EqMstr" data-callbackfun="equipNoCallBack" data-size="L">
									</li>
									<li><label for="itemDesc" class="hide">찾은 내용</label><input type="text" id="itemName" name="itemName" readonly></li>
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
								<input type="text" id="txt01_USER_NM" value="${Office }" readonly="readonly">
							</dd>
						</dl>
						<dl>
							<dt>사용금액</dt>
							<dd>
								<input type="text" id="txt01_USER_NM" value="${Office }" readonly="readonly">
							</dd>
						</dl>
						<dl>
							<dt>사용잔액</dt>
							<dd>
								<input type="text" id="txt01_USER_NM" value="${Office }" readonly="readonly">
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
					{name: 'USE_DATE'			, align: 'center'	, width: '7%'	, hidden: false}				
					, {name: 'USER_ID'			, align: 'center' 	, width: '10%'	, hidden: true}									
					, {name: 'USER_NM'			, align: 'center'	, width: '5%'	, hidden: false}				
					, {name: 'SALES_NUM'		, align: 'center'	, width: '10%'	, hidden: false}				
					, {name: 'PROJECT_NM'		, align: 'center'	, width: '15%'	, hidden: false}				
					, {name: 'ACCOUNT_SUB'		, align: 'center'	, width: '10%'	, hidden: false}				
					, {name: 'ACCOUNT'			, align: 'center'	, width: '10%'	, hidden: false}					
					, {name: 'BREAKDOWN'		, align: 'center'	, width: '10%'	, hidden: false}			
					, {name: 'APPROVAL'			, align: 'right' 	, width: '5%'	, hidden: false}	
					, {name: 'REFUND'			, align: 'right' 	, width: '5%'	, hidden: false}	
					, {name: 'MEMO'				, align: 'left' 	, width: '10%'	, hidden: false}	
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
		};

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 유효성
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: Popup
		
	</script>
</html>