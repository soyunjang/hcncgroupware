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
							<dl>
								<dt>카드사</dt>
								<dd>
									<select id="sel01_COMPANY" name="sel01_COMPANY"></select>
								</dd>
							</dl>
							<dl class="dl-2n">
								<dt>첨부파일</dt>
								<dd class="fl-sb">
									<input type="text" id="txt01_FILE_NM" readonly="readonly">
									<a href="javascript:void(0);" id="btn01_FILE_RESET" class="btn-file-close"></a>
								</dd>
							</dl>
						</div>
						<div class="srch-btn">
			                <ul>
			                	<li><input type="file" id="file01_FILE" class="dis-n" accept=".xls,.xlsx"></li>
			                    <li><a href="javascript:void(0);" id="btn01_FILE" class="btn-file">파일</a></li>
			                    <li><a href="javascript:void(0);" id="btn01_UPLOAD" class="btn-file">업로드</a></li>
			                    <li><a href="javascript:void(0);" id="btn01_CONFIRM" class="btn-confirm">확정</a></li>
			                </ul>
			            </div>
					</div>
				</div>
			</form>
			<div class="search-zone">
				<div class="search-wrap">
					<div class="sch-box">
						<dl>
							<dt>카드사</dt>
							<dd>
								<select id="sel02_COMPANY"></select>
							</dd>
						</dl>
						<dl>
							<dt>조회기간</dt>
							<dd>
								<input type="month" id="date01_DATE" pattern="[0-9]{4}-[0-9]{2}">
							</dd>
						</dl>
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
			<div class="row row-1 row-wrap-204">
				<div class="col col-1 wp100">
					<section>
						<div class="title-wrap">
	                        <div class="title-zone">
	                            <h2 class="title1">카드사별 사용목록</h2>
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
		var arrayFile = new Array();
		
		commonCodeSelectAdd("sel01_COMPANY", getCommonCode('CARD'), 'N');
		commonCodeSelectAdd("sel02_COMPANY", getCommonCode('CARD'), 'Y');

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
			
			document.getElementById('date01_DATE').value= new Date().toISOString().slice(0, 7);
			
			setGrid();
			init(); //그리드 리사이징
		});

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 버튼
		/* 검색 버튼 */
		$("#btn01_SEARCH").on({
			click: function(){
				searchGridData();
			}
		});
		
		/* 파일 버튼 */
		$("#btn01_FILE").on({
			click: function(){
				$("#file01_FILE").trigger("click");
			}
		});
		
		/*파일 선택되면 실행*/
		$("#file01_FILE").on('change', function(e) {
			e.preventDefault();
			
			var file = document.getElementById("file01_FILE").files[0];
            arrayFile.push(file);
            
            $("#txt01_FILE_NM").val(file.name);
		});

		/* 파일 업로드 버튼 */
		$("#btn01_UPLOAD").on({
			click: function(){
				var co1000dataForm = new FormData($('form#CO1000dataForm')[0]);
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
		
		function co1000MergeDataCallBack(res) {
			if(res[0] == undefined) {
				toast("성공", "정상적으로 저장되었습니다.", "success");
				
				$("#file01_FILE").val("");
				$("#txt01_FILE_NM").val("");
				searchGridData();
			}
		}

		/* 확정 버튼 */
		$("#btn01_CONFIRM").on({
			click: function(){
				
			}
		});

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: confirm
		
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
					, {name: 'BREAKDOWN'		, align: 'center' 	, width: '10%'	, hidden: false}				
					, {name: 'APPROVAL'			, align: 'right'	, width: '8%'	, hidden: false , formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}					
					, {name: 'REFUND'			, align: 'right'	, width: '8%'	, hidden: false , formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}
					, {name: 'CONFIRM_YN'		, align: 'center'	, width: '4%'	, hidden: false}
				]
				, autowidth: false
				, shrinkToFit: false
				, rowNum : 1000
				, footerrow : true
				, onLoadComplete : function() {
					var countSum = $("#table1").jqGrid('getCol','APPROVAL', false, 'sum');
					var amountSum = $("#table1").jqGrid('getCol','REFUND', false, 'sum');
					
					$("#table1").jqGrid('footerData', 'set', {PaymethodName : '합계', APPROVAL : countSum});
				}
			});
			
			searchGridData();
		};
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: CRUD
		/* Table 조회 */
		function searchGridData(){
			var searchParam = {
					COMPANY: $("#sel02_COMPANY").val()
					, DATE: $("#date01_DATE").val()
					, CARD_NUM: $("#txt01_CARD_NUM").val()
			};
			
			getAjaxJsonData("co1000Sel", searchParam, "searchGridDataCallBack");
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