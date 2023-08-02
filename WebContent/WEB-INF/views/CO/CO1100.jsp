<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<style>
		.table-wrap .ui-jqgrid-bdiv{overflow-y:scroll; height:88% !important; max-height:calc(100% - 37px); background-color:#f9f9f9;
	</style>
	<body>
		<!-- .contents-wrap 컨텐츠영역 START -->
		<div class="contents-wrap an1100-page">
			<!-- .page-title-wrap 타이블영역 START -->
			<div class="page-title-wrap">
				<div class="page-title">
					<h2>개인별 사용내역 등록</h2>
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
							<dt>조회기간</dt>
							<dd>
								<input type="month" id="date01_DATE" pattern="[0-9]{4}-[0-9]{2}">
							</dd>
						</dl>
						<dl class="dl-2n">
							<dt>카드번호</dt>
							<dd>
								<select id="sel01_COMPANY" class="w250"></select>
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
								<span id="table1_cnt">0</span>
	                        </div>
							<div class="btn-right-box">
								<ul>
									<li><a href="javascript:void(0);" id="btn01_PRINT">출력</a></li>
									<li><a href="javascript:void(0);" id="btn01_UPDATE">수정</a></li>
									<li><a href="javascript:void(0);" id="btn01_SAVE">저장</a></li>
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
		<!-- 카드 사용내역 수정 팝업 -->
		<div id="viewForm1" style="display: none;">
			<div class="modal-cont">
				<div class="row row-1">
					<div class="col col-1 wp100">
						<section>
							<table class="table-write">
								<caption>개인별 사용내역</caption>
								<colgroup>
									<col class="wp20">
									<col class="wp30">
									<col class="wp20">
									<col class="wp30">
								</colgroup>
								<tbody>
								<tr>
									<th class="req">1.사용일자</th>
									<td>
										<input type="date" id="pop01_date01_USE" Placeholder="사용일자" size="12" class="readonly">
									</td>
									<th>2.계정과목</th>
									<td>
										<select id="pop01_sel01_ACCOUNT_SUB"></select>
									</td>
								</tr>
								<tr>
									<th class="req">3.프로젝트명</th>
									<td colspan="3">
										<div class="input-srch">
											<input type="text" id="pop01_txt01_SALE" placeholder="판품번호" class="readonly wp100" readonly="readonly" style="display: none;">
											<input type="text" id="pop01_txt01_PROJECT" placeholder="프로젝트명" class="readonly wp100" readonly="readonly">
											<a href="javascript:void(0);" id="pop01_btn01_SALES" class="btn-srch"></a>
										</div>
									</td>
								</tr>
								<tr>
									<th class="req">4.거래처</th>
									<td>
										<input type="text" id="pop01_txt01_ACCOUNT" placeholder="거래처">
									</td>
									<th class="req">5.내역</th>
									<td>
										<input type="text" id="pop01_txt01_BREAKDOWN" placeholder="내역">
									</td>
								</tr>
								<tr>
									<th class="req">6.승인금액</th>
									<td>
										<input type="text" id="pop01_txt01_APPROVAL" placeholder="승인금액" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="ta-r">
									</td>
									<th>7.취소금액</th>
									<td>
										<input type="text" id="pop01_txt01_REFUND" placeholder="취소금액" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="ta-r">
									</td>
								</tr>
								<tr>
									<th>8.비고</th>
									<td colspan="3">
										<input type="text" id="pop01_txt01_MEMO">
									</td>
								</tr>
								<tr class="dis-n">
									<th>9.카드사</th>
									<td>
										<input type="text" id="pop01_txt01_COMPANY">
									</td>
									<th>10.카드번호</th>
									<td>
										<input type="text" id="pop01_txt01_CARD_NUM">
									</td>
								</tr>
								</tbody>
							</table>
						</section>
					</div>
				</div>
			</div>
		</div>

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
		<!-- .modal-cont 팝업영역 END -->
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
		var langPop2;

		var SALES_NUMSelect = "";
		var ACCOUNT_SUBSelect = "";

		var chkEditForm = false;
		var lastid = 0;

		commonCodeSelectAddMulti("sel01_COMPANY", getCommonCodeCard('CARD'), 'Y');
		commonCodeSelectAdd("pop01_sel01_ACCOUNT_SUB", getCommonCodeEsc('ACCOUNT'), 'N');

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
			langPop2 = getLangCodeDetail("CO1100_Pop2", 11, "${LANG}");
			
			document.getElementById('date01_DATE').value= new Date().toISOString().slice(0, 7);

			new Promise(function(resolve, reject) {
				selectBox();
				return resolve();
			}).then(function() {
				setTimeout(function() {
					setGrid();
					init(); //그리드 리사이징
				}, 500);
			});
		});

		function setButton(action) {
			if(action == "init") {
				$("#btn01_SAVE").addClass('disable');
			} else if(action == "update") {
				$("#btn01_SAVE").removeClass('disable');
			}
		}

		function selectBox() {
			getAjaxData("selectLists?LIST_TYPE=ACCOUNT", '', 'ACCOUNT_SUBSelectCallBack');
			getAjaxData("selectSalesNum", '', 'SALES_NUMSelectCallBack');
		}

		function SALES_NUMSelectCallBack (res) {
			var kLength = res.length - 1;

			$.each(res, function(index, item) {
				if (index == kLength) {
					SALES_NUMSelect += item.CODE + ":" + item.VALUE;
				} else {
					SALES_NUMSelect += item.CODE + ":" + item.VALUE + ";";
				}
			});
		}

		function ACCOUNT_SUBSelectCallBack (res) {
			var kLength = res.length - 1;

			$.each(res, function(index, item) {
				if (index == kLength) {
					ACCOUNT_SUBSelect += item.CODE + ":" + item.VALUE;
				} else {
					ACCOUNT_SUBSelect += item.CODE + ":" + item.VALUE + ";";
				}
			});
		}

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 버튼
		/* 검색 버튼 */
		$("#btn01_SEARCH").on({
			click: function(){
				searchGridData();
			}
		});

		/* 출력 버튼 */
		$("#btn01_PRINT").on({
			click: function(e){
				e.preventDefault();

				if($("#sel01_COMPANY option:checked").text().split(/\s+/g)[0] == "전체") {
					alert("카드번호를 선택해 주세요.");
					return false;
				} else if($("#table1_cnt").text() == "0") {
					toast("경고", "출력할 데이터가 없습니다.", "error");
					return false;
				} else {
					var params = "?COMPANY=" + $("#sel01_COMPANY").val() + "&CARD_NUM=" + $("#sel01_COMPANY option:checked").text().split(/\s+/g)[1] + "&DATE=" + $("#date01_DATE").val();
					var url = "co1100Print";
					window.open(url + params, 'co1100Print', 'width=1025,height=1000,top=10,left=10,toolbar=no,menubar=no,lacation=no,scrollbars=no,status=no');
				}
			}
		});

		$("#btn01_UPDATE").on({
			click: function(e){
				e.preventDefault();
				console.log('btn01_UPDATE ', chkEditForm);
				chkEditForm = true;
				setButton('update');
				buttonFormat();

				var grid = $("#table1");
				var ids = grid.jqGrid('getDataIDs');

				for (var i = 0; i < ids.length; i++) {
					grid.jqGrid('editRow',ids[i]);
					grid.jqGrid('setCell', ids[i], 'rowStatus', '수정');
					$("tr#" + ids[i], grid).addClass('update');
				}
			}
		});

		$("#btn01_SAVE").on({
			click: function(e){
				e.preventDefault();

				if (!$(this).hasClass('disable')) {
					chkEditForm = false;
					buttonFormat();

					var grid = $("#table1");
					var ids = grid.jqGrid('getDataIDs');

					for (var i = 0; i < ids.length; i++) {
						grid.jqGrid('saveRow', ids[i]);
					}

					var formArray = ['SA1000DataForm'];
					var chk = checkRequiredValidation(formArray);

					if (chk) {
						confirms("수정중인 데이터를 저장하시겠습니까?", "U");
					} else {
						alert('수정중인 데이터가 없습니다.');
						return;
					}
				}
			}
		});

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: confirm
		/* confirm 확인버튼 클릭시 */
		function confirmYes(){
			// var params = {
			// 	SALES_NUM : $("#pop01_txt01_SALE").val()
			// 	, ACCOUNT_SUB : $("#pop01_sel01_ACCOUNT_SUB").val()
			// 	, BREAKDOWN : $("#pop01_txt01_BREAKDOWN").val()
			// 	, MEMO : $("#pop01_txt01_MEMO").val()
			// 	, USE_DATE : $("#pop01_date01_USE").val()
			// 	, ACCOUNT : $("#pop01_txt01_ACCOUNT").val()
			// 	, COMPANY : $("#pop01_txt01_COMPANY").val()
			// 	, CARD_NUM : $("#pop01_txt01_CARD_NUM").val()
			// }
			//
			// getAjaxJsonData("co1100Save", params, "reLoadCallback");
			// $("#viewForm1").dialog("close");

			var gridArray = [ 'table1' ];
			mergeGridData(gridArray, 'co1100MergeData', 'reLoadCallback');
		}

		/* 추가/수정 후 Table 재조회 */
		function reLoadCallback(data){
			if(data.result != undefined){
				// popReset("viewForm1");
				toast("성공", "정상적으로 저장되었습니다.", "success");
				searchGridData();
			}else{
				toast("경고", "오류가 발생하였습니다.", "error");
				return false;
			}
		}

		function buttonFormat(cellvalue, options, rowObject) {
			return '<button type="button" id="btn01_PROJECT" class="btnPopup" onclick=\"openModalPopup_Project()\"></button>';
		}

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
					{name: 'rowStatus'			, align:'center'	, width: '0%'	, hidden: true 	, editable: false}
					, {name:'USER_ID'			, align:'center'	, width: '0%' 	, hidden: true 	, editable : false}
					, {name: 'USE_DATE'			, align: 'left'		, width: '5%'	, hidden: false	, editable: false}
					, {name: 'APPROVAL_NUM'		, align: 'center'	, width: '3%'	, hidden: false	, editable: false}
					, {name: 'SALES_NUM'		, align: 'center' 	, width: '5%'	, hidden: false	, editable : false}
					, {name: 'PROJECT_NM'		, align: 'center' 	, width: '3%'	, hidden: false	, editable : false , formatter: buttonFormat}
					, {name: 'ACCOUNT_SUB'		, align: 'left'		, width: '5%'	, hidden: false	, editable : true , formatter: 'select' , edittype: 'select' , editoptions: {value: ACCOUNT_SUBSelect}}
					, {name: 'ACCOUNT'			, align: 'left'		, width: '9%'	, hidden: false	, editable: false}
					, {name: 'BREAKDOWN'		, align: 'left'		, width: '9%'	, hidden: false	, editable: true}
					, {name: 'APPROVAL'			, align: 'right'	, width: '3%'	, hidden: false	, editable: false	, formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}
					, {name: 'REFUND'			, align: 'right'	, width: '3%'	, hidden: false	, editable: false	, formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}
					, {name: 'MEMO'				, align: 'left' 	, width: '8%'	, hidden: false	, editable: true}
					, {name: 'COMPANY'			, align: 'center'	, width: '0%'	, hidden: true	, editable: false}
					, {name: 'CARD_NUM'			, align: 'center'	, width: '0%'	, hidden: true	, editable: false}
				]
				, autowidth: false
				, shrinkToFit: false
				, rowNum : 5000
				, onSelectRow : function(rowid, status, e) {
					lastidD = rowid;
				}
				, gridComplete: function() {
					var sumA = $("#table1").jqGrid('getCol', 'APPROVAL', false, 'sum');
					var sumR = $("#table1").jqGrid('getCol', 'REFUND', false, 'sum');
					$("#table1").jqGrid('footerData', 'set', {USE_DATE: '총 계', APPROVAL: sumA, REFUND: sumR});

					$('table.ui-jqgrid-ftable tr:first').children("td").css("background-color", "#dbdcdf");
					$('table.ui-jqgrid-ftable tr:first').children("td").css("border-top", "1px solid #eaeaea;");
					$('table.ui-jqgrid-ftable tr:first').children("td").css("font-weight", "500");
					$('table.ui-jqgrid-ftable tr:first').children("td").css("height", "32px");
					$('table.ui-jqgrid-ftable tr:first td:eq(0), table.ui-jqgrid-ftable tr:first td:eq(6)').css("padding-right","15px");
					$('table.ui-jqgrid-ftable tr:first td:eq(0), table.ui-jqgrid-ftable tr:first td:eq(7)').css("padding-right","15px");
				}
				, userDataOnFooter: true
				, footerrow: true
			});

			var newWidth = $("#table1_SALES_NUM").width() + $("#table1_PROJECT_NM").outerWidth(true) - 5;
			console.log('newWidth : ', newWidth);
			jQuery("#table1").jqGrid("setLabel", "SALES_NUM", "<em style='font-style: inherit;'>판품번호</em>", "", {
												style : "width: " + newWidth + "px;",
												colspan : "2"
											});
			jQuery("#table1").jqGrid("setLabel", "PROJECT_NM", "", "", {
				style : "display: none"
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

					// $("#pop01_txt01_SALE").val(rowdata.SALES_NUM);
					// $("#pop01_txt01_PROJECT").val(rowdata.PROJECT_NM);
					$("#table1").jqGrid('setCell', lastidD, "SALES_NUM", rowdata.SALES_NUM);
					$("#viewForm2").dialog("close");
				}
			});
		};

		function updateGridData(selRowData){
			$("#pop01_date01_USE").val(selRowData.USE_DATE);
			$("#pop01_txt01_SALE").val(selRowData.SALES_NUM);
			$("#pop01_txt01_PROJECT").val(selRowData.ACCOUNT_SUB);
			$("#pop01_sel01_ACCOUNT_SUB").val(selRowData.PDEPT_NM);
			$("#pop01_txt01_ACCOUNT").val(selRowData.ACCOUNT);
			$("#pop01_txt01_BREAKDOWN").val(selRowData.BREAKDOWN);
			$("#pop01_txt01_APPROVAL").val(Number(selRowData.APPROVAL).toLocaleString('ko-KR'));
			$("#pop01_txt01_REFUND").val(Number(selRowData.REFUND).toLocaleString('ko-KR'));
			$("#pop01_txt01_MEMO").val(selRowData.MEMO);
			$("#pop01_txt01_COMPANY").val(selRowData.COMPANY);
			$("#pop01_txt01_CARD_NUM").val(selRowData.CARD_NUM);

			$('#pop01_date01_USE').attr("disabled", true);
			$('#pop01_txt01_PROJECT').attr("disabled", true);
			$('#pop01_txt01_ACCOUNT').attr("disabled", true);
			$('#pop01_txt01_APPROVAL').attr("disabled", true);
			$('#pop01_txt01_REFUND').attr("disabled", true);
		}
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: CRUD
		/* Table 조회 */
		function searchGridData(){
			var cardNum = $("#sel01_COMPANY option:checked").text();
			var searchParam = {
				COMPANY: $("#sel01_COMPANY").val()
				, CARD_NUM : cardNum == "전체" ? cardNum : $("#sel01_COMPANY option:checked").text().split(/\s+/g)[1]
				, DATE: $("#date01_DATE").val()
			};
			
			getAjaxJsonData("co1100Sel", searchParam, "searchGridDataCallBack");
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

			chkEditForm = false;
			setButton('init');
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
		/* 사용내역 수정 팝업 */
		function openModalPopup(){
			// 화면ID, 화면ID사이즈(ex. 6:CM1000 / 13:CM1000_Detail), 팝업ID, 다국어
			var returnPopup = getLangCodePopup("CO1100_Pop1", 11, "viewForm1", "${LANG}");
			var titlePop = returnPopup[0];
			var pop01_btn01_SAVE = returnPopup[1];
			var pop01_btn01_CLOSE = returnPopup[2];

			$("#viewForm1").dialog({
				autoOpen: true
				, title: titlePop
				, width: 900
				, modal: true
				, open: function (event, ui) {
					$("#pop01_sel01_ACCOUNT_SUB").find("option:eq(0)").prop("selected", "selected");
				}
				, close: function () {
					$(this).dialog("close");
				}
				, buttons: [
					{
						text : pop01_btn01_SAVE,
						click : function(){
							if($('#pop01_txt01_PROJECT').val() == ''){
								toast("경고", "프로젝트를 선택해주세요.", "error");
								return false;
							} else if($('#pop01_sel01_ACCOUNT_SUB').val() == ''){
								toast("경고", "계정과목을 선택해주세요.", "error");
								return false;
							} else if($('#pop01_txt01_BREAKDOWN').val() == ''){
								toast("경고", "내역을 입력해주세요.", "error");
								return false;
							} else {
								confirms("저장 하시겠습니까?", "");
							}
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

		/* 프로젝트 조회 팝업 */
		function openModalPopup_Project(){
			if (chkEditForm == true) {
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
						$("#pop02_txt01_PROJECT").val("");
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

									$("#table1").jqGrid('setCell', lastidD, "SALES_NUM", rowdata.SALES_NUM);
									// $("#pop01_txt01_SALE").val(rowdata.SALES_NUM);
									// $("#pop01_txt01_PROJECT").val(rowdata.PROJECT_NM);
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
			}
		};
	</script>
</html>