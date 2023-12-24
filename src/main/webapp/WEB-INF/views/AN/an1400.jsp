<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
	input[type="date"] {
		max-width: 100%;
	}
</style>
	<body>
		<!-- .contents-wrap 컨텐츠영역 START -->
		<div class="contents-wrap an1400-page">
			<!-- .page-title-wrap 타이블영역 START -->
			<div class="page-title-wrap">
				<div class="page-title">
					<h2>공휴일 및 공식휴무일 관리</h2>
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
							<dt>종류</dt>
							<dd>
								<select id="sel01_TYPE" class="w160"></select>
							</dd>
						</dl>
						<dl>
							<dt>연도</dt>
							<dd>
								<select id="sel01_YEAR" class="w160"></select>
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
								<h2 class="title1">공휴일 및 공식휴무일 목록</h2>
								<span id="table1_cnt">0</span>
							</div>
							<div class="btn-right-box">
								<ul>
									<li><a href="javascript:void(0);" id="btn01_DATE_DELETE">삭제</a></li>
									<li><a href="javascript:void(0);" id="btn01_DATE_INSERT">추가</a></li>
									<li><a href="javascript:void(0);" id="btn01_DATE_UPDATE">수정</a></li>
								</ul>
							</div>
						</div>
						<div class="table-wrap">
							<table id="table1"></table>
						</div>
					</section>
				</div>
			</div>
		<!-- .contents-wrap 컨텐츠영역 END -->
		
		<!-- .modal-cont 팝업영역 START -->
		<div id="viewForm1" style="display: none;">
			<div class="modal-cont">
				<div class="row row-1">
					<div class="col col-1 wp100">
						<section>
							<table class="table-write2">
								<caption>공휴일 및 공식휴무일 내역</caption>
								<colgroup>
									<col class="wp20">
									<col class="wp30">
								</colgroup>
								<tbody>
									<tr>
										<th class="req">1.종류</th>
										<td>
											<select id="pop01_sel01_TYPE" class="wp100" />
										</td>
									</tr>
									<tr>
										<th class="req">2.휴무명</th>
										<td>
											<input type="text" id="pop01_txt01_NAME" class="wp100" />
										</td>
									</tr>
									<tr>
										<th class="req">3.날짜</th>
										<td>
											<input type="date" id="pop01_date01_DATE" class="wp100">
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
		 * AN1400	공휴일 및 공식휴무일 관리
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
		
		/* Document가 로드되었을 때 실행되는 코드 */
		$(document).ready(function() {			
			function init() {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
			}
			
			jQuery(window).on('resize.jqGrid', function () {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
			});
			
			$("#sel01_USE_YN").find("option:eq(1)").prop("selected", "selected");
			
			langHead = ["구분", "시퀀스", "연도", "종류", "휴무명", "날짜", "요일", "등록일"];

			setGrid();
			init(); //그리드 리사이징
			getAjaxJsonData("/an1400/years", "", "getYearCallback", "GET");
			setType();
		});
		
		// 버튼 및 Select Tag Start
		/**
		 * 추가 버튼 클릭 시
		 */
		$("#btn01_DATE_INSERT").on("click", () => {
			openPopup("C");
		});

		// 버튼 및 Select Tag Start
		/**
		 * 수정 버튼 클릭 시
		 */
		$("#btn01_DATE_UPDATE").on("click", () => {
			openPopup("U");
		});

		/**
		 * 삭제 버튼 클릭 시
		 */
		$("#btn01_DATE_DELETE").on("click", () => {
			let data = $("#table1").getRowData($("#table1").getGridParam("selrow"));
			if (data instanceof Array) {
				toast("정보", "삭제할 목록을 선택해 주세요.", "info");
			} else {
				confirms("삭제하시겠습니까?", "D");
			}
		});

		/**
		 * Select Tag 연도 변경 시
		 */
		$("#sel01_YEAR").on("change", () => searchUrl());

		/**
		* Select Tag 연도 변경 시
		*/
		$("#sel01_TYPE").on("change", () => searchUrl());

		/**
		 * 검색 버튼 클릭 시
		 */
		$("#btn01_SEARCH").on("click", () => searchUrl());
		// 버튼 및 Select Tag End

		// confirm Start
		/**
		 * confirm 확인 버튼 클릭 시 수행되는 함수
		 * @param action
		 */
		function confirmYes(action){
			if(action === "C"){
				let param = {
						type : $("#pop01_sel01_TYPE").val(),
						name : $("#pop01_txt01_NAME").val(),
						date : $("#pop01_date01_DATE").val(),
						searchType: $("#sel01_TYPE").val(),
						searchYear : $("#sel01_YEAR").val()
				};
				getAjaxJsonData("/an1400", param, "searchGridCallback", "POST");
				$("#viewForm1").dialog("close");
			} else if(action === "D"){
				let data = $("#table1").getRowData($("#table1").getGridParam("selrow"));
				console.log(data);
				let param = {
					number : data.number,
					type : data.type == "회사휴무일" ? "office" : "public",
					date : data.date,
					regDt : data.regDt,
					searchType: $("#sel01_TYPE").val(),
					searchYear : $("#sel01_YEAR").val()
				};
				getAjaxJsonData("/an1400", param, "searchGridCallback", "DELETE");
			} else if (action === "U") {
				let data = $("#table1").getRowData($("#table1").getGridParam("selrow"));
				let param = {
					number : data.number,
					type : $("#pop01_sel01_TYPE").val(),
					name : $("#pop01_txt01_NAME").val(),
					date : $("#pop01_date01_DATE").val(),
					regDt : data.regDt,
					searchType: $("#sel01_TYPE").val(),
					searchYear : $("#sel01_YEAR").val()
				};
				getAjaxJsonData("/an1400", param, "searchGridCallback", "PATCH");
				$("#viewForm1").dialog("close");
			}
		}
		// confirm End
		
		// 그리드 Start
		/**
		 * 그리드 초기 설정
		 */
		function setGrid(){
			$("#table1").jqGrid({
				mtype: 'POST',
				datatype: 'local',
				height: 540,
				jsonReader: {
					repeatitems: false
				},
				colNames: langHead,
				colModel: [
					{name: 'num',  align: 'center', width: '25%'},
					{name: "number", hidden: true},
					{name: 'year', align: 'center', width: '25%'},
					{name: 'type', align: 'center', width: '25%',
						formatter: (cellValue, options, rowObject) => {
							return  cellValue == "public" ? "공휴일" : "회사휴무일"
						}},
					{name: 'name', align: 'center', width: '25%'},
					{name: 'date', align: 'center', width: '25%'},
					{name: 'weekday', align: 'center', width: '25%'},
					{name: 'regDt', hidden: true},
				],
				autowidth: true,		// 컬럼 사이즈 조절시 필요 (true)
				shrinkToFit: false,	// 컬럼 사이즈 조절시 필요 (false)
				viewrecords: false,
				rowNum : 5000,
				onSelectRow: function (rowid, status, e) {

				},
				ondblClickRow: function (rowid, iRow, iCol, e) {
					openPopup("U");
				}
			});

			getAjaxJsonData("/an1400/dates", "", "searchGridCallback", "GET");
		};
		// 그리드 End

		// CRUD 및 기타 설정 Start
		/**
		 * URL 및 Data 호출
		 */
		function searchUrl() {
			let url = "/an1400/dates?year=" + $("#sel01_YEAR").val() +"&type=" + $("#sel01_TYPE").val();
			getAjaxJsonData(url, "", "searchGridCallback", "GET");
		}

		/**
		 * getAjaxJsonData 콜백함수
		 * Data를 그리드에 설정
		 * @param data
		 */
		function searchGridCallback(data) {
			$("#table1").clearGridData();
			$('#table1').jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");

			document.querySelector("#table1_cnt").innerText = data.length;
		};

		/**
		 * getAjaxJsonData 콜백함수
		 * 등록된 공휴일, 회사휴무일의 연도 가져와서 Select Tag에 추가
		 * @param datas : YEAR
		 */
		function getYearCallback(datas) {
			$("#sel01_YEAR").html("");
			$("#sel01_YEAR").append("<option value ='All'>전체</option>");
			datas.forEach(data => {
				$("#sel01_YEAR").append("<option value =" + data.YEAR + ">" + data.YEAR + "</option>");
			});
		}

		/**
		 *  Select Tag에 추가
		 */
		function setType() {
			const type = [
				{
					value: "office",
					text: "회사휴무일"
				},
				{
					value: "public",
					text: "공휴일"
				}
			];
			$("#sel01_TYPE").html("");
			$("#sel01_TYPE").append("<option value ='All'>전체</option>");
			type.forEach(type => {
				$("#sel01_TYPE").append("<option value =" + type.value + ">" + type.text + "</option>");
			});

			$("#pop01_sel01_TYPE").html("");
			type.forEach(type => {
				$("#pop01_sel01_TYPE").append("<option value =" + type.value + ">" + type.text + "</option>");
			});
		}
		// CRUD 및 기타 설정 End

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 유효성
		// Popup Start
		/**
		 * 팝업 열기
		 * @param action
		 */
		function openPopup(action) {
			// 화면ID, 화면ID사이즈(ex. 6:CM1000 / 13:CM1000_Detail), 팝업ID, 다국어
			let returnPopup = getLangCodePopup("CM1000_Pop1", 11, "viewForm1", "${LANG}");
			let titlePop = returnPopup[0];
			let pop01_btn01_SAVE = returnPopup[1];
			let pop01_btn01_CLOSE = returnPopup[2];
			
			$("#viewForm1").dialog({
				autoOpen : true,
				title : titlePop,
				width : 600,
				height : 300,
				modal : true,
				open : function(event, ui) {
					popReset("viewForm1");

					if (action === "U") {
						let rowData = $("#table1").getRowData($("#table1").getGridParam("selrow"));
						$("#pop01_sel01_TYPE").attr("disabled",true);
						document.querySelectorAll("#pop01_sel01_TYPE option").forEach(item => {
							if (item.innerText == rowData.type) {
								item.setAttribute("selected", "true");
							}
						});
						$("#pop01_txt01_NAME").val(rowData.name);
						$("#pop01_date01_DATE").val(rowData.date);
					}
				},
				close : function() {
					$(this).dialog("close");
				},
				buttons : [
					{
						text : pop01_btn01_SAVE,
						click : function() {
							if ($("#pop01_txt01_NAME").val() == "") {
								toast("정보", "휴무명을 확인해주시기 바랍니다.", "info");
								return;
							}
							if ($("#pop01_date01_DATE").val() == "") {
								toast("정보", "날짜를 확인해주시기 바랍니다.", "info");
								return;
							}
							confirms((action === "C" ? "저장하시겠습니까?" : "수정하시겠습니까?"), action);
						}
					},
					{
						text : pop01_btn01_CLOSE,
	                    click : function() {
							$(this).dialog("close");
						}
					}
				]
			}).css("z-index", 1000).prev(".ui-dialog-titlebar").css("background", "#266f80").css("color", "#fff");
		};
		// Popup End
	</script>
</html>