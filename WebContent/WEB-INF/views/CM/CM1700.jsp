<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<body>
		<!-- .contents-wrap 컨텐츠영역 START -->
		<div class="contents-wrap cm1700-page">
		 	<!-- .page-title-wrap 타이블영역 START -->
			<div class="page-title-wrap">
	            <div class="page-title">
					<h2>로그 조회</h2>
	                 <ul class="title-btn"></ul>
	             </div>
	            <div class="page-btn-wrap">
	               <ul>
		               <li><a href="javascript:void(0);" id="btn01_IFRAME_CLOSE" class="btn-close">닫기</a></li>
	               </ul>
	            </div>
	        </div>
			<div class="tab-wrap"> 
				<ul>
					<li class="on">
						<a href="javascript:validation();" id="tab01_CONNECT_INFO">접속조회</a>
					</li>
					<li>
						<a href="javascript:validation();" id="tab02_MENU_ACCESS">메뉴접근조회</a>
					</li>
					<li>
						<a href="javascript:validation();" id="tab03_AHTU_GROUP">권한그룹변경조회</a>
					</li>
					<li>
						<a href="javascript:validation();" id="tab04_USER_INFO">사용자정보변경조회</a>
					</li>
				</ul>
			</div>
			
			<div class="tab-cont-wrap">
				<div class="tab-cont-01 on">
					<div class="search-zone">
						<div class="search-wrap">
							<div class="sch-box">
								<dl class="dl-2n">
									<dt class="w100">검색기간</dt>
									<dd class="w230">
										<ul class="data-box">
											<li>
												<input type="date" id="dat01_START" size="12">
											</li>
										</ul>
									</dd>
									<dd class="w20">
										<ul class="data-box">
											<li>&nbsp;~&nbsp;</li>
										</ul>
									</dd>
									<dd class="w230">
										<ul class="data-box">
											<li>
												<input type="date" id="dat01_END" size="12">
											</li>
										</ul>
									</dd>
								</dl>
							</div>
							<div class="srch-btn">
                				<ul>
                    				<li><a href="javascript:void(0);" id="btn01_SEARCH" class="btn-search" title="검색">검색</a></li>
                				</ul>
            				</div>
						</div>
					</div>
					<div class="row row-1 row-wrap-tab-src">
						<div class="col col-1 wp100">
							<section>
								<div class="title-wrap">
									<div class="title-zone">
										<h2 class="title1">접속조회 목록</h2>
										<span id="table1_cnt">0</span>
									</div>
									<div class="btn-right-box">
						               <ul>
											<li><a href="javascript:void(0);" id="btn01_EXCEL">엑셀</a></li>
						                </ul>
	                				</div>
								</div>
								<div class="table-wrap">
									<table id="table1"></table>
								</div>
							</section>
						</div>
					</div>	
				</div>
					
				<div class="tab-cont-02 on" style="display: none;">
					<div class="search-zone">
							<div class="search-wrap">
								<div class="sch-box">
									<dl class="dl-2n">
										<dt class="w100">검색기간</dt>
										<dd class="w230">
											<ul class="data-box">
												<li>
													<input type="date" id="dat01_START01" size="12">
												</li>
											</ul>
										</dd>
										<dd class="w20">
											<ul class="data-box">
												<li>&nbsp;~&nbsp;</li>
											</ul>
										</dd>
										<dd class="w230">
											<ul class="data-box">
												<li>
													<input type="date" id="dat01_END01" size="12">
												</li>
											</ul>
										</dd>
									</dl>
								</div>
								<div class="srch-btn">
	                				<ul>
	                    				<li><a href="javascript:void(0);" id="btn02_SEARCH" class="btn-search" title="검색">검색</a></li>
	                				</ul>
	            				</div>
            				</div>
						</div>
					<div class="row row-1 row-wrap-tab-src">
						<div class="col col-1 wp100">
							<section>
								<div class="title-wrap">
									<div class="title-zone">
										<h2 class="title2">메뉴접근조회 목록</h2>
										<span id="table2_cnt">0</span>
									</div>
									<div class="btn-right-box">
						               <ul>
											<li><a href="javascript:void(0);" id="btn01_EXCEL">엑셀</a></li>
						                </ul>
	                				</div>
								</div>
								<div class="table-wrap">
									<table id="table2"></table>	
								</div>
							</section>
						</div>
					</div>
				</div>
					
				<div class="tab-cont-03 on" style="display: none;">
					<div class="search-zone">
						<div class="search-wrap">
							<div class="sch-box">
								<dl class="dl-2n">
									<dt class="w100">검색기간</dt>
									<dd class="w230">
										<ul class="data-box">
											<li>
												<input type="date" id="dat01_START02" size="12">
											</li>
										</ul>
									</dd>
									<dd class="w20">
										<ul class="data-box">
											<li>&nbsp;~&nbsp;</li>
										</ul>
									</dd>
									<dd class="w230">
										<ul class="data-box">
											<li>
												<input type="date" id="dat01_END02" size="12">
											</li>
										</ul>
									</dd>
								</dl>
							</div>
							<div class="srch-btn">
	               				<ul>
	                   				<li><a href="javascript:void(0);" id="btn03_SEARCH" class="btn-search" title="검색">검색</a></li>
	               				</ul>
	           				</div>
						</div>
					</div>
					<div class="row row-1 row-wrap-tab-src">
						<div class="col col-1 wp100">
							<section>
								<div class="title-wrap">
									<div class="title-zone">
										<h2 class="title3">권한그룹변경조회 목록</h2>
										<span id="table3_cnt">0</span>
									</div>
									<div class="btn-right-box">
						               <ul>
											<li><a href="javascript:void(0);" id="btn01_EXCEL">엑셀</a></li>
						                </ul>
	                				</div>
								</div>
								<div class="table-wrap">
									<table id="table3"></table>
								</div>
							</section>
						</div>
					</div>
				</div>
					
				<div class="tab-cont-04 on" style="display: none;">
					<div class="search-zone">
						<div class="search-wrap">
							<div class="sch-box">
								<dl class="dl-2n">
									<dt class="w100">검색기간</dt>
									<dd class="w230">
										<ul class="data-box">
											<li>
												<input type="date" id="dat01_START03" size="12">
											</li>
										</ul>
									</dd>
									<dd class="w20">
										<ul class="data-box">
											<li>&nbsp;~&nbsp;</li>
										</ul>
									</dd>
									<dd class="w230">
										<ul class="data-box">
											<li>
												<input type="date" id="dat01_END03" size="12">
											</li>
										</ul>
									</dd>
								</dl>
							</div>
							<div class="srch-btn">
	               				<ul>
	                   				<li><a href="javascript:void(0);" id="btn04_SEARCH" class="btn-search" title="검색">검색</a></li>
	               				</ul>
	           				</div>
						</div>
					</div>
					<div class="row row-1 row-wrap-tab-src">
						<div class="col col-1 wp100">
							<section>
								<div class="title-wrap">
									<div class="title-zone">
										<h2 class="title4">사용자정보변경조회 목록</h2>
										<span id="table4_cnt">0</span>
									</div>
									<div class="btn-right-box">
						               <ul>
											<li><a href="javascript:void(0);" id="btn01_EXCEL">엑셀</a></li>
						                </ul>
	                				</div>
								</div>
								<div class="table-wrap">
									<table id="table4"></table>
								</div>
							</section>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	
	<script type="text/javascript">
		/**
		 * CM1700	로그조회
		 * -------------------------------------------------------------------
		 * 01. 공통코드
		 * 02. 버튼
		 * 03. 그리드
		 * 04. CRUD
		 * 05. 유효성
		 * -------------------------------------------------------------------
		 */
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 공통코드
		/* 공통코드_다국어 */
		var langTap1;
		var langTap2;
		var langTap3;
		var langTap4;
	
		/* Document가 로드되었을 때 실행되는 코드 */
		$(document).ready(function() {
			function init() {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()), true);
				jQuery("#table2").jqGrid('setGridWidth', (jQuery(".table-wrap").width()), true);
				jQuery("#table3").jqGrid('setGridWidth', (jQuery(".table-wrap").width()), true);
				jQuery("#table4").jqGrid('setGridWidth', (jQuery(".table-wrap").width()), true);
			}
			
			jQuery(window).on('resize.jqGrid', function () {
				var selOption = $('.tab-wrap').find('li[class=on]').find("a")[0].id;
				var nowTableWrapWidth = $($('.tab-cont-wrap').children('div[style=""]').children(".table-wrap")).width();
				
				if(selOption == "tab01_CONNECT_INFO"){
					jQuery("#table1").jqGrid('setGridWidth', nowTableWrapWidth, true);
				} else if(selOption == "tab02_MENU_ACCESS"){
					jQuery("#table2").jqGrid('setGridWidth', nowTableWrapWidth, true);
				} else if(selOption == "tab03_AHTU_GROUP"){
					jQuery("#table3").jqGrid('setGridWidth', nowTableWrapWidth, true);
				} else if(selOption == "tab04_USER_INFO"){
					jQuery("#table4").jqGrid('setGridWidth', nowTableWrapWidth, true);
				}
			});
			
			// 화면ID, 화면ID사이즈(6:CM1000/13:CM1000_Detail), 다국어
			langTap1 = getLangCode("CM1700" , 11, "${LANG}");
			langTap2 = getLangCodeDetail("CM1700_Tap2" , 11, "${LANG}");
			langTap3 = getLangCodeDetail("CM1700_Tap3" , 11, "${LANG}");
			langTap4 = getLangCodeDetail("CM1700_Tap4" , 11, "${LANG}");
			
			lastweek(); //현재일자 기준 일주일 전까지 날짜 생성
			setGrid(); //jqgird 틀 생성
			init(); //grid resize 
		});

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 버튼
		/* 엑셀 버튼 */
		$("#btn01_EXCEL").on({
			click: function(){
				var selOption = $('.tab-wrap').find('li[class=on]').find("a")[0].id;
				
				if(selOption == "tab01_CONNECT_INFO"){
					exportExcel("table1", "접속조회");
				}
				if(selOption == "tab02_MENU_ACCESS"){
					exportExcel("table2", "메뉴접근조회");
				}
				if(selOption == "tab03_AHTU_GROUP"){
					exportExcel("table3", "권한그룹변경조회");
				}
				if(selOption == "tab04_USER_INFO"){
					exportExcel("table4", "사용자정보변경조회");
				}
			}
		});
		 
		/* 접속조회 검색버튼 */
		$("#btn01_SEARCH").on({
			click: function() {
				showLoding();
				validation();

				setTimeout(function() {
					closeLoading();
				}, 500);
			}
		});
		
		 /* 메뉴접근조회 검색버튼 */
		$("#btn02_SEARCH").on({
			click: function() {
				showLoding();
				validation();

				setTimeout(function() {
					closeLoading();
				}, 500);
			}
		});
		
		/* 권한그룹변경조회 검색버튼 */
		$("#btn03_SEARCH").on({
			click: function() {
				showLoding();
				validation();

				setTimeout(function() {
					closeLoading();
				}, 500);
			}
		});

		/* 권한그룹변경조회 검색버튼 */
		$("#btn04_SEARCH").on({
			click: function() {
				showLoding();
				validation();

				setTimeout(function() {
					closeLoading();
				}, 500);
			}
		});

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 그리드
		/* jqGrid 셋팅 */
		function setGrid(){
			var gridHeight = getGridHeight();
			$("#table1").jqGrid({
				mtype: 'POST'
				, datatype: 'local'
				, height : gridHeight
				, jsonReader: {
					repeatitems: false
				}
				, colNames: langTap1
				, colModel: [
					{name: 'SESSION_ID'			, align:'left'		, width: '40%'}
					, {name: 'DEPT_NAME'		, align:'left'		, width: '10%'}
					, {name: 'USER_NAME'		, align:'left'		, width: '10%'}
					, {name: 'CONNECT_IP'		, align:'left'		, width: '15%'}
					, {name: 'CONNECT_START_DT'	, align:'center'	, width: '15%'}
				]
				, autowidth: false
				, shrinkToFit: false
				, rowNum : 500
				, scroll : true
			});
			
		   $("#table2").jqGrid({
				mtype: 'POST'
				, datatype: 'local'
				, height : gridHeight
				, jsonReader: {
					repeatitems: false
				}
				, colNames: langTap2
				, colModel: [
					{name: 'MENU_NAME'		, align:'left' 		, width: '40%'}
					, {name: 'DEPT_NAME'	, align:'left' 		, width: '10%'}
					, {name: 'USER_NAME'	, align:'left' 		, width: '10%'}
					, {name: 'USER_IP'		, align:'left' 		, width: '15%'}
					, {name: 'PROCESS_DT'	, align:'center' 	, width: '15%'}
				]
				, autowidth: false
				, shrinkToFit: false
				, rowNum : 500
				, scroll : true
			});
		
			 $("#table3").jqGrid({
				mtype: 'POST'
				, datatype: 'local'
				, height : gridHeight
				, jsonReader: {
					repeatitems: false
				}
				, colNames: langTap3
				, colModel: [
					{name: 'EVNT_NM'		, align:'left'		, width: '40%'}
					, {name: 'DEPT_NAME'	, align:'left' 		, width: '10%'}
					, {name: 'USER_NAME'	, align:'left' 		, width: '10%'}
					, {name: 'USER_IP'		, align:'left' 		, width: '15%'}
					, {name: 'PROCESS_DT'	, align:'center' 	, width: '15%'}
				]
				, autowidth: false
				, shrinkToFit: false
				, rowNum : 500
				, scroll : true
			});  

			 $("#table4").jqGrid({
				mtype: 'POST'
				, datatype: 'local'
				, height : gridHeight
				, jsonReader: {
					repeatitems: false
				}
				, colNames: langTap4
				, colModel: [
					{name: 'SYS_ID'			, align: 'center'	, width: '5%'	, hidden: false}
					, {name:'PROCESS_DT'	, align: 'center'	, width: '15%'	, hidden: false}
					, {name:'REG_USER'		, align: 'left'		, width: '8%'	, hidden: false}
					, {name:'REG_IP'		, align: 'left'		, width: '10%'	, hidden: false}
					, {name:'EVNT_NM'		, align: 'left'		, width: '10%'	, hidden: false}
					, {name:'EVNT_SVRY'		, align: 'center'	, width: '7%'	, hidden: false}
					, {name:'HOST_NM'		, align: 'left'		, width: '7%'	, hidden: false}
					, {name:'EQ_ORG_NO'		, align: 'left'		, width: '8%'	, hidden: true}
					, {name:'USER_ID'		, align: 'left'		, width: '8%'	, hidden: false}
					, {name:'USER_NM'		, align: 'center'	, width: '10%'	, hidden: false}
					, {name:'DEPT_NM'		, align: 'left'		, width: '10%'	, hidden: false}
					, {name:'GRADE'			, align: 'left'		, width: '8%'	, hidden: false}
					, {name:'ENTER_DT'		, align: 'center'	, width: '10%'	, hidden: false}
				]
				, autowidth: true				
				, shrinkToFit: true
				, rowNum : 500
				, scroll : true
			});  
		 
		 	searchGridData();
		};

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: CRUD
		/* Table 조회 */
		function searchGridData(){
			var selOption = $('.tab-wrap').find('li[class=on]').find("a")[0].id;
			var logType = selOption.substring(6, selOption.length);
			
			var searchParam = {
				LOG_SEL : logType 
			    , STARTDT_NUM : $("#dat01_START02").val()
				, ENDDT_NUM :	$("#dat01_END02").val()
			};
			
			getAjaxJsonData("cm1700LogSel", searchParam, "searchGridDataCallBack");
		};
		
		function searchGridDataCallBack(data) {
			var selOption = $('.tab-wrap').find('li[class=on]').find("a")[0].id;
			
			if(selOption == "tab01_CONNECT_INFO"){
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
			} else if(selOption == "tab02_MENU_ACCESS"){
				$("#table2").clearGridData();
				$('#table2').jqGrid('setGridParam', {
					datatype: 'local'
					, data: data
				}).trigger("reloadGrid");

				if(data.length > 0){
					$("#table2_cnt").text(comma(data.length));
				} else {
					$('#table2_cnt').text(0);
				}
			} else if(selOption == "tab03_AHTU_GROUP"){
				$("#table3").clearGridData();
				$('#table3').jqGrid('setGridParam', {
					datatype: 'local'
					, data: data
				}).trigger("reloadGrid");

				if(data.length > 0){
					$("#table3_cnt").text(comma(data.length));
				} else {
					$('#table3_cnt').text(0);
				}
			} else if(selOption == "tab04_USER_INFO"){
				$("#table4").clearGridData();
				$('#table4').jqGrid('setGridParam', {
					datatype: 'local'
					, data: data
				}).trigger("reloadGrid");

				if(data.length > 0){
					$("#table4_cnt").text(comma(data.length));
				} else {
					$('#table4_cnt').text(0);
				}
			}
		};

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 유효성
		/* 시작일 & 종료일 날짜 유효성 검사 */
		function validation(){
			var selOption = $('.tab-wrap').find('li[class=on]').find("a")[0].id;
			
			var startDate = $("#dat01_START").val();
			var endDate = $("#dat01_END").val();
			var startDate01 = $("#dat01_START01").val();
			var endDate01 = $("#dat01_END01").val();
			var startDate02 = $("#dat01_START02").val();
			var endDate02 = $("#dat01_END02").val();
			var startDate03 = $("#dat01_START03").val();
			var endDate03 = $("#dat01_END03").val();
			
			//-을 구분자로 연,월,일로 잘라내어 배열로 반환
		    var startArray = startDate.split('-');
		    var endArray = endDate.split('-');
		    var startArray01 = startDate01.split('-');
		    var endArray01 = endDate01.split('-');
		    var startArray02 = startDate02.split('-');
		    var endArray02 = endDate02.split('-');
		    var startArray03 = startDate03.split('-');
		    var endArray03 = endDate03.split('-');
			
		    //배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성
			var start_date = new Date(startArray[0], startArray[1], startArray[2]);
			var end_date = new Date(endArray[0], endArray[1], endArray[2]);
			var start_date01 = new Date(startArray01[0], startArray01[1], startArray01[2]);
			var end_date01 = new Date(endArray01[0], endArray01[1], endArray01[2]);
			var start_date02 = new Date(startArray02[0], startArray02[1], startArray02[2]);
			var end_date02 = new Date(endArray02[0], endArray02[1], endArray02[2]);
			var start_date03 = new Date(startArray03[0], startArray03[1], startArray03[2]);
			var end_date03 = new Date(endArray03[0], endArray03[1], endArray03[2]);
			
			//날짜를 숫자형태의 날짜 정보로 변환하여 비교한다.      
			if(selOption == "tab01_CONNECT_INFO"){
				if(start_date.getTime() > end_date.getTime()){
					 toast("경고", "종료날짜보다 시작날짜가 클 수 없습니다.", "error");
					 return false;
				}	
			}
			if(selOption == "tab02_MENU_ACCESS"){
				if(start_date01.getTime() > end_date01.getTime()){
					 toast("경고", "종료날짜보다 시작날짜가 클 수 없습니다.", "error");
					 return false;
				}	
			}
			if(selOption == "tab03_AHTU_GROUP"){
				if(start_date02.getTime() > end_date02.getTime()){
					 toast("경고", "종료날짜보다 시작날짜가 클 수 없습니다.", "error");
					 return false;
				}	
			}
			if(selOption == "tab04_USER_INFO"){
				if(start_date03.getTime() > end_date03.getTime()){
					 toast("경고", "종료날짜보다 시작날짜가 클 수 없습니다.", "error");
					 return false;
				}	
			}
			
			searchGridData();
		}
		
		/* 현재날짜 & 현재날짜 기준 7일전 날짜 */
		function lastweek(){
			var nowDate = new Date();
			var nowYear = nowDate.getFullYear();
			var nowMonth = nowDate.getMonth() + 1;
			var nowDay = nowDate.getDate();
			
			if(nowMonth < 10)
				nowMonth = "0" + nowMonth;
			if(nowDay < 10)
				nowDay = "0" + nowDay; 
			
			var todayDate = nowYear + "-" + nowMonth + "-" + nowDay; //현재 날짜 가져오기
			var weekDate = nowDate.getTime() - (7 * 24 * 60 * 60 * 1000); 
			
			nowDate.setTime(weekDate);
			
			var weekYear = nowDate.getFullYear();
			var weekMonth = nowDate.getMonth() + 1;
			var weekDay = nowDate.getDate();
			
			if(weekMonth < 10)
				weekMonth = "0" + weekMonth;
			if(weekDay < 10)
				weekDay = "0" + weekDay;
			
			var resultDate = weekYear + "-" + weekMonth + "-" + weekDay; //현재일자에서 7일전 날짜 가져오기
			
			$('#dat01_END').val(todayDate);
			$('#dat01_START').val(resultDate);
		
			$('#dat01_END01').val(todayDate);
			$('#dat01_START01').val(resultDate);	 
			
			$('#dat01_END02').val(todayDate);
			$('#dat01_START02').val(resultDate);
			
			$('#dat01_END03').val(todayDate);
			$('#dat01_START03').val(resultDate);
		} 
	</script>
</html>