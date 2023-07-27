<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<body>
		<!-- .contents-wrap 컨텐츠영역 START -->
		<div class="contents-wrap an1100-page">
			<!-- .page-title-wrap 타이블영역 START -->
			<div class="page-title-wrap">
				<div class="page-title">
					<h2>날짜별 휴가현황</h2>
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
							<dt>조회날짜</dt>
							<dd>
								<input type="date" id="txt01_DATE">
							</dd>
						</dl>
						<dl>
							<dt>부서</dt>
							<dd>
								<select id="sel01_DEPT"></select>
							</dd>
						</dl>
						<dl>
							<dt>사용여부</dt>
							<dd>
								<select id="sel01_USE"></select>
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
			<div class="search-zone-info">
				<div class="search-wrap-info">
					<div class="sch-box-info">
						<dl>
							<dt>총원</dt>
							<dd>
								<input type="text" id="txt01_TOTAL" value="${UsersCount}" class="readonly ta-r">
							</dd>
						</dl>
						<dl>
							<dt>사용인원</dt>
							<dd>
								<input type="text" id="txt01_USE" class="readonly ta-r">
							</dd>
						</dl>
						<dl>
							<dt>미사용인원</dt>
							<dd>
								<input type="text" id="txt01_UNUSE" class="readonly ta-r">
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
	                            <h2 class="title1">휴가현황 목록</h2>
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
		 * AN1200	날짜별 연차현황
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
		
		commonCodeSelectAdd("sel01_DEPT", getCommonCode('DEPT'), 'Y');
		commonCodeSelectAdd("sel01_USE", getCommonCode('USE'), 'Y');

		/* Document가 로드되었을 때 실행되는 코드 */
		$(document).ready(function() {
			function init() {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
			}
			
			jQuery(window).on('resize.jqGrid', function () {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
			});
			
			// 화면ID, 화면ID사이즈(6:CM1000/13:CM1000_Detail), 다국어
			langHead = getLangCode("AN1200", 6, "${LANG}");
			
			document.getElementById('txt01_DATE').valueAsDate = new Date();
			
			setGrid();
			init(); //그리드 리사이징
		});

		function holidayUseCount() {
			setTimeout(() => {
				let rowData = $("#table1").getRowData($("#table1").getGridParam("selrow"));
				console.log('holidayUseCount rowData : ', rowData);
				let total = parseInt($("#txt01_TOTAL").val())
				let count = 0;
				rowData.forEach(data => {
					console.log(data);
					if (data.HOLIDAY_CNT != "") {
						count++;
					}
				});
				console.log('holidayUseCount count : ', count);
				$("#txt01_USE").val(count);
				$("#txt01_UNUSE").val(total - count);
			}, 100);
		}

		window.onload = () => {
			// holidayUseCount();
		};

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 버튼
		/* 검색 버튼 */
		$("#btn01_SEARCH").on({
			click: function(){
				searchGridData();
				// holidayUseCount();
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
					{name: 'USER_NM'			, align: 'center'	, width: '8%'	, hidden: false}				
					, {name: 'GRADE_CD'			, align: 'center' 	, width: '0%'	, hidden: true}									
					, {name: 'GRADE_NM'			, align: 'center' 	, width: '5%'	, hidden: false}									
					, {name: 'DEPT_CD'			, align: 'left'		, width: '0%'	, hidden: true}				
					, {name: 'DEPT_NM'			, align: 'left'		, width: '8%'	, hidden: false}				
					, {name: 'HOLIDAY_TYPE'		, align: 'center'	, width: '5%'	, hidden: false}				
					, {name: 'HOLIDAY_CNT'		, align: 'center'	, width: '5%'	, hidden: false}				
					, {name: 'HOLIDAY_START'	, align: 'center' 	, width: '8%'	, hidden: false}				
					, {name: 'HOLIDAY_END'		, align: 'center'	, width: '8%'	, hidden: false}					
					, {name: 'HOLIDAY_REASON'	, align: 'left'		, width: '15%'	, hidden: false}
				]
				, autowidth: false
				, shrinkToFit: false
				, rowNum : 1000
			});
			
			searchGridData();
			// holidayUseCount();
		};

		$("#txt01_USER_NM").keypress((e) => {
			if (e.key === "Enter") {
				searchGridData();
				// holidayUseCount();
			}
		});
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: CRUD
		/* Table 조회 */
		function searchGridData(){
			let searchParam = {
					DATE: $("#txt01_DATE").val(),
					DEPT: $("#sel01_DEPT").val(),
					USE: $("#sel01_USE").val(),
					USER_NM: $("#txt01_USER_NM").val()
			};

			getAjaxJsonData("an1200Sel", searchParam, "searchGridDataCallBack");
		};
		
		function searchGridDataCallBack(data){
			$("#table1").clearGridData();
			$("#table1").jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");

			$("#table1_cnt").text(data.length);

			let rowData = $("#table1").getRowData($("#table1").getGridParam("selrow"));
			let total = parseInt($("#txt01_TOTAL").val())
			let use = 0;
			let unUse = 0;
			rowData.forEach(data => {
				if (data.HOLIDAY_CNT != "") {
					use++;
				} else {
					unUse++;
				}
			});
			console.log('searchGridDataCallBack rowData.length : ', rowData.length);
			console.log('searchGridDataCallBack total : ', total);
			console.log('searchGridDataCallBack use : ', use);
			console.log('searchGridDataCallBack unUse : ', unUse);

			if (use > 0 && unUse == 0) {
				$("#txt01_USE").val(use);
				$("#txt01_UNUSE").val(rowData.length - use);
			} else if (use == 0 && unUse > 0) {
				$("#txt01_USE").val(rowData.length - unUse);
				$("#txt01_UNUSE").val(unUse);
			} else {
				$("#txt01_USE").val(use);
				$("#txt01_UNUSE").val(unUse);
			}
		};

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 유효성
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: Popup
		
	</script>
</html>