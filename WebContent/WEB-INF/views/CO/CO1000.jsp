<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<body>
		<!-- .contents-wrap 컨텐츠영역 START -->
		<div class="contents-wrap an1100-page">
			<!-- .page-title-wrap 타이블영역 START -->
			<div class="page-title-wrap">
				<div class="page-title">
					<h2>법인카드 카드사별 등록</h2>
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
	        <form id="CO1000dataForm" name="CO1000dataForm" enctype="multipart/form-data">
		        <div class="search-zone">
					<div class="search-wrap">
						<div class="sch-box">
							<dl class="dl-2n">
								<dt>첨부파일</dt>
								<dd class="fl-sb">
									<input type="text" id="txt01_FILE_NM" readonly>
								</dd>
								<dd class="fl-sb">
									<select id="sel01_FILE_NM" class="mg-l10"></select>
								</dd>
							</dl>
						</div>
						<div class="srch-btn">
			                <ul>
			                	<li><input type="file" id="file01_FILE" class="dis-n" accept=".xls,.xlsx"></li>
								<li><a href="javascript:void(0);" id="btn01_DELETE" class="btn-file">삭제</a></li>
			                    <li><a href="javascript:void(0);" id="btn01_FILE" class="btn-file">파일</a></li>
			                    <li><a href="javascript:void(0);" id="btn01_UPLOAD" class="btn-file dis-n">업로드</a></li>
			                    <li><a href="javascript:void(0);" id="btn01_CONFIRM" class="btn-confirm">저장</a></li>
			                </ul>
			            </div>
					</div>
				</div>
			</form>
			<!-- .search-wrap 검색영역 END -->
			
			<!-- .title-wrap TABLE영역 START -->
			<div class="row row-1 row-wrap-src">
				<div class="col col-1 wp100">
					<section>
						<div class="title-wrap">
	                        <div class="title-zone">
	                            <h2 class="title1">카드사별 사용목록</h2>
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
		let langHead;
		let arrayFile = new Array();
		let tableCnt = 0;

		/* Document가 로드되었을 때 실행되는 코드 */
		$(document).ready(function() {
			function init() {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()-58),true);
			}
			
			jQuery(window).on('resize.jqGrid', function () {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
			});
			
			// 화면ID, 화면ID사이즈(6:CM1000/13:CM1000_Detail), 다국어
			langHead = getLangCode("CO1000", 6, "${LANG}");

			setGrid();
			init(); //그리드 리사이징

			getAjaxJsonData("/co1000/selects", "", "selectDataCallBack", "GET");
			deleteGridData();

		});

		function selectDataCallBack(datas) {
			$("#sel01_FILE_NM").empty();
			$("#sel01_FILE_NM").append($("<option>업로드한 파일</option>"));
			datas.forEach((data, i) => {
				let value = (data.FILE_NM + "/" + data.REG_DT.replace(" ", "-") + "/" + data.COUNT);
				let option = $("<option value=" + value + ">" + (i + 1) + ". " + data.FILE_NM + "_" + data.REG_DT.replace(" ", "-") + "_" + data.COUNT + "건</option>");
				$("#sel01_FILE_NM").append(option);
			});

		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 버튼
		/* 검색 버튼 */
		$("#btn01_SEARCH").on({
			click: function(){
				searchGridData();
			}
		});

		$("#sel01_FILE_NM").change(() => {
			let option = $("#sel01_FILE_NM option:selected").val();
			let option2 = $("#sel01_FILE_NM option:selected").val().substring(option.indexOf("/") + 1);

			let fileName = option.substring(0, option.indexOf("/"));
			let count = option2.substring(option2.indexOf("/") + 1);
			let regDate = option2.substring(0, option2.indexOf("/"))
			let regDate2 = regDate.substring(0, 10) + " " + regDate.substring(11)

			let param = {
				FILE_NM: fileName,
				REG_DT: regDate2,
				COUNT: count
			}

			getAjaxJsonData("/co1000/select", param, "searchGridDataCallBack");

		});


		$("#txt01_FILE_NM").on({
			click: function(){
				deleteGridData();

				$("#file01_FILE").val("");
				$("#txt01_FILE_NM").val("");

				$("#table1").clearGridData();
				$("#table1_cnt").text(0);

				$("#file01_FILE").trigger("click");
			}
		});

		/* 삭제 버튼*/
		$("#btn01_DELETE").on({
			click: function () {
				let option = $("#sel01_FILE_NM option:selected").val();
				if (option == '업로드한 파일') {
					toast("정보", "삭제할 파일을 선택해주시기 바랍니다. ", "info");
				} else {
					confirms("정말로 삭제하시겠습니까?\n ※ 개인별 사용내역 등록에 작성된 자료가 있으면 삭제할 수 없습니다.", "D");
				}
			}
		});
		
		/* 파일 버튼 */
		$("#btn01_FILE").on({
			click: function(){
				deleteGridData();
				$("#file01_FILE").val("");
				$("#txt01_FILE_NM").val("");

				$("#table1").clearGridData();
				$("#table1_cnt").text(0);
				$("#file01_FILE").trigger("click");
			}
		});
		
		/*파일 선택되면 실행*/
		$("#file01_FILE").on('change', function(e) {
			e.preventDefault();

			let file = document.getElementById("file01_FILE").files[0];
			arrayFile = new Array();
			arrayFile.push(file);
            
            $("#txt01_FILE_NM").val(file.name);

			$("#btn01_UPLOAD").trigger("click");

			searchGridData();
		});

		/* 파일 업로드 버튼 */
		$("#btn01_UPLOAD").on({
			click: function(){
				showLoadingPanel();

				let co1000dataForm = new FormData($('form#CO1000dataForm')[0]);
				co1000dataForm.append('file' + 0, arrayFile[0], arrayFile[0].name);

				for(let key of co1000dataForm.keys()) { 
					console.log('co1000dataForm key : ', key);
				}
				
				for(let value of co1000dataForm.values()) {
					console.log('co1000dataForm value : ', value);
				}
				
				uploadFile(co1000dataForm, 'co1000MergeData', 'co1000MergeDataCallBack');
			}
		});

		function selectDeleteCallBack(data) {
			if (data.DELETE == "N") {
				toast("경고", "개인별 사용내역 등록에 작성된 자료는 삭제할 수 없습니다.", "error");
			}else if (data.DELETE == "Y") {
				toast("성공", data.REG_DT  + " 에 업로드된 " + data.FILE_NM + "을 삭제하였습니다.", "success");
				getAjaxJsonData("/co1000/selects", "", "selectDataCallBack", "GET");
				$("#table1").clearGridData();
				$("#table1_cnt").text(0);
			}
		}

		function co1000MergeDataCallBack(res) {
			if(res != undefined || res != null) {
				if(Math.abs(res.insertCnt) > 0) {
					toast("성공", "정상적으로 " + res.insertCnt + "건이 업로드되었습니다.", "success");

					searchGridData();
				} else {
					toast("오류", "업로드를 실패하였습니다.", "error");
					$("#file01_FILE").val("");
					$("#txt01_FILE_NM").val("");

					$("#table1").clearGridData();
					$("#table1_cnt").text(0);
					closeLoadingPanel();
					return false;
				}
			} else {
				toast("오류", "업로드를 실패하였습니다.", "error");
				$("#file01_FILE").val("");
				$("#txt01_FILE_NM").val("");

				$("#table1").clearGridData();
				$("#table1_cnt").text(0);
				closeLoadingPanel();
				return false;
			}

			closeLoadingPanel();
		}

		/* 저장 버튼 */
		$("#btn01_CONFIRM").on({
			click: function(){
				confirms("첨부파일을 저장하시겠습니까?", "C");
			}
		});

		function co1000SaveCallBack(res) {
			if(res != undefined || res != null) {
				if(Math.abs(res.insertCnt) > 0) {
					toast("성공", "정상적으로 " + res.insertCnt + "건이 저장되었습니다.", "success");

			// if(res[0] == undefined || res[0] == null) {
			// 	toast("성공", "정상적으로 " + tableCnt + "건이 저장되었습니다.", "success");
					deleteGridData();
					$("#file01_FILE").val("");
					$("#txt01_FILE_NM").val("");
					$("#table1").clearGridData();
					$("#table1_cnt").text(0);

					searchGridData();

					$("#file01_FILE").val("");
					$("#txt01_FILE_NM").val("");
				}
			} else {
				toast("오류", "저장에 실패하였습니다.", "error");
				return false;
			}

			closeLoadingPanel();

			getAjaxJsonData("/co1000/selects", "", "selectDataCallBack", "GET");
		}

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: confirm
		function confirmYes(action){
			if(action == "C"){
				showLoadingPanel();

				let co1000dataForm = new FormData($('form#CO1000dataForm')[0]);
				co1000dataForm.append('file' + 0, arrayFile[0], arrayFile[0].name);

				for(let key of co1000dataForm.keys()) {
					console.log('co1000dataForm key : ', key);
				}

				for(let value of co1000dataForm.values()) {
					console.log('co1000dataForm value : ', value);
				}

				uploadFile(co1000dataForm, 'co1000MergeDataSave', 'co1000SaveCallBack');


			}else if (action == "D") {
				let option = $("#sel01_FILE_NM option:selected").val();
				let option2 = $("#sel01_FILE_NM option:selected").val().substring(option.indexOf("/") + 1);

				let fileName = option.substring(0, option.indexOf("/"));
				let count = option2.substring(option2.indexOf("/") + 1);
				let regDate = option2.substring(0, option2.indexOf("/"))
				let regDate2 = regDate.substring(0, 10) + " " + regDate.substring(11)

				let param = {
					FILE_NM: fileName,
					REG_DT: regDate2,
					COUNT: count
				}
				getAjaxJsonData("/co1000/select", param, "selectDeleteCallBack", "Delete");
			}
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 그리드
		/* jqGrid 셋팅 */
		function setGrid(){
			$('#table1').jqGrid({
				mtype: 'POST'
				, datatype: 'loacl'
				, height : '100%'
				, jsonReader: {
					repeatitems: false
				}
				, colNames: langHead
				, colModel: [
					{name: 'COMPANY'			, align: 'center'	, width: '5%'	, hidden: false}				
					, {name: 'CARD_NUM'			, align: 'center' 	, width: '8%'	, hidden: false}							
					, {name: 'USE_DATE'			, align: 'center'	, width: '6%'	, hidden: false}				
					, {name: 'APPROVAL_NUM'		, align: 'center'	, width: '4%'	, hidden: false}
					, {name: 'ACCOUNT'			, align: 'center' 	, width: '10%'	, hidden: false}
					, {name: 'APPROVAL'			, align: 'right'	, width: '8%'	, hidden: false , formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}					
					// , {name: 'REFUND'			, align: 'right'	, width: '8%'	, hidden: false , formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}
				]
				, autowidth: false
				, shrinkToFit: false
				, rowNum : 1000
				, footerrow : true
				, onLoadComplete : function() {
					let countSum = $("#table1").jqGrid('getCol','APPROVAL', false, 'sum');
					let amountSum = $("#table1").jqGrid('getCol','REFUND', false, 'sum');
					
					$("#table1").jqGrid('footerData', 'set', {PaymethodName : '합계', APPROVAL : countSum});
				}
			});

			searchGridData();
		};
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: CRUD
		/* Table 조회 */
		function searchGridData(){
			let searchParam = {
				FILE_NM : $("#txt01_FILE_NM").val()
			};

			getAjaxJsonData("co1000SelTemp", searchParam, "searchGridDataCallBack");
		};

		function searchGridDataCallBack(data){
			$("#table1").clearGridData();
			$("#table1").jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");

			if(data.length > 0){
				tableCnt = comma(data.length);
				$("#table1_cnt").text(tableCnt);
			} else {
				$('#table1_cnt').text(0);
			}
		};

		function deleteGridData() {
			let searchParam = {};

			getAjaxJsonData("co1000Delete", searchParam, "");
		}

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 유효성

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: Popup

		function showLoadingPanel() {
			var width  = document.querySelector('body').clientWidth;		// 화면의 넓이
			var height = document.querySelector('body').clientHeight;	// 화면의 높이
			var top = document.querySelector('body').offsetTop;
			var left = document.querySelector('body').offsetLeft;
			var loadingPanel = "";
			var tabCnt = $('.openpage li').length;

			if(tabCnt < 11){
				// 화면 출력 html
				loadingPanel = "<div id='loadingPanel'>";
				loadingPanel += "<img id='loadingImg' src='/resources/img/sub/icon-loadingPanel.gif'style='position: absolute; display: block; left: 45%; top: 35%;'/>";
				loadingPanel += "</div>";

				$('body').prepend(loadingPanel);	// 레이어 추가

				// loadingPanel css
				// opacity : 불투명도
				$('#loadingPanel').css({
					'position' : 'absolute'
					, 'z-index' : '9000'
					// , 'background-color' : 'white'
					, 'display' : 'block'
					, 'margin-left' : left + 'px'
					, 'width' : width
					, 'height': height
					, 'opacity' : '1'
				});

				$('#loadingPanel').show();	// loadingPanel show
			}
		}

		function closeLoadingPanel() {
			$('#loadingPanel').hide();
			$("#loadingPanel").remove();
		}
	</script>
</html>