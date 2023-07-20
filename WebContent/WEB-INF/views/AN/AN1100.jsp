<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<body>
		<!-- .contents-wrap 컨텐츠영역 START -->
		<div class="contents-wrap an1100-page">
			<!-- .page-title-wrap 타이블영역 START -->
			<div class="page-title-wrap">
				<div class="page-title">
					<h2>당행연도 연차현황</h2>
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
							<dt>연도</dt>
							<dd>
								<input type="text" id="txt01_YEAR" readonly>
							</dd>
						</dl>
						<dl>
							<dt>부서</dt>
							<dd>
								<select id="sel01_DEPT"></select>
							</dd>
						</dl>
						<dl>
							<dt>성명</dt>
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
	                            <h2 class="title1">연차현황 목록</h2>
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
	</body>
	
	<script type="text/javascript">
		/**
		 * AN1100	당해연도 연차현황
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
		let langHead;
		let nowDate = new Date();
		
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
			langHead = getLangCode("AN1100", 6, "${LANG}");
			
			$("#txt01_YEAR").val(nowDate.getFullYear());
			
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
					{name: 'USER_NM'			, align: 'center'	, width: '10%'	, hidden: false}				
					, {name: 'GRADE_CD'			, align: 'center' 	, width: '10%'	, hidden: true}									
					, {name: 'GRADE_NM'			, align: 'center' 	, width: '10%'	, hidden: false}									
					, {name: 'ENTER_DT'			, align: 'center'	, width: '10%'	, hidden: false}				
					, {name: 'HOLIDAY_TOTAL'	, align: 'center'	, width: '10%'	, hidden: false}				
					, {name: 'HOLIDAY_USE'		, align: 'center'	, width: '10%'	, hidden: false}				
					, {name: 'HOLIDAY_REMAIN'	, align: 'center' 	, width: '10%'	, hidden: false}				
					, {name: 'HOLIDAY_DEDUCT'	, align: 'center'	, width: '10%'	, hidden: false}					
					, {name: 'JANUARY'			, align: 'center'	, width: '5%'	, hidden: false}
					, {name: 'FEBRUARY'			, align: 'center'	, width: '5%'	, hidden: false}
					, {name: 'MARCH'			, align: 'center'	, width: '5%'	, hidden: false}
					, {name: 'APRIL'			, align: 'center'	, width: '5%'	, hidden: false}
					, {name: 'MAY'				, align: 'center'	, width: '5%'	, hidden: false}
					, {name: 'JUNE'				, align: 'center'	, width: '5%'	, hidden: false}
					, {name: 'JULY'				, align: 'center'	, width: '5%'	, hidden: false}
					, {name: 'AUGUST'			, align: 'center'	, width: '5%'	, hidden: false}
					, {name: 'SEPTEMBER'		, align: 'center'	, width: '5%'	, hidden: false}
					, {name: 'OCTOBER'			, align: 'center'	, width: '5%'	, hidden: false}
					, {name: 'NOVEMBER'			, align: 'center'	, width: '5%'	, hidden: false}
					, {name: 'DECEMBER'			, align: 'center'	, width: '5%'	, hidden: false}
				]
				, autowidth: false
				, shrinkToFit: false
				, rowNum : 1000
				, loadComplete : function() {
					// 그리드 데이터의 ID 가져오기
					let ids = $('#table1').jqGrid('getDataIDs');
					     
					// 그리드 데이터 가져오기
					let gridData = $("#table1").jqGrid('getRowData');
					
					// 데이터 확인후 색상 변경
					for (let i = 0; i < gridData.length; i++) {
				        // 칼럼의 색생을 변경하고 싶을 때
				        $('#table1').jqGrid('setCell', ids[i], 'HOLIDAY_TOTAL', '', {'background':'#fffce5'});
				        $('#table1').jqGrid('setCell', ids[i], 'HOLIDAY_USE', '', {'background':'#fffce5'});
				        $('#table1').jqGrid('setCell', ids[i], 'HOLIDAY_REMAIN', '', {'background':'#fffce5'});
				        $('#table1').jqGrid('setCell', ids[i], 'HOLIDAY_DEDUCT', '', {'background':'#fffce5'});
					}
				}
			});
			
			searchGridData();
		};
				
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: CRUD
		/* Table 조회 */
		function searchGridData(){
			let searchParam = {
					YEAR: $("#txt01_YEAR").val()
					, DEPT: $("#sel01_DEPT").val()
					, USER_NM: $("#txt01_USER_NM").val()
			};
			
			getAjaxJsonData("an1100Sel", searchParam, "searchGridDataCallBack");
		};
		
		function searchGridDataCallBack(data){
			$("#table1").clearGridData();
			$("#table1").jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");

			$("#table1_cnt").text(data.length);
		};

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 유효성
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: Popup
		
	</script>
</html>