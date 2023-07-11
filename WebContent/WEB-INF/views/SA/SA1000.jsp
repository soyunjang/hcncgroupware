<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<body>
		<!-- .contents-wrap 컨텐츠영역 START -->
		<div class="contents-wrap cm1200-page">
			<!-- .page-title-wrap 타이블영역 START -->
			<div class="page-title-wrap">
				<div class="page-title">
					<h2>판매품의서관리</h2>
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
						<dl class="dl-3n">
							<dt>검색</dt>
							<dd>
								<ul class="input3-wrap">
									<li class="input-src">
										<select id="sel01_SALE_SEARCH">
											<option value="saleNo">판매품의서 NO</option>
											<option value="projectNm">프로젝트명</option>
											<option value="custNm">거래처명</option>
											<option value="chargeNm">담당자</option>
											<option value="pmNm">PM명</option>
										</select>
									</li>
									<li>
										<label for="txt01_SALE_SEARCH" class="hide">찾을 내용</label>
										<input type="text" id="txt01_SALE_SEARCH">
									</li>
									<li class="w350 h18 mg-l10">
										<input type="checkbox" id="chk01_PRE" name="chk01_PRE">
										<label for="">이전버전 포함</label> 				
									</li>
								</ul>
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
			<div class="row row-1 row-wrap-478">
				<div class="col col-1 wp100">
					<section>
						<div class="title-wrap">
	                        <div class="title-zone">
	                            <h2 class="title1">판매품의서 목록</h2>
	                        </div>
	                        <div class="btn-right-box">
	                            <ul>
									<li><a href="javascript:void(0);" id="btn01_COPY">복사</a></li>
									<li><a href="javascript:void(0);" id="btn01_PRINT">출력</a></li>
									<li><a href="javascript:void(0);" id="btn01_EXCEL">엑셀</a></li>
	                            	<li><a href="javascript:void(0);" id="btn01_CREATE">추가</a></li>
									<li><a href="javascript:void(0);" id="btn01_SAVE">저장</a></li>
									<li><a href="javascript:void(0);" id="btn01_COMFIRM">확정</a></li>
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
		
			<!-- .tab-wrap 탭 START -->
			<div class="tab-wrap">
				<ul>
					<li class="on"><a href="#" title="수주현황" id="tab01_OBTAIN">수주현황</a></li>
					<li><a href="#" title="설치비 및 서비스비용" id="tab02_COST">설치비 및 서비스비용</a></li>
					<li><a href="#" title="유지보수 예상" id="tab03_SM">유지보수 예상</a></li>
					<li><a href="#" title="상세내역" id="tab04_DETAIL">상세내역</a></li>
				</ul>
			</div>
			<!-- .tab-wrap 탭 END -->
	
            <div class="container-item">
                <div class="con-section section-item" id="register1">
                    <div class="fl-sb ai-ct">
	                    <p>작성일자 : <span id="date01_REG_DT" class="date-span"></span></p>	                    
	                    <div class="currency-box">
	                        <span><strong>※ 계약일자기준 환율</strong></span><br>
	                        <span id="currency_VAL" style="color: red;"></span>
	                    </div>
                    </div>                    
                    <div class="table-title">
                        <p class="item-title">1. 수주현황</p>
                        <p>&lt;VAT별도&gt; (단위 : 원)</p>
                    </div>                    
                    
                    <form id="SA1000DataForm" name="SA1000DataForm">
	                    <div class="row row-2">
							<div class="col col-1 wp100">
								<section>
									<table class="table-write">
						        		<caption>수주현황</caption>
								        <colgroup>
								            <col class="wp8">
								            <col class="wp15">
								            <col class="wp8">
								            <col class="wp15">
								            <col class="wp8">
								            <col class="wp15">
								            <col class="wp8">
								            <col class="wp10">
								        </colgroup>
										<tbody>
								            <tr>
								            	<th class="req">1.사업장</th>
								                <td>
								                	<select id="OFFICE_TYPE" class="wp100"></select>
								                </td>
								                <th class="req">2.판매품의서 NO</th>
								                <td colspan="5">
								                	<input type="text" id="SALES_NUM" readonly="readonly"/>
								                	<input type="text" id="REVISION" class="dis-n">	
								                </td>
								            </tr>
								            <tr>
								                <th class="req">3.프로젝트명</th>
								                <td colspan="3">
								                	<input type="text" id="PROJECT_NM"/>
								                </td>     		                
								                <th class="req">4.거래처명</th>
								                <td>
								                	<input type="text" id="OBTAIN_ACCOUNT"/>
								                </td> 
								                <th class="req">5.영업담당자</th>
								                <td>
								                	<input type="text" id="OBTAIN_SALES_PIC"/>
								                </td> 
								            </tr>
								            <tr>
								                <th class="req">6.계약일자</th>
								                <td>
								                	<input type="date" id="OBTAIN_CONTRACT_DT" onchange="changeContractDt();"/>
								                </td>
								                <th>7.품목</th>
								                <td>
								                	<input type="text" id="OBTAIN_ITEM"/>
								                </td>     
								                <th class="req">8.수량</th>
								                <td>
								                	<input type="text" id="OBTAIN_ITEM_CNT">
								                </td>
								                <th>9.PM</th>
								                <td>
								                	<input type="text" id="OBTAIN_PM" />
								                </td>
											</tr>
											<tr>
								            	<th class="req">10.프로젝트 기간</th>
								                <td colspan="3">
								                	<div class="fl-ct">
									                	<input type="date" id="OBTAIN_PROJECT_START"/>
									                	<label class="mg-t4">~</label>
									                	<input type="date" id="OBTAIN_PROJECT_END"/>
								                	</div>
								                </td> 
								                <th class="req" id="pop01_lb01_REASON"></th>
								                <td colspan="3">
								                	<input type="text" id="OBTAIN_REASON" class="dis-n" />
								                </td>
								            </tr>    	            
								        </tbody>
								    </table>
								</section>
							</div>
						</div>
						
						<div class="row row-1 row-wrap-415">
							<div class="col col-1 wp100">
								<section>
									<div class="title-wrap">
				                        <div class="title-zone">
				                            <h2 class="title1">2.수금정보</h2>
				                        </div>
					                    <div class="btn-right-box">
				                            <ul>
				                            	<li><a href="javascript:void(0);" id="btn01_INSERT">추가</a></li>
												<li><a href="javascript:void(0);" id="btn01_DELETE">삭제</a></li>
				                            </ul>
				                        </div>
				                    </div> 
				                    
				                    <div class="search-zone">
										<div class="search-wrap">
											<div class="sch-box">
												<dl>
													<dt>단가</dt>
													<dd>
														<input type="text" id="COLLECT_UNIT_PRICE" class="ta-r" placeholder="단가(원)">
													</dd>
												</dl>
												<dl>
													<dt>판매금액</dt>
													<dd>
														<input type="text" id="COLLECT_SALES_AMOUNT" class="ta-r" placeholder="판매금액(원)">
													</dd>
												</dl>
												<dl>
													<dt>마진</dt>
													<dd class="fl-fs">
														<input type="text" id="COLLECT_MARGIN_PER" class="w65 ta-r" placeholder="비율(%)">
														<input type="text" id="COLLECT_MARGIN" class="ta-r" placeholder="금액(원)">
													</dd>
												</dl>	
												<dl>
													<dt>최종마진</dt>
													<dd class="fl-fs">
														<input type="text" id="COLLECT_FINAL_MARGIN_PER" class="w65 ta-r" placeholder="비율(%)">
														<input type="text" id="COLLECT_FINAL_MARGIN" class="ta-r" placeholder="금액(원)">
													</dd>
												</dl>					
											</div>
										</div>
									</div>
									<div class="h-calc-100-110 table-wrap">
										<table id="table2"></table>
									</div>
								</section>
							</div>
						</div>
						
						<div class="row row-1 row-wrap-443">
							<div class="col col-1 wp100">
								<section>
									<div class="title-wrap">
				                        <div class="title-zone">
				                            <h2 class="title1">3.매입내역</h2>
											<p>(단위 : 원)</p>
				                        </div>
				                        <div class="btn-right-box">
				                            <ul>
				                            	<li><a href="javascript:void(0);" id="btn02_INSERT">추가</a></li>
												<li><a href="javascript:void(0);" id="btn02_DELETE">삭제</a></li>
				                            </ul>
				                        </div>
				                    </div> 			                    
									<div class="table-wrap">
										<table id="table3"></table>
									</div>
								</section>
							</div>
						</div>
						
						<div class="row row-1 row-wrap-554">
							<div class="col col-1 wp100">
								<section>
									<div class="title-wrap">
				                        <div class="title-zone">
				                            <h2 class="title1">4.내부공수</h2>
											<p>(단위 : 원)</p>
				                        </div>
				                    </div> 
									<div class="table-wrap">
										<table id="table4"></table>
									</div>
								</section>
							</div>
						</div>
		                    
		                <div class="row row-1 row-wrap-600">
							<div class="col col-1 wp100">
								<section>
									<div class="title-wrap">
				                        <div class="title-zone">
				                            <h2 class="title1">5.경비</h2>
											<p>(단위 : 원)</p>
				                        </div>
				                    </div> 
									<div class="table-wrap">
										<table id="table5"></table>
									</div>
								</section>
							</div>
						</div>
					</form>
            	</div>
            	
            	<div class="con-section section-item" id="register2">
					<div class="row row-1 row-wrap-571">
						<div class="col col-1 wp100">
							<section>
								<div class="title-wrap">
			                        <div class="title-zone">
			                        </div>
			                        <div class="btn-right-box">
			                            <ul>
			                            	<li><a href="javascript:void(0);" id="btn03_INSERT">추가</a></li>
											<li><a href="javascript:void(0);" id="btn03_DELETE">삭제</a></li>
			                            </ul>
			                        </div>
			                    </div> 			                    
								<div class="table-wrap">
									<table id="table6"></table>
								</div>
							</section>
						</div>
					</div>
            	</div>
            	
            	<div class="con-section section-item" id="register3">
					<div class="row row-1 row-wrap-571">
						<div class="col col-1 wp100">
							<section>
								<div class="title-wrap">
			                        <div class="title-zone"></div>
			                        <div class="btn-right-box">
			                            <ul>
			                            	<li><a href="javascript:void(0);" id="btn04_INSERT">추가</a></li>
											<li><a href="javascript:void(0);" id="btn04_DELETE">삭제</a></li>
			                            </ul>
			                        </div>
			                    </div> 			                    
								<div class="table-wrap">
									<table id="table7"></table>
								</div>
							</section>
						</div>
					</div>
            	</div>
            	
            	<div class="con-section section-item" id="register4">
                    <div class="row row-1 row-wrap-571">
						<div class="col col-1 wp100">
							<section>
								<div class="title-wrap">
			                        <div class="title-zone"></div>
			                    </div> 
								<div class="table-wrap hp96-1">
									<table id="table8"></table>
								</div>
							</section>
						</div>
					</div>
				</div>
            	
			</div>
		</div>
		<!-- .contents-wrap 컨텐츠영역 END -->
	</body>
	
	<script type="text/javascript">
		/**
		 * SA1000	판매품의서관리
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
		var langDetail1;
		var langDetail2;
		var langDetail3;
		var langDetail4;
		var langDetail5;
		var langDetail6;
		var langDetail7;
		var nowDate = new Date();

		/* 변수 선언 */
		var checkAction = "";
		var COLLECT_PAYMENTSelect = "";
		var BUY_UNITSelect = "";
		var BUY_COINSelect = "";
		var BUY_ITEMSelect = "";
		var MANHOUR_ITEMSelect = "";
		var MANHOUR_UNITSelect = "";
		
		/* 공통코드_콤보박스 */ 
		commonCodeSelectAdd("OFFICE_TYPE", getCommonCode('OFFICE'), 'N');
		
		/* Document가 로드되었을 때 실행되는 코드 */
		$(document).ready(function() {
			function init() {
				jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
				jQuery("#table2").jqGrid('setGridWidth', (jQuery(".table-wrap").width()-58),true);
				jQuery("#table3").jqGrid('setGridWidth', (jQuery(".table-wrap").width()-58),true);
				jQuery("#table4").jqGrid('setGridWidth', (jQuery(".table-wrap").width()-58),true);
				jQuery("#table5").jqGrid('setGridWidth', (jQuery(".table-wrap").width()-58),true);
				jQuery("#table6").jqGrid('setGridWidth', (jQuery(".table-wrap").width()-58),true);
				jQuery("#table7").jqGrid('setGridWidth', (jQuery(".table-wrap").width()-58),true);
				jQuery("#table8").jqGrid('setGridWidth', (jQuery(".table-wrap").width()-58),true);
			}
			
			var mm = (nowDate.getMonth()+1) < 10 ? "0" + (nowDate.getMonth()+1) : (nowDate.getMonth()+1);
			var yy = nowDate.getDate() < 10 ? "0" + nowDate.getDate() : nowDate.getDate();
			$("#date01_REG_DT").text(nowDate.getFullYear() + "-" + mm + "-" + yy);
						
			// 화면ID, 화면ID사이즈(6:CM1000/13:CM1000_Detail), 다국어
			langHead = getLangCode("SA1000", 6, "${LANG}");
			langDetail1 = getLangCode("SA1001", 6, "${LANG}");
			langDetail2 = getLangCode("SA1002", 6, "${LANG}");
			langDetail3 = getLangCode("SA1003", 6, "${LANG}");
			langDetail4 = getLangCode("SA1004", 6, "${LANG}");
			langDetail5 = getLangCode("SA1005", 6, "${LANG}");
			langDetail6 = getLangCode("SA1006", 6, "${LANG}");
			langDetail7 = getLangCode("SA1007", 6, "${LANG}");

			new Promise(function(resolve, reject) {
				selectBox();
				return resolve();
			}).then(function() {
				setTimeout(function() {
					setButton('init');	// 버튼 재설정
					setGrid();
					init(); // 그리드 리사이징
				}, 500);
			});
		});

		$(window).resize(function() {
			$("#table1").jqGrid('setGridHeight', 0);
			var gridHeight = getGridHeight() + 52;
			$("#table1").jqGrid('setGridHeight', gridHeight + $("div#gview_table1 >  div.ui-jqgrid-hdiv").height());
			$("#table2").jqGrid('setGridHeight', gridHeight + $("div#gview_table1 >  div.ui-jqgrid-hdiv").height());
			$("#table3").jqGrid('setGridHeight', gridHeight + $("div#gview_table1 >  div.ui-jqgrid-hdiv").height());
			$("#table4").jqGrid('setGridHeight', gridHeight + $("div#gview_table1 >  div.ui-jqgrid-hdiv").height());
			$("#table5").jqGrid('setGridHeight', gridHeight + $("div#gview_table1 >  div.ui-jqgrid-hdiv").height());
			$("#table6").jqGrid('setGridHeight', gridHeight + $("div#gview_table1 >  div.ui-jqgrid-hdiv").height());
			$("#table7").jqGrid('setGridHeight', gridHeight + $("div#gview_table1 >  div.ui-jqgrid-hdiv").height());
			$("#table8").jqGrid('setGridHeight', gridHeight + $("div#gview_table1 >  div.ui-jqgrid-hdiv").height());
		});

		function selectBox() {			
			getAjaxData("selectLists?LIST_TYPE=PAYMENT", '', 'PAYMENTSelectCallBack');
			getAjaxData("selectLists?LIST_TYPE=UNIT", '', 'UNITSelectCallBack');
			getAjaxData("selectLists?LIST_TYPE=COIN", '', 'COINSelectCallBack');
			getAjaxData("selectLists?LIST_TYPE=ITEM", '', 'ITEMSelectCallBack');
			getAjaxData("selectLists?LIST_TYPE=ITEMMM", '', 'MANHOUR_ITEMSelectCallBack');
			getAjaxData("selectLists?LIST_TYPE=UNITMM", '', 'MANHOUR_UNITSelectCallBack');
		}

		function PAYMENTSelectCallBack (res) {
			var kLength = res.length - 1;
			
			$.each(res, function(index, item) {
				if (index == kLength) {
					COLLECT_PAYMENTSelect += item.CODE + ":" + item.VALUE;
				} else {
					COLLECT_PAYMENTSelect += item.CODE + ":" + item.VALUE + ";";
				}
			});
		}

		function UNITSelectCallBack (res) {
			var kLength = res.length - 1;
			
			$.each(res, function(index, item) {
				if (index == kLength) {
					BUY_UNITSelect += item.CODE + ":" + item.VALUE;
				} else {
					BUY_UNITSelect += item.CODE + ":" + item.VALUE + ";";
				}
			});
		}

		function COINSelectCallBack (res) {
			var kLength = res.length - 1;
			
			$.each(res, function(index, item) {
				if (index == kLength) {
					BUY_COINSelect += item.CODE + ":" + item.VALUE;
				} else {
					BUY_COINSelect += item.CODE + ":" + item.VALUE + ";";
				}
			});
		}

		function ITEMSelectCallBack (res) {
			var kLength = res.length - 1;
			
			$.each(res, function(index, item) {
				if (index == kLength) {
					BUY_ITEMSelect += item.CODE + ":" + item.VALUE;
				} else {
					BUY_ITEMSelect += item.CODE + ":" + item.VALUE + ";";
				}
			});
		}

		function MANHOUR_UNITSelectCallBack (res) {
			var kLength = res.length - 1;
			
			$.each(res, function(index, item) {
				if (index == kLength) {
					MANHOUR_UNITSelect += item.CODE + ":" + item.VALUE;
				} else {
					MANHOUR_UNITSelect += item.CODE + ":" + item.VALUE + ";";
				}
			});
		}

		function MANHOUR_ITEMSelectCallBack (res) {
			var kLength = res.length - 1;
			
			$.each(res, function(index, item) {
				if (index == kLength) {
					MANHOUR_ITEMSelect += item.CODE + ":" + item.VALUE;
				} else {
					MANHOUR_ITEMSelect += item.CODE + ":" + item.VALUE + ";";
				}
			});
		}

		function insertGrid1(condition, rowid) {
			var maxRow = "";
			if(rowid == undefined || rowid == "") {
				maxRow = $("#table2").jqGrid('getGridParam', 'reccount') + 1;
			} else {
				maxRow = rowid;
			}
		
			$("#table2").jqGrid("addRow", {
				rowID : maxRow,
				initdata : {
					'rowStatus' : '추가',
					// 'COLLECT_CONDITION' : condition
				},
				position : "last",
				useDefValues : false,
				useFormatter : false,
				addRowParams : {
					extraparam : {}
				}
			});
			
			$("#table2").jqGrid('setSelection', maxRow, false);
			$("#table2").jqGrid('saveRow', maxRow, true, 'clientArray');
			$("tr#" + maxRow, $('#table2')).addClass('insert');
		}

		function insertGrid2(condition, rowid) {
			var maxRow = "";
			if(rowid == undefined || rowid == "") {
				maxRow = $("#table3").jqGrid('getGridParam', 'reccount') + 1;
			} else {
				maxRow = rowid;
			}
		
			$("#table3").jqGrid("addRow", {
				rowID : maxRow,
				initdata : {
					'rowStatus' : '추가',
					// 'BUY_ITEM' : condition
				},
				position : "last",
				useDefValues : false,
				useFormatter : false,
				addRowParams : {
					extraparam : {}
				}
			});
			
			$("#table3").jqGrid('setSelection', maxRow, false);
			$("#table3").jqGrid('saveRow', maxRow, true, 'clientArray');
			$("tr#" + maxRow, $('#table3')).addClass('insert');
		}

		function insertGrid3(condition, rowid) {
			var maxRow = "";
			if(rowid == undefined || rowid == "") {
				maxRow = $("#table4").jqGrid('getGridParam', 'reccount') + 1;
			} else {
				maxRow = rowid;
			}			
		
			$("#table4").jqGrid("addRow", {
				rowID : maxRow,
				initdata : {
					'rowStatus' : '추가',
					'MANHOUR_ITEM' : condition
				},
				position : "last",
				useDefValues : false,
				useFormatter : false,
				addRowParams : {
					extraparam : {}
				}
			});
			
			$("#table4").jqGrid('setSelection', maxRow, false);
			$("#table4").jqGrid('saveRow', maxRow, true, 'clientArray');
			$("tr#" + maxRow, $('#table4')).addClass('insert');
		}

		function insertGrid4(condition, rowid) {
			var maxRow = "";
			if(rowid == undefined || rowid == "") {
				maxRow = $("#table5").jqGrid('getGridParam', 'reccount') + 1;
			} else {
				maxRow = rowid;
			}			
		
			$("#table5").jqGrid("addRow", {
				rowID : maxRow,
				initdata : {
					'rowStatus' : '추가',
					'EXPENSE_ITEM' : condition
				},
				position : "last",
				useDefValues : false,
				useFormatter : false,
				addRowParams : {
					extraparam : {}
				}
			});
			
			$("#table5").jqGrid('setSelection', maxRow, false);
			$("#table5").jqGrid('saveRow', maxRow, true, 'clientArray');
			$("tr#" + maxRow, $('#table5')).addClass('insert');
		}

		function insertGrid5() {
			var maxRow = $("#table6").jqGrid('getGridParam', 'reccount') + 1;
		
			$("#table6").jqGrid("addRow", {
				rowID : maxRow,
				initdata : {
					'rowStatus' : '추가'
				},
				position : "last",
				useDefValues : false,
				useFormatter : false,
				addRowParams : {
					extraparam : {}
				}
			});
			
			$("#table6").jqGrid('setSelection', maxRow, false);
			$("#table6").jqGrid('saveRow', maxRow, true, 'clientArray');
			$("tr#" + maxRow, $('#table6')).addClass('insert');
		}

		function insertGrid6() {
			var maxRow = $("#table7").jqGrid('getGridParam', 'reccount') + 1;
		
			$("#table7").jqGrid("addRow", {
				rowID : maxRow,
				initdata : {
					'rowStatus' : '추가'
				},
				position : "last",
				useDefValues : false,
				useFormatter : false,
				addRowParams : {
					extraparam : {}
				}
			});
			
			$("#table7").jqGrid('setSelection', maxRow, false);
			$("#table7").jqGrid('saveRow', maxRow, true, 'clientArray');
			$("tr#" + maxRow, $('#table7')).addClass('insert');
		}

		function insertGrid7() {
			var maxRow = $("#table8").jqGrid('getGridParam', 'reccount') + 1;
		
			$("#table8").jqGrid("addRow", {
				rowID : maxRow,
				initdata : {
					'rowStatus' : '추가'
				},
				position : "last",
				useDefValues : false,
				useFormatter : false,
				addRowParams : {
					extraparam : {}
				}
			});
			
			$("#table8").jqGrid('setSelection', maxRow, false);
			$("#table8").jqGrid('saveRow', maxRow, true, 'clientArray');
			$("tr#" + maxRow, $('#table8')).addClass('insert');
		}

		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 버튼		
		/* 탭 클릭 이벤트 */
		$(".tab-wrap li").click(function () {
			var idx = $(this).index();
		    
			$(".section-item").hide();
		    $(".section-item").eq(idx).show();
		    $(".tab-wrap li").removeClass("active");
		    $(this).addClass("active");
		});

		/* 검색 버튼 */
		$("#btn01_SEARCH").on({
			click: function(e){
				e.preventDefault();
				
				searchGridData();
			}
		});		

		/* 복사 버튼 */
		$("#btn01_COPY").on({
			click: function(e){
				e.preventDefault();
				
				if (!$(this).hasClass('disable')) {
					var searchParam = {
							SALES_NUM : $("#SALES_NUM").val().substr(0, 12)
							, REVISION : $("#REVISION").val()
					};
					
					getAjaxJsonData("sa1001Copy", searchParam, "copyGridDataCallBack");
				}
			}
		});
		
		function copyGridDataCallBack(res) {
			if(res[0] == undefined) {
				toast("성공", "복사가 완료되었습니다.", "success");
				searchGridData();
				checkAction = "";
			}
		}

		/* 출력 버튼 */
		$("#btn01_PRINT").on({
			click: function(e){
				e.preventDefault();
				
				if (!$(this).hasClass('disable')) {
					var rowid = $("#table1").getGridParam("selrow");
					if(rowid != null) {
						var params = "?SALES_NUM=" + $("#SALES_NUM").val().substr(0, 12) + "&REVISION=" + $("#REVISION").val();
						var url = "sa1000Print";
						window.open(url + params, 'sa1000Print', 'width=1025,height=1000,top=10,left=10,toolbar=no,menubar=no,lacation=no,scrollbars=no,status=no');
					} else {
						alert("출력할 판매품의서를를 선택해 주세요.");
						return;
					}
				}
			}
		});

		/* 엑셀 버튼 */
		$("#btn01_EXCEL").on({
			click: function(e){
				e.preventDefault();
				
				exportExcel("table1", "판매품의서 관리");
			}
		});

		/* 추가 버튼 */
		$("#btn01_CREATE").on({
			click: function(e){
				e.preventDefault();
				
				setButton('modify');
				$("#table1").jqGrid("resetSelection");
				clearGridData();				
			}
		});

		/* 저장 버튼 */
		$('#btn01_SAVE').on('click', function(e) {
			e.preventDefault();
			
			if (!$(this).hasClass('disable')) {
				var formArray = [ 'SA1000DataForm' ];
				var chk = checkRequiredValidation(formArray);
				
				if (chk) {
					if(isEmpty($("#OFFICE_TYPE").val())){
						alert("사업장을 선택해 주세요.");
						return;
					}
					if(isEmpty($("#PROJECT_NM").val())){
						alert("프로젝트명을 입력해 주세요.");
						return;
					}
					if(isEmpty($("#OBTAIN_ACCOUNT").val())){
						alert("거래처명을 입력해 주세요.");
						return;
					}
					if(isEmpty($("#OBTAIN_SALES_PIC").val())){
						alert("영업담당자를 입력해 주세요.");
						return;
					}
					if(isEmpty($("#OBTAIN_CONTRACT_DT").val())){
						alert("계약일자를 입력해 주세요.");
						return;
					}
					if(isEmpty($("#OBTAIN_ITEM_CNT").val())){
						alert("수량을 입력해 주세요.");
						return;
					}
					if(isEmpty($("#OBTAIN_PROJECT_START").val())){
						alert("프로젝트 시작일을 입력해 주세요.");
						return;
					}
					if(isEmpty($("#OBTAIN_PROJECT_END").val())){
						alert("프로젝트 종료일을 입력해 주세요.");
						return;
					}
					
					if(checkAction == "U") {
						if(isEmpty($("#OBTAIN_REASON").val())){
							alert("변경사유를 입력해 주세요.");
							return;
						}
					}

					addStatus('update', 'table2');
					addStatus('update', 'table3');
					addStatus('update', 'table4');
					addStatus('update', 'table5');
					addStatus('update', 'table6');
					addStatus('update', 'table7');
					addStatus('update', 'table8');
					
					var confirmText = "";
					if(checkAction == "C") {
						confirms("입력중인 데이터를 저장하시겠습니까?", "C");
					} else if(checkAction == "U") {
						confirms("수정중인 데이터를 저장하시겠습니까?", "U");
					}
				} else {
					if(checkAction == "C") {
						alert('입력중인 데이터가 없습니다.');
						return;
					} else if(checkAction == "U") {
						alert('수정중인 데이터가 없습니다.');
						return;
					}					
				}
			}			
		});		
		
		/* 확정 버튼 */
		$("#btn01_COMFIRM").on({
			click: function(e){
				e.preventDefault();
				
				if (!$(this).hasClass('disable')) {
					var searchParam = {
							SALES_NUM : $("#SALES_NUM").val().substr(0, 12)
							, REVISION : $("#REVISION").val()
					};
					
					getAjaxJsonData("sa1001Confirm", searchParam, "confirmGridDataCallBack");
				}
			}
		});
		
		function confirmGridDataCallBack(res) {
			if(res[0] == undefined) {
				toast("성공", "확정이 완료되었습니다.", "success");
				searchGridData();
				checkAction = "";
			}
		}
		
		/* table2(수금정보) 추가 버튼 */
		$("#btn01_INSERT").on({
			click: function(e){
				e.preventDefault();
				
				if (!$(this).hasClass('disable')) {
					// var rowid = $("#table2").jqGrid('getGridParam', 'reccount');
					// $('#table2').jqGrid("delRowData", rowid); // 잔금 삭제
					// insertGrid1('중도금' + (rowid - 1));
					// insertGrid1('잔금');

					insertGrid1('');
				}
			}
		});
		
		/* table2 삭제 버튼 */
		$("#btn01_DELETE").on({
			click: function(e){
				e.preventDefault();
				
				if (!$(this).hasClass('disable')) {
					var rowid = $("#table2").getGridParam("selrow");
					$('#table2').jqGrid("delRowData", rowid);
				}
			}
		});
		
		/* table3(매입내역) 추가 버튼 */
		$("#btn02_INSERT").on({
			click: function(e){
				e.preventDefault();
				
				if (!$(this).hasClass('disable')) {
					insertGrid2();
				}
			}
		});
		
		/* table3 삭제 버튼 */
		$("#btn02_DELETE").on({
			click: function(e){
				e.preventDefault();
				
				if (!$(this).hasClass('disable')) {
					var rowid = $("#table3").getGridParam("selrow");
					$('#table3').jqGrid("delRowData", rowid);
				}
			}
		});
		
		/* table6(설치비 및 서비스비용) 추가 버튼 */
		$("#btn03_INSERT").on({
			click: function(e){
				e.preventDefault();
				
				if (!$(this).hasClass('disable')) {
					insertGrid5();
				}
			}
		});
		
		/* table6 삭제 버튼 */
		$("#btn03_DELETE").on({
			click: function(e){
				e.preventDefault();
				
				if (!$(this).hasClass('disable')) {
					$('#table6').jqGrid("delRowData", rowid);
				}
			}
		});
		
		/* table7(유지보수 예상) 추가 버튼 */
		$("#btn04_INSERT").on({
			click: function(e){
				e.preventDefault();
				
				if (!$(this).hasClass('disable')) {
					insertGrid6();
				}
			}
		});
		
		/* table7 삭제 버튼 */
		$("#btn04_DELETE").on({
			click: function(e){
				e.preventDefault();
				
				if (!$(this).hasClass('disable')) {
					var rowid = $("#table7").getGridParam("selrow");
					$('#table7').jqGrid("delRowData", rowid);
				}
			}
		});
		
		/* 버튼 재설정 */
		function setButton(status, btnId) {
			if(status == "init") {
				$('#btn01_COPY').addClass('disable');
				$('#btn01_PRINT').addClass('disable');
				$('#btn01_SAVE').addClass('disable');
				$('#btn01_COMFIRM').addClass('disable');
				$('#btn01_INSERT').addClass('disable');
				$('#btn01_DELETE').addClass('disable');
				$('#btn02_INSERT').addClass('disable');
				$('#btn02_DELETE').addClass('disable');
				$('#btn03_INSERT').addClass('disable');
				$('#btn03_DELETE').addClass('disable');
				$('#btn04_INSERT').addClass('disable');
				$('#btn04_DELETE').addClass('disable');
			} else if(status == "selectRow") {
				$('#btn01_COPY').removeClass('disable');
				$('#btn01_PRINT').removeClass('disable');
				$('#btn01_SAVE').removeClass('disable');
				$('#btn01_COMFIRM').removeClass('disable');
				$('#btn01_INSERT').removeClass('disable');
				$('#btn01_DELETE').removeClass('disable');
				$('#btn02_INSERT').removeClass('disable');
				$('#btn02_DELETE').removeClass('disable');
				$('#btn03_INSERT').removeClass('disable');
				$('#btn03_DELETE').removeClass('disable');
				$('#btn04_INSERT').removeClass('disable');
				$('#btn04_DELETE').removeClass('disable');
			} else if(status == "modify") {
// 				$('#btn01_COPY').removeClass('disable');
				$('#btn01_PRINT').removeClass('disable');
				$('#btn01_SAVE').removeClass('disable');
// 				$('#btn01_COMFIRM').removeClass('disable');
				$('#btn01_INSERT').removeClass('disable');
				$('#btn01_DELETE').removeClass('disable');
				$('#btn02_INSERT').removeClass('disable');
				$('#btn02_DELETE').removeClass('disable');
				$('#btn03_INSERT').removeClass('disable');
				$('#btn03_DELETE').removeClass('disable');
				$('#btn04_INSERT').removeClass('disable');
				$('#btn04_DELETE').removeClass('disable');
				
				$("#table2").clearGridData();
				
				
				
			} else if(status == "disable") {
				$("#" + btnId).addClass('disable');
			} else if(status == "able") {
				$("#" + btnId).removeClass('disable');
			}
		}

		/* 계약일자 변경시 환율조회 이벤트 */
		function changeContractDt(contractDT) {
			if(contractDT != undefined || contractDT != null) {
				var params = {
						CONTRACT_DT : contractDT
				}
			} else {
				var params = {
						CONTRACT_DT : $("#OBTAIN_CONTRACT_DT").val()
				}
			}			
			
			getAjaxJsonData("sa1000SelExchange", params, "selectExchangeCallback");
		}		

		function selectExchangeCallback(data){
			for(var i = 0; i < data.length; i++) {
				if(data[i].cur_unit == "CNH") {
					// 위안화
					var rCNH = "위안 " + data[i].bkpr + "원 / ";
				} 

				if(data[i].cur_unit == "EUR") {
					// 유로
					var rEUR = "유로 " + data[i].bkpr + "원 / ";
				} 
				
				if(data[i].cur_unit == "JPY(100)") {
					// 엔화
					var rJPY = "엔화 " + data[i].bkpr + "원 / ";
				} 
				
				if(data[i].cur_unit == "USD") {
					// 달러
					var rUSD = "달러 " + data[i].bkpr + "원";
				} 
			}

			console.log("환율 : " + rCNH + rEUR + rJPY + rUSD);
			$("#currency_VAL").text(rCNH + rEUR + rJPY + rUSD);
		};
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: confirm
		/* confirm 확인버튼 클릭시 */
		function confirmYes(action){			
			var params = {
					OFFICE_TYPE : $("#OFFICE_TYPE").val()
					, SALES_NUM : $("#SALES_NUM").val().substr(0, 12)
					, REVISION : $("#REVISION").val()
					, PROJECT_NM : $("#PROJECT_NM").val()
					, OBTAIN_ACCOUNT : $("#OBTAIN_ACCOUNT").val()
					, OBTAIN_SALES_PIC : $("#OBTAIN_SALES_PIC").val()
					, OBTAIN_CONTRACT_DT : $("#OBTAIN_CONTRACT_DT").val()
					, OBTAIN_ITEM : $("#OBTAIN_ITEM").val()
					, OBTAIN_PM : $("#OBTAIN_PM").val()
					, OBTAIN_PROJECT_START : $("#OBTAIN_PROJECT_START").val()
					, OBTAIN_PROJECT_END : $("#OBTAIN_PROJECT_END").val()
					, OBTAIN_ITEM_CNT : parseInt($("#OBTAIN_ITEM_CNT").val())
					, OBTAIN_REASON : $("#OBTAIN_REASON").val()
					, COLLECT_UNIT_PRICE : parseInt($("#COLLECT_UNIT_PRICE").val().replaceAll(",", ""))
					, COLLECT_SALES_AMOUNT : parseInt($("#COLLECT_SALES_AMOUNT").val().replaceAll(",", ""))
					, COLLECT_MARGIN_PER : parseFloat($("#COLLECT_MARGIN_PER").val())
					, COLLECT_MARGIN : parseInt($("#COLLECT_MARGIN").val().replaceAll(",", ""))
					, COLLECT_FINAL_MARGIN_PER : parseFloat($("#COLLECT_FINAL_MARGIN_PER").val())
					, COLLECT_FINAL_MARGIN : parseInt($("#COLLECT_FINAL_MARGIN").val().replaceAll(",", ""))
			}
			
			getAjaxJsonData("sa1000Save", params, "saveCallback");
		}
		
		function saveCallback(res) {
			var gridArray = [ 'table2', 'table3', 'table4', 'table5', 'table6', 'table7', 'table8' ];
			mergeGridData(gridArray, 'sa1000MergeData', 'SA1000MergeDataCallBack');
		}

		function SA1000MergeDataCallBack(data) {		
			if (data != null) {
				toast("성공", "저장이 완료되었습니다.", "success");
				searchGridData();
				checkAction = "";
			}
		}

		function addStatus(status, tb) {
			if(status == "update") {
				var idsTb2 = $('#' + tb).jqGrid('getDataIDs');
				for(var i = 0; i < idsTb2.length; i++) {
					$("tr#" + idsTb2[i], $('#' + tb)).addClass('update');
					$('#' + tb).jqGrid('setCell', idsTb2[i], 'rowStatus', '수정');
				}
			}
			
			
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
					{name: 'SALES_NUM'						, align: 'center'	, width: '11%'	, hidden: false}					
					, {name: 'REVISION'						, align: 'center'	, width: '0%'	, hidden: true}				
					, {name: 'PRE_VERSION'					, align: 'center'	, width: '5%'	, hidden: true}				
					, {name: 'PROJECT_NM'					, align: 'left'		, width: '20%'	, hidden: false}				
					, {name: 'OBTAIN_ACCOUNT'				, align: 'center'	, width: '8%'	, hidden: false}				
					, {name: 'OBTAIN_PRICE'					, align: 'right'	, width: '8%'	, hidden: false	, formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}				
					, {name: 'OBTAIN_SALES_PIC'				, align: 'center' 	, width: '10%'	, hidden: false}									
					, {name: 'OBTAIN_PM'					, align: 'center' 	, width: '6%'	, hidden: false}									
					, {name: 'OBTAIN_REG_DT'				, align: 'center' 	, width: '10%'	, hidden: false}									
					, {name: 'OBTAIN_UPT_DT'				, align: 'center'	, width: '10%'	, hidden: false}	
					, {name: 'OBTAIN_REASON'				, align: 'center'	, width: '10%'	, hidden: false}	
					, {name: 'OFFICE_TYPE'					, align: 'center'	, width: '0%'	, hidden: true}	
					, {name: 'OBTAIN_CONTRACT_DT'			, align: 'center'	, width: '0%'	, hidden: true}	
					, {name: 'OBTAIN_ITEM'					, align: 'center'	, width: '0%'	, hidden: true}	
					, {name: 'OBTAIN_PROJECT_START'			, align: 'center'	, width: '0%'	, hidden: true}	
					, {name: 'OBTAIN_PROJECT_END'			, align: 'center'	, width: '0%'	, hidden: true}	
					, {name: 'OBTAIN_ITEM_CNT'				, align: 'center'	, width: '0%'	, hidden: true}	
					, {name: 'COLLECT_UNIT_PRICE'			, align: 'center'	, width: '0%'	, hidden: true}	
					, {name: 'COLLECT_SALES_AMOUNT'			, align: 'center'	, width: '0%'	, hidden: true}	
					, {name: 'COLLECT_MARGIN_PER'			, align: 'center'	, width: '0%'	, hidden: true}	
					, {name: 'COLLECT_MARGIN'				, align: 'center'	, width: '0%'	, hidden: true}	
					, {name: 'COLLECT_FINAL_MARGIN_PER'		, align: 'center'	, width: '0%'	, hidden: true}	
					, {name: 'COLLECT_FINAL_MARGIN'			, align: 'center'	, width: '0%'	, hidden: true}	
					, {name: 'SALES_CONFIRM'				, align: 'center'	, width: '0%'	, hidden: true}	
				]
				, autowidth: false
				, shrinkToFit: false
				, rowNum : 1000
				, rownumbers : true //자동으로 번호 부여 
				, onSelectRow : function(rowid){
					var rowdata = $("#table1").getRowData(rowid);
					checkAction = "U";
					setButton('selectRow');
					
					$("#date01_REG_DT").text(rowdata.OBTAIN_REG_DT);
					
					updateGridData(rowdata);
					
					searchGrid1Data(rowdata.SALES_NUM, rowdata.REVISION);
					searchGrid2Data(rowdata.SALES_NUM, rowdata.REVISION);
					searchGrid3Data(rowdata.SALES_NUM, rowdata.REVISION);
					searchGrid4Data(rowdata.SALES_NUM, rowdata.REVISION);
					searchGrid5Data(rowdata.SALES_NUM, rowdata.REVISION);
					searchGrid6Data(rowdata.SALES_NUM, rowdata.REVISION);
					searchGrid7Data(rowdata.SALES_NUM, rowdata.REVISION);
				}
			});

			searchGridData();

			$("#table2").jqGrid({
				mtype : 'POST'
				, datatype : 'local'
				, height : 240
				, width: null
				, jsonReader: {
					repeatitems: false 
				}
				, colNames: langDetail1
				, colModel: [
					{name: 'rowStatus'				, align:'center'	, width: '3%'	, editable: false}
					, {name: 'COLLECT_CONDITION'	, align: 'center'	, width: '4%' , editable: true}
					, {name: 'COLLECT_DT'			, align: 'center'	, width: '5%', editable: true	, editoptions: {dataInit: function (element) {
																									                        $(element).datepicker({
																									                            id: 'orderDate_datePicker',
																									                            dateFormat: 'yy-mm-dd',		
																									                            changeYear: true,
																									                            changeMonth: true,																								                            
																									                            showOn: 'focus'
																									                        });
																									                    }
																									                }
					}
					, {name: 'COLLECT_PAYMENT'		, align: 'center'	, width: '4%', editable: true	, formatter: 'select' , edittype: 'select' , editoptions: {value: COLLECT_PAYMENTSelect}}
					, {name: 'COLLECT_CASH_DT'		, align: 'center'	, width: '5%', editable: true	, editoptions: {dataInit: function (element) {
																									                        $(element).datepicker({
																									                            id: 'orderDate_datePicker',
																									                            dateFormat: 'yy-mm-dd',	
																									                            changeYear: true,
																									                            changeMonth: true,
																									                            showOn: 'focus'
																									                        });
																									                    }
																									                }
					}
					, {name: 'COLLECT_PRICE'		, align: 'right'	, width: '8%', editable: true	, formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}
					, {name: 'COLLECT_PER'			, align: 'center'	, width: '4%', editable: true	, formatter : currencyFmatterPER}
					, {name: 'SALES_NUM'			, align: 'center'	, width: '0%', hidden: true}
					, {name: 'REVISION'				, align: 'center'	, width: '0%', hidden: true}
				]
				, autowidth: false
				, shrinkToFit: false
				, rowNum : 1000
				, rownumbers : true //자동으로 번호 부여 
				, ondblClickRow : function(rowid, iRow, iCol, e) {	
					var status = $(this).jqGrid('getCell', rowid, 'rowStatus');
					if(isEmpty(status)) {
						$("tr#" + rowid, $(this)).addClass('update');
						$(this).jqGrid('setCell', rowid, 'rowStatus', '수정');
					}
					
					$(this).jqGrid('editRow', rowid, {
						keys : false,
						onEnter : function(rowid, options, event) {
							$(this).jqGrid("saveRow", rowid, options);
							if(status == "추가") {
								$(this).jqGrid('setCell', rowid, 'rowStatus', '추가');
							} else if(isEmpty(status)) {
								$(this).jqGrid('setCell', rowid, 'rowStatus', '수정');
							}
						}
					});
				}
			});
			
			function currencyFmatterPER(cellvalue, options, rowObject) {
				var returnText = "";
				if(typeof(cellvalue) == 'number') {
					returnText = cellvalue + "%";
				} else if(typeof(cellvalue) == 'string') {
					returnText = cellvalue;
				}
				
				return returnText;
			}
			
			$("#table3").jqGrid({
				mtype : 'POST'
				, datatype : 'local'
				, height : 300
				, jsonReader: {
					repeatitems: false 
				}
				, colNames: langDetail2
				, colModel: [
					{name: 'rowStatus'			, align:'center'	, width: '3%'	, editable: false}
					, {name:'BUY_ITEM'			, align: 'center'	, width: '6%'	, editable: true	, formatter: 'select' , edittype: 'select' , editoptions: {value: BUY_ITEMSelect}}
					, {name: 'BUY_CNT'			, align: 'center'	, width: '4%'	, editable: true}
					, {name: 'BUY_UNIT'			, align: 'center'	, width: '4%'	, editable: true	, formatter: 'select' , edittype: 'select' , editoptions: {value: BUY_UNITSelect}}
					, {name: 'BUY_COIN'			, align: 'center'	, width: '4%'	, editable: true	, formatter: 'select' , edittype: 'select' , editoptions: {value: BUY_COINSelect}}
					, {name: 'BUY_UNIT_PRICE'	, align: 'right'	, width: '6%'	, editable: true	, formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}
					, {name: 'BUY_PRICE'		, align: 'right'	, width: '7%'	, editable: true	, formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}
					, {name: 'BUY_PURCHASE'		, align: 'center'	, width: '7%'	, editable: true}
					, {name: 'BUY_PAYMENT'		, align: 'center'	, width: '7%'	, editable: true}
					, {name: 'BUY_MEMO'			, align: 'center'	, width: '10%'	, editable: true}
					, {name: 'SALES_NUM'		, align: 'center'	, width: '0%'	, hidden: true}
					, {name: 'REVISION'			, align: 'center'	, width: '0%'	, hidden: true}
				]
				, autowidth: true
				, shrinkToFit: false
				, rowNum : 1000
				, rownumbers : true //자동으로 번호 부여 
				, ondblClickRow : function(rowid, iRow, iCol, e) {	
					var status = $(this).jqGrid('getCell', rowid, 'rowStatus');
					if(isEmpty(status)) {
						$("tr#" + rowid, $(this)).addClass('update');
						$(this).jqGrid('setCell', rowid, 'rowStatus', '수정');
					}
					
					$(this).jqGrid('editRow', rowid, {
						keys : false,
						onEnter : function(rowid, options, event) {
							$(this).jqGrid("saveRow", rowid, options);
							if(status == "추가") {
								$(this).jqGrid('setCell', rowid, 'rowStatus', '추가');
							} else if(isEmpty(status)) {
								$(this).jqGrid('setCell', rowid, 'rowStatus', '수정');
							}
						}
					});
				}
			});

			$("#table3").jqGrid('setGroupHeaders', {
				useColSpanStyle: true
				, groupHeaders: [
					{startColumnName:'BUY_COIN'			, numberOfColumns: 3	, titleText: '구매(원가)'}
					, {startColumnName:'BUY_PURCHASE'	, numberOfColumns: 2	, titleText: '구매'}
				]
			});
			
			$("#table4").jqGrid({
				mtype : 'POST'
				, datatype : 'local'
				, height : 300
				, jsonReader: {
					repeatitems: false 
				}
				, colNames: langDetail3
				, colModel: [
					{name:'MANHOUR_ITEM'			, align: 'center'	, width: '8%'	, editable: false	, formatter: 'select' , edittype: 'select' , editoptions: {value: MANHOUR_ITEMSelect}}
					, {name: 'MANHOUR_CNT'			, align: 'center'	, width: '5%'	, editable: true}
					, {name: 'MANHOUR_UNIT'			, align: 'center'	, width: '7%'	, editable: true	, formatter: 'select' , edittype: 'select' , editoptions: {value: MANHOUR_UNITSelect}}
					, {name: 'MANHOUR_UNIT_PRICE'	, align: 'right'	, width: '10%'	, editable: true	, formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}
					, {name: 'MANHOUR_PRICE'		, align: 'right'	, width: '10%'	, editable: true	, formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}
					, {name: 'MANHOUR_MEMO'			, align: 'left'		, width: '20%'	, editable: true}
					, {name: 'SALES_NUM'			, align: 'center'	, width: '0%'	, hidden: true}
					, {name: 'REVISION'				, align: 'center'	, width: '0%'	, hidden: true}
				]
				, autowidth: true
				, shrinkToFit: false
				, rowNum : 1000
				, rownumbers : true //자동으로 번호 부여 
				, ondblClickRow : function(rowid, iRow, iCol, e) {	
					var status = $(this).jqGrid('getCell', rowid, 'rowStatus');
					if(isEmpty(status)) {
						$("tr#" + rowid, $(this)).addClass('update');
						$(this).jqGrid('setCell', rowid, 'rowStatus', '수정');
					}
					
					$(this).jqGrid('editRow', rowid, {
						keys : false,
						onEnter : function(rowid, options, event) {
							$(this).jqGrid("saveRow", rowid, options);
							if(status == "추가") {
								$(this).jqGrid('setCell', rowid, 'rowStatus', '추가');
							} else if(isEmpty(status)) {
								$(this).jqGrid('setCell', rowid, 'rowStatus', '수정');
							}
						}
					});
				}
			});

			$("#table5").jqGrid({
				mtype : 'POST'
				, datatype : 'local'
				, height : 300
				, jsonReader: {
					repeatitems: false 
				}
				, colNames: langDetail4
				, colModel: [
					{name:'EXPENSE_ITEM'		, align: 'center'	, width: '10%'	, editable: false}
					, {name: 'EXPENSE_PRICE'	, align: 'right'	, width: '10%'	, editable: true	, formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}
					, {name: 'EXPENSE_MEMO'		, align: 'left'		, width: '30%'	, editable: true}
					, {name: 'SALES_NUM'		, align: 'center'	, width: '0%'	, hidden: true}
					, {name: 'REVISION'			, align: 'center'	, width: '0%'	, hidden: true}
				]
				, autowidth: true
				, shrinkToFit: false
				, rowNum : 1000
				, rownumbers : true //자동으로 번호 부여 
				, ondblClickRow : function(rowid, iRow, iCol, e) {	
					var status = $(this).jqGrid('getCell', rowid, 'rowStatus');
					if(isEmpty(status)) {
						$("tr#" + rowid, $(this)).addClass('update');
						$(this).jqGrid('setCell', rowid, 'rowStatus', '수정');
					}
					
					$(this).jqGrid('editRow', rowid, {
						keys : false,
						onEnter : function(rowid, options, event) {
							$(this).jqGrid("saveRow", rowid, options);
							if(status == "추가") {
								$(this).jqGrid('setCell', rowid, 'rowStatus', '추가');
							} else if(isEmpty(status)) {
								$(this).jqGrid('setCell', rowid, 'rowStatus', '수정');
							}
						}
					});
				}
			});

			$("#table6").jqGrid({
				mtype : 'POST'
				, datatype : 'local'
				, height : 300
				, jsonReader: {
					repeatitems: false 
				}
				, colNames: langDetail5
				, colModel: [
					{name:'COST_VENDOR'					, align: 'center'	, width: '8%'	, editable: true}
					, {name: 'COST_CNT'					, align: 'center'	, width: '5%'	, editable: true}
					, {name: 'COST_ORDER_PRICE'			, align: 'right'	, width: '8%'	, editable: true	, formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}
					, {name: 'COST_UNIT_PRICE'			, align: 'right'	, width: '8%'	, editable: true	, formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}
					, {name: 'COST_PRICE'				, align: 'right'	, width: '8%'	, editable: true	, formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}
					, {name: 'COST_SERVICE_UNIT_PRICE'	, align: 'right'	, width: '8%'	, editable: true	, formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}
					, {name: 'COST_SERVICE_PRICE'		, align: 'right'	, width: '8%'	, editable: true	, formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}
					, {name: 'COST_TOTAL_PRICE'			, align: 'right'	, width: '8%'	, editable: true	, formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}
					, {name: 'COST_MEMO'				, align: 'left'		, width: '15%'	, editable: true}
					, {name: 'SALES_NUM'				, align: 'center'	, width: '0%'	, hidden: true}
					, {name: 'REVISION'					, align: 'center'	, width: '0%'	, hidden: true}
				]
				, autowidth: true
				, shrinkToFit: false
				, rowNum : 1000
				, rownumbers : true //자동으로 번호 부여 
				, ondblClickRow : function(rowid, iRow, iCol, e) {	
					var status = $(this).jqGrid('getCell', rowid, 'rowStatus');
					if(isEmpty(status)) {
						$("tr#" + rowid, $(this)).addClass('update');
						$(this).jqGrid('setCell', rowid, 'rowStatus', '수정');
					}
					
					$(this).jqGrid('editRow', rowid, {
						keys : false,
						onEnter : function(rowid, options, event) {
							$(this).jqGrid("saveRow", rowid, options);
							if(status == "추가") {
								$(this).jqGrid('setCell', rowid, 'rowStatus', '추가');
							} else if(isEmpty(status)) {
								$(this).jqGrid('setCell', rowid, 'rowStatus', '수정');
							}
						}
					});
				}
			});

			$("#table6").jqGrid('setGroupHeaders', {
				useColSpanStyle: true
				, groupHeaders: [
					{startColumnName:'COST_UNIT_PRICE'				, numberOfColumns: 2	, titleText: '설치비'}
					, {startColumnName:'COST_SERVICE_UNIT_PRICE'	, numberOfColumns: 2	, titleText: '서비스(3%)'}
				]
			});
			
			$("#table7").jqGrid({
				mtype : 'POST'
				, datatype : 'local'
				, height : 300
				, jsonReader: {
					repeatitems: false 
				}
				, colNames: langDetail6
				, colModel: [
					{name:'SM_ITEM'					, align: 'center'	, width: '200%'	, editable: true}
					, {name: 'SM_CLASS'				, align: 'center'	, width: '200%'	, editable: true}
					, {name: 'SM_DELIVERY_DT'		, align: 'center'	, width: '200%'	, editable: true	, editoptions: {dataInit: function (element) {
																											                        $(element).datepicker({
																											                            id: 'orderDate_datePicker',
																											                            dateFormat: 'yy-mm-dd',	
																											                            changeYear: true,
																											                            changeMonth: true,
																											                            showOn: 'focus'
																											                        });
																											                    }
																											                }
					}
					, {name: 'SM_INSPECT_DT'		, align: 'center'	, width: '200%'	, editable: true	, editoptions: {dataInit: function (element) {
																											                        $(element).datepicker({
																											                            id: 'orderDate_datePicker',
																											                            dateFormat: 'yy-mm-dd',	
																											                            changeYear: true,
																											                            changeMonth: true,
																											                            showOn: 'focus'
																											                        });
																											                    }
																											                }
					}
					, {name: 'SM_WARRANTY'			, align: 'center'	, width: '200%'	, editable: true}
					, {name: 'SM_MAINTENANCE_DT'	, align: 'center'	, width: '200%'	, editable: true	, editoptions: {dataInit: function (element) {
																											                        $(element).datepicker({
																											                            id: 'orderDate_datePicker',
																											                            dateFormat: 'yy-mm-dd',	
																											                            changeYear: true,
																											                            changeMonth: true,
																											                            showOn: 'focus'
																											                        });
																											                    }
																											                }
					}
					, {name: 'SM_MAINTENANCE_PRICE'	, align: 'right'	, width: '200%'	, editable: true	, formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}
					, {name: 'SM_BACKLINE'			, align: 'center'	, width: '200%'	, editable: true}
					, {name: 'SM_BACKLINE_PRICE'	, align: 'right'	, width: '200%'	, editable: true	, formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}
					, {name: 'SM_BACKLINE_GOAL'		, align: 'right'	, width: '200%'	, editable: true	, formatter : "integer", formatoptions : {defaultValue : "", thousandsSeparator : ","}}
					, {name: 'SALES_NUM'			, align: 'center'	, width: '0%'	, hidden: true}
					, {name: 'REVISION'				, align: 'center'	, width: '0%'	, hidden: true}
				]
				, autowidth: true
				, shrinkToFit: false
				, rowNum : 1000
				, rownumbers : true //자동으로 번호 부여 
				, ondblClickRow : function(rowid, iRow, iCol, e) {	
					var status = $(this).jqGrid('getCell', rowid, 'rowStatus');
					if(isEmpty(status)) {
						$("tr#" + rowid, $(this)).addClass('update');
						$(this).jqGrid('setCell', rowid, 'rowStatus', '수정');
					}
					
					$(this).jqGrid('editRow', rowid, {
						keys : false,
						onEnter : function(rowid, options, event) {
							$(this).jqGrid("saveRow", rowid, options);
							if(status == "추가") {
								$(this).jqGrid('setCell', rowid, 'rowStatus', '추가');
							} else if(isEmpty(status)) {
								$(this).jqGrid('setCell', rowid, 'rowStatus', '수정');
							}
						}
					});
				}
			});

			$("#table8").jqGrid({
				mtype : 'POST'
				, datatype : 'local'
				, height : 300
				, jsonReader: {
					repeatitems: false 
				}
				, colNames: langDetail7
				, colModel: [
					{name:'DETAIL_TRANSACTIONAL'		, align: 'left', width: '50%', editable: true, edittype: 'textarea'
// 						,
// 						editoptions : {
// 							dataEvents : [ {
// 								type : 'blur',
// 								fn : function(e) {debugger;
// 									var colModel = $("#table8").jqGrid("getGridParam", "colModel");
// 									var colId = $.jgrid.getCellIndex($(e.target).closest("td")[0]);
// 									if(colModel[colId].name == "DETAIL_TRANSACTIONAL"){
// 										$("#table8").jqGrid("saveRow", 1);
// 									}
// 								}
// 							} ]
// 						}
					}
					, {name: 'DETAIL_SIGNIFICANT'		, align: 'left', width: '50%', editable: true, edittype: 'textarea'
						,
						editoptions : {
							dataEvents : [ {
								type : 'blur',
								fn : function(e) {
// 									var colModel = $("#table8").jqGrid("getGridParam", "colModel");
// 									var colId = $.jgrid.getCellIndex($(e.target).closest("td")[0]);
// 									if(colModel[colId].name == "DETAIL_SIGNIFICANT"){
										$("#table8").jqGrid("saveRow", 1);
// 									}
								}
							} ]
						}
					}
					, {name: 'SALES_NUM'				, align: 'center'	, width: '0%'	, hidden: true}
					, {name: 'REVISION'					, align: 'center'	, width: '0%'	, hidden: true}
				]
				, autowidth: true
				, shrinkToFit: false
				, rowNum : 1000
				, ondblClickRow : function(rowid, iRow, iCol, e) {
					var status = $(this).jqGrid('getCell', rowid, 'rowStatus');
					if(isEmpty(status)) {
						$("tr#" + rowid, $(this)).addClass('update');
						$(this).jqGrid('setCell', rowid, 'rowStatus', '수정');
					}
					
					$(this).jqGrid('editRow', rowid, {keys : false});
				}
// 				, afterEditCell : function(rowid, cellname, value, iRow, iCol) {
// 					console.log("afterEdiltCell 실행.");
// 					$("#"+iRow+"_"+cellname).blur(function(){
// 						$("#table8").jqGrid("saveCell",iRow,iCol);

// 					});
// 				}
			});
		};

// 		function selectSalesNum(){
// 			var searchParam = {
// 					OFFICE : $("#OFFICE_TYPE").val()
// 			};
			
// 			getAjaxJsonData("sa1000SelSalesNum", searchParam, "selectSalesNumCallBack");
// 		};
		
// 		function selectSalesNumCallBack(data){debugger;
//  			$("#SALES_NUM").val("");
// 		};

		function setSalesNum(){
			var now = new Date();
			var office = $("#OFFICE_TYPE").val();
			var salseNum1 = "";
			var salseNum2 = now.getFullYear();
			var salseNum3 = now.getMonth() + 1;
			
			if(office == "OFFICE1SEOUL") {
				salseNum1 = "S-";
			} else if(office == "OFFICE2ULSAN") {
				salseNum1 = "U-";
			} else if(office == "OFFICE3DAEGU") {
				salseNum1 = "D-";
			}
			
			salseNum2 = salseNum2.toString().substr(2, 2);
			salseNum3 = salseNum3 < 10 ? "0" + salseNum3 + "-" : salseNum3 + "-";
			
			$("#SALES_NUM").val("HC" + salseNum1 + salseNum2 + salseNum3);
			$("#REVISION").val("00");
		}

		function clearGridData() {
			var mm = (nowDate.getMonth()+1) < 10 ? "0" + (nowDate.getMonth()+1) : (nowDate.getMonth()+1);
			var yy = nowDate.getDate() < 10 ? "0" + nowDate.getDate() : nowDate.getDate();
			$("#date01_REG_DT").text(nowDate.getFullYear() + "-" + mm + "-" + yy);
			
			$("#OFFICE_TYPE").find("option:eq(0)").prop("selected", "selected");
			setSalesNum();
 			$("#PROJECT_NM").val("");
 			$("#OBTAIN_ACCOUNT").val("");
 			$("#OBTAIN_SALES_PIC").val("");
 			$("#OBTAIN_CONTRACT_DT").val("");
 			$("#OBTAIN_ITEM").val("");
 			$("#OBTAIN_PM").val("");
 			$("#OBTAIN_PROJECT_START").val("");
 			$("#OBTAIN_PROJECT_END").val("");
 			$("#OBTAIN_ITEM_CNT").val("");
 			
 			$("#pop01_lb01_REASON").text("");
 			$("#OBTAIN_REASON").addClass('dis-n');
 			
 			$("#currency_VAL").text("");

 			$("#COLLECT_UNIT_PRICE").val("");
 			$("#COLLECT_SALES_AMOUNT").val("");
 			$("#COLLECT_MARGIN_PER").val("");
 			$("#COLLECT_MARGIN").val("");
 			$("#COLLECT_FINAL_MARGIN_PER").val("");
 			$("#COLLECT_FINAL_MARGIN").val("");
			
			$("#table2").clearGridData();
			$("#table3").clearGridData();
			$("#table4").clearGridData();
			$("#table5").clearGridData();
			$("#table6").clearGridData();
			$("#table7").clearGridData();
			$("#table8").clearGridData();
			
			insertGrid1('');
			// insertGrid1('선금');
			// insertGrid1('중도금');
			// insertGrid1('잔금');

			insertGrid2('ITEM1ITEMPRINCIPAL');
			// insertGrid2('ITEM2SENIOR');
			// insertGrid2('ITEM3INTERMEDIATE');
			// insertGrid2('ITEM4JUNIOR');
			// insertGrid2('ITEM5HW');
			// insertGrid2('ITEM6SW');
			// insertGrid2('ITEM7COST');

			insertGrid3('ITEMMM1PRINCIPAL');
			insertGrid3('ITEMMM2SENIOR');
			insertGrid3('ITEMMM3INTERMEDIATE');
			insertGrid3('ITEMMM4JUNIOR');
			
			insertGrid4('출장경비 / 회의비 / 기타경비 등');
			
			insertGrid7();
		}
		
		/* 그리드row 클릭시 값 세팅 */
		function updateGridData(selRowData){
			$("#OFFICE_TYPE").val(selRowData.OFFICE_TYPE);
 			$("#SALES_NUM").val(selRowData.SALES_NUM);
 			$("#REVISION").val(selRowData.REVISION);
 			$("#PROJECT_NM").val(selRowData.PROJECT_NM);
 			$("#OBTAIN_ACCOUNT").val(selRowData.OBTAIN_ACCOUNT);
 			$("#OBTAIN_SALES_PIC").val(selRowData.OBTAIN_SALES_PIC);
 			$("#OBTAIN_CONTRACT_DT").val(selRowData.OBTAIN_CONTRACT_DT);
 			$("#OBTAIN_ITEM").val(selRowData.OBTAIN_ITEM);
 			$("#OBTAIN_PM").val(selRowData.OBTAIN_PM);
 			$("#OBTAIN_PROJECT_START").val(selRowData.OBTAIN_PROJECT_START);
 			$("#OBTAIN_PROJECT_END").val(selRowData.OBTAIN_PROJECT_END);
 			$("#OBTAIN_ITEM_CNT").val(selRowData.OBTAIN_ITEM_CNT);
 			
 			$("#pop01_lb01_REASON").text("11. 변경사유");
 			$("#OBTAIN_REASON").removeClass('dis-n');
 			$("#OBTAIN_REASON").val(selRowData.OBTAIN_REASON);
 			
 			changeContractDt($("#OBTAIN_CONTRACT_DT").val()); 			

 			$("#COLLECT_UNIT_PRICE").val(selRowData.COLLECT_UNIT_PRICE);
 			$("#COLLECT_SALES_AMOUNT").val(selRowData.COLLECT_SALES_AMOUNT);
 			$("#COLLECT_MARGIN_PER").val(selRowData.COLLECT_MARGIN_PER);
 			$("#COLLECT_MARGIN").val(selRowData.COLLECT_MARGIN);
 			$("#COLLECT_FINAL_MARGIN_PER").val(selRowData.COLLECT_FINAL_MARGIN_PER);
 			$("#COLLECT_FINAL_MARGIN").val(selRowData.COLLECT_FINAL_MARGIN);
		}
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: CRUD
		/* Table 조회 */
		function searchGridData(){
			var searchParam = {
				SEARCH_VAL : $("#sel01_SALE_SEARCH").val()
				, SEARCH_TEXT : $("#txt01_SALE_SEARCH").val()
				, PRE_REVISION : $("#chk01_PRE").is(":checked") == true ? "Y" : "N"
			};
			
			getAjaxJsonData("sa1000Sel", searchParam, "searchGridDataCallBack");
		};
		
		function searchGridDataCallBack(data){
			$("#table1").clearGridData();
			$("#table1").jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");

			clearGridData();
		};

		function searchGrid1Data(num, revision){
			var searchParam = {
					SALES_NUM : num
					, REVISION : revision
			};
			
			getAjaxJsonData("sa1001Sel", searchParam, "searchGrid1DataCallBack");
		};
		
		function searchGrid1DataCallBack(data){
			$("#table2").clearGridData();
			$("#table2").jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");
		};

		function searchGrid2Data(num, revision){
			var searchParam = {
					SALES_NUM : num
					, REVISION : revision
			};
			
			getAjaxJsonData("sa1002Sel", searchParam, "searchGrid2DataCallBack");
		};
		
		function searchGrid2DataCallBack(data){
			$("#table3").clearGridData();
			$("#table3").jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");
		};

		function searchGrid3Data(num, revision){
			var searchParam = {
					SALES_NUM : num
					, REVISION : revision
			};
			
			getAjaxJsonData("sa1003Sel", searchParam, "searchGrid3DataCallBack");
		};
		
		function searchGrid3DataCallBack(data){
			$("#table4").clearGridData();
			$("#table4").jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");
		};

		function searchGrid4Data(num, revision){
			var searchParam = {
					SALES_NUM : num
					, REVISION : revision
			};
			
			getAjaxJsonData("sa1004Sel", searchParam, "searchGrid4DataCallBack");
		};
		
		function searchGrid4DataCallBack(data){
			$("#table5").clearGridData();
			$("#table5").jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");
		};

		function searchGrid5Data(num, revision){
			var searchParam = {
					SALES_NUM : num
					, REVISION : revision
			};
			
			getAjaxJsonData("sa1005Sel", searchParam, "searchGrid5DataCallBack");
		};
		
		function searchGrid5DataCallBack(data){
			$("#table6").clearGridData();
			$("#table6").jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");
		};

		function searchGrid6Data(num, revision){
			var searchParam = {
					SALES_NUM : num
					, REVISION : revision
			};
			
			getAjaxJsonData("sa1006Sel", searchParam, "searchGrid6DataCallBack");
		};
		
		function searchGrid6DataCallBack(data){
			$("#table7").clearGridData();
			$("#table7").jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");
		};

		function searchGrid7Data(num, revision){
			var searchParam = {
					SALES_NUM : num
					, REVISION : revision
			};
			
			getAjaxJsonData("sa1007Sel", searchParam, "searchGrid7DataCallBack");
		};
		
		function searchGrid7DataCallBack(data){
			$("#table8").clearGridData();
			$("#table8").jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");
		};
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 유효성
		
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: Popup
	</script>
</html>