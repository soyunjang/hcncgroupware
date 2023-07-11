<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Object NOTICE = session.getAttribute("NOTICE");
%>
<!DOCTYPE html>
<html>
	<body>
		<div id="framemain" class="tab-content active">
			<div class="contents-wrap exam-page">  <!-- 컨텐츠 시작★ 각 페이지 class명 지정 : ex.test-page -->
                <div class="page-title-wrap">
	                <div class="page-title">
	                	<h2>타이틀 영역</h2>
	                    <ul>
	                    	 <li><a href="javascript:void(0);" title="초기화" class="btn-reset"></a></li>
	                    </ul>
	                </div>
                    <div class="page-btn-wrap">
		               <ul>
			               <li><a href="javascript:void(0);" title="엑셀" class="btn-excel">엑셀</a></li>
			               <li><a href="javascript:void(0);" title="닫기" class="btn-close">닫기</a></li>
		               </ul>
		            </div>
                </div>
                <div class="tab-wrap">
                    <ul>
                        <li class="on"><a href="javascript:void(0);">Tab 1</a></li>
                        <li class=""><a href="javascript:void(0);">Tab 2</a></li>
                    </ul>
                </div>
                <div class="tab-cont-wrap">
                    <div class="tab-cont-01 on">
                        <div class="search-wrap active">  <!-- 검색영역 시작★ .search-wrap -->
                            <div class="sch-box">
                                <dl>
                                    <dt>조회기간</dt>
                                    <dd>
                                        <ul class="date-box">
                                            <li>
                                                <input type="date" id="date01" name="date" size="12">
                                                <label for="" class="hide">시작일</label>
                                            </li>
                                            <li>&nbsp;~&nbsp;</li>
                                            <li><input type="date" id="date02" size="12">
                                                <label for="" class="hide">종료일</label>
                                            </li>
                                        </ul>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>Select</dt>
                                    <dd>
                                        <select title="">
                                            <option value="==선택==">==선택==</option>
                                            <option>select</option>
                                            <option>select</option>
                                        </select>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>Radio</dt>
                                    <dd>
                                        <ul class="radio-box">
                                            <li><input type="radio" id="radio01" name="radiogroup" checked=""><label for="radio01">yes</label></li>
                                            <li><input type="radio" id="radio02" name="radiogroup"><label for="radio02">no</label></li>
                                            <li><input type="radio" id="radio02" name="radiogroup-dis" disabled="" checked=""><label for="radio02">disable</label></li>
                                        </ul>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt><label for="" class="">텍스트</label></dt>
                                    <dd>
                                        <input type="text" id="">
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>검색</dt>
                                    <dd>
                                        <div class="input-srch">
                                            <input type="text" id="" class=""><label for="" class="hide">검색</label>
                                            <a href="javascript:void(0);" title="검색" class="btn-srch"></a>
                                            <a href="javascript:void(0);" title="초기화" class="btn-reset"></a>
                                        </div>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>Checkbox</dt>
                                    <dd>
                                        <ul class="check-box">
                                            <li><input type="checkbox" id="check01" name="checkgroup" checked=""><label for="check01">yes</label></li>
                                            <li><input type="checkbox" id="check02" name="checkgroup"><label for="check02">no</label></li>
                                            <li><input type="checkbox" id="check02" name="checkgroup" disabled="" checked=""><label for="check03">disable</label></li>
                                        </ul>
                                    </dd>
                                </dl>
                            </div>
                            <div class="srch-btn">
                                <ul>
                                    <li><a href="javascript:void(0);" title="검색" class="btn-search">검색</a></li>
                                </ul>
                            </div>
                        </div> <!-- // search-wrap end-->

                        <div class="row row-1">
                            <section class="wp70">  <!-- 04.TABLE - List 스타일 -->
                                <div class="title-wrap">
                                    <div class="title-zone">
                                        <h2 class="title">게시판 LIST<span>안내글 작성란입니다.</span></h2>
                                    </div>
                                    <div class="btn-right-box">
                                        <ul>
                                        	<li><a href="#" title="팝업" class="btn-popup-open" onclick="openConfirmPopup();">알림팝업</a></li>
                                        	<li><a href="javascript:void(0);" title="팝업" class="" onclick="openToastPopup();">토스트팝업</a></li>
                                        	<li><a href="javascript:void(0);" title="팝업" class="" onclick="openModalPopup();">팝업</a></li>
                                            <li><a href="javascript:void(0);" title="추가" class="">추가</a></li>
                                            <li><a href="javascript:void(0);" title="수정" class="">수정</a></li>
                                            <li><a href="javascript:void(0);" title="삭제" class="">삭제</a></li>
                                            <li><a href="javascript:void(0);" title="저장" class="bg-red">저장</a></li>
                                        </ul>
                                    </div>
                                </div> 
                                <div class="table-wrap"> <!-- Table - list -->
                                	<table id="table1" class="table1"></table>
                                </div>
                                <div class="paging-box">
                                    <ul>
                                        <li><a href="javascript:void(0);" title="처음" class="btn-first"></a></li>
                                        <li><a href="javascript:void(0);" title="이전" class="btn-prev"></a></li>
                                        <li><a href="javascript:void(0);" title="">1</a></li>
                                        <li><a href="javascript:void(0);" title="">2</a></li>
                                        <li><a href="javascript:void(0);" title="">3</a></li>
                                        <li><a href="javascript:void(0);" title="">4</a></li>
                                        <li><a href="javascript:void(0);" title="">5</a></li>
                                        <li><a href="javascript:void(0);" title="다음" class="btn-next"></a></li>
                                        <li><a href="javascript:void(0);" title="마지막" class="btn-last"></a></li>
                                    </ul>
                                </div>
                            </section>
                            <section class="wp30">  <!-- Treemenu 스타일 -->
                                <div class="title-wrap">
                                    <h2>Treemenu</h2>
                                    <div class="btn-right-box">
                                        <ul>
                                            <li><a href="javascript:void(0);" title="버튼" class="bg-gray">취소</a></li>
                                            <li><a href="javascript:void(0);" title="버튼" class="bg-red">저장</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="table-wrap tree-wrap">
                                	<table id="treegrid01"></table>
                                </div>
                            </section>
                        </div>
                    </div>
                    <div class="tab-cont-02" style="display: none;">
                        <div class="row row-3">
                            <section class="wp50">  <!-- 04.TABLE - write 스타일 -->
                                <h2>상세내용</h2>
                                <table class="table-write">
                                    <caption>Table List</caption>
                                    <colgroup>
                                        <col class="wp20">
                                        <col class="wp30">
                                        <col class="wp20">
                                        <col class="wp30">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><span class="req">텍스트</span></th>
                                            <td></td>
                                            <th><label for="">텍스트</label></th>
                                            <td><input type="text" id="" class="readonly" readonly></td>
                                        </tr>
                                        <tr>
                                            <th>텍스트</th>
                                            <td></td>
                                            <th><labe for="">라디오</labe></th>
                                            <td>
                                                <div class="radio-box">
                                                    <input type="radio" name="state" id="yes">
                                                    <label for="yes">yes</label>
                                                    <input type="radio" name="state" id="no">
                                                    <label for="no">no</label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>검색</th>
                                            <td>
                                            	<div class="input-srch">
				                					<input type="text" id=""/>
							    					<a href="javascript:void(0);" title="검색" class="btn-srch" id="menu_nm_popup"></a>
							                	</div>
						                	</td>
                                            <th><label for="">텍스트</label></th>
                                            <td><input type="text" id=""></td>
                                        </tr>
                                        <tr>
                                            <th><span class="req">텍스트</span></th>
                                            <td colspan="3">
                                                <textarea class="h50"></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<th></th>
                                        	<td colspan="3">
                                        		<div class="btn-detail-wrap">
                                        			<input type="text" id="">
	                                        		<ul>
	                                        			<li><a href="#" class="" title="중복확인">중복확인</a></li>
	                                        			<li><a href="#" class="btn-black" title="변경">변경</a></li>
	                                        		</ul>
                                        		</div>
                                        	</td>
                                        </tr>
                                        <tr>
                                        	<th></th>
                                        	<td colspan="3">
                                        		<ul>
                                        			<li><a href="#" class="" title="중복확인">중복확인</a></li>
                                        			<li><a href="#" class="btn-black" title="변경">변경</a></li>
                                        		</ul>
                                        	</td>
                                        </tr>
                                        <tr>
                                       		<th></th>
                                       		<td colspan="3">
                                       		 	<div id="editor"></div>
                                      	    </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="btn-center-box">
                                    <ul>
                                        <li><a href="javascript:void(0);" title="버튼" class="bg-gray black">버튼</a></li>
                                        <li><a href="javascript:void(0);" title="버튼">버튼</a></li>
                                    </ul>
                                </div>
                            </section>
                            <section class="wp50">  <!-- 04.TABLE - List 스타일 -->
                                <div class="title-wrap">
                                    <h2 class="title">게시판 LIST</h2>
                                    <div class="btn-right-box">
                                        <ul>
                                            <li><a href="javascript:void(0);" title="버튼" class="">버튼</a></li>
                                        </ul>
                                    </div>
                                </div>                        
                                <table class="table-list">
                                    <caption>Table List</caption>
                                    <colgroup>
                                        <col class="wp10">
                                        <col class="wp10">
                                        <col class="wp45">
                                        <col class="wp15">
                                        <col class="wp15">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>순번</th>
                                            <th>유형</th>
                                            <th>제목</th>
                                            <th>등록일자</th>
                                            <th>버튼</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td><span class="ico-notice">공지</span></td>
                                            <td class="ta-l">테이블 리스트 테스트</td>
                                            <td>2022.02.22</td>
                                            <td><a href="javascript:void(0);" title="미리보기" class="btn">미리보기</a></td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td><span class="ico-notice">공지</span></td>
                                            <td class="ta-l">테이블 리스트 테스트</td>
                                            <td>2022.02.22</td>
                                            <td><a href="javascript:void(0);" title="미리보기" class="btn">미리보기</a></td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td><span class="ico-notice">공지</span></td>
                                            <td class="ta-l">테이블 리스트 테스트</td>
                                            <td>2022.02.22</td>
                                            <td><a href="javascript:void(0);" title="미리보기" class="btn">미리보기</a></td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td><span class="ico-notice">공지</span></td>
                                            <td class="ta-l">테이블 리스트 테스트</td>
                                            <td>2022.02.22</td>
                                            <td><a href="javascript:void(0);" title="미리보기" class="btn">미리보기</a></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="paging-box">
                                    <ul>
                                        <li><a href="javascript:void(0);" title="처음" class="btn-first"></a></li>
                                        <li><a href="javascript:void(0);" title="이전" class="btn-prev"></a></li>
                                        <li><a href="javascript:void(0);" title="">1</a></li>
                                        <li><a href="javascript:void(0);" title="">2</a></li>
                                        <li><a href="javascript:void(0);" title="">3</a></li>
                                        <li><a href="javascript:void(0);" title="">4</a></li>
                                        <li><a href="javascript:void(0);" title="">5</a></li>
                                        <li><a href="javascript:void(0);" title="다음" class="btn-next"></a></li>
                                        <li><a href="javascript:void(0);" title="마지막" class="btn-last"></a></li>
                                    </ul>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
		</div>
		<!-- modal start -->
		<div id="viewForm" style="display: none;">
			<div class="modal-cont">
				<div class="modal-search-wrap">
					<div class="srch-box">
						<dl>
							<dt>설비명</dt>
							<dd><input type="text" id="popSearchVal"></dd>
						</dl>
						<dl>
							<dt>설비등급</dt>
							<dd>
								<select id="POP_EQUIP_LVL"></select>
							</dd>
						</dl>
					</div>
					<div class="srch-btn">
						<ul class="btn-right-wrap">
							<li><a href="javascript:void(0);" id="btn_popSearch" title="조회" class="btn-search">조회</a></li>
							<li><a href="javascript:void(0);" id="btn_popReset" title="초기화" class="btn-reset"></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- modal end -->
		<div class="popup-wrap">
			<div class="popup-cont">
				<p>저장하시겠습니까?</p>
				<p>두줄 예시입니다.</p>
			</div>
			<div class="popup-btn">
				<a href="#" title="" class="">확인</a>
				<a href="#" title="" class="bg-gray btn-close">취소</a>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		$(document).ready(function() {
			function init() {
				jQuery("#treegrid01").jqGrid( 'setGridWidth', (jQuery(".tree-wrap").width()),true);
				jQuery("#table1").jqGrid( 'setGridWidth', (jQuery(".table-wrap").width()),true);
			}
			
			jQuery(window).on('resize.jqGrid', function () {
				jQuery("#treegrid01").jqGrid( 'setGridWidth', (jQuery(".tree-wrap").width()),true);
				jQuery("#table1").jqGrid( 'setGridWidth', (jQuery(".table-wrap").width()),true);
			});
			
			setGrid();
			initTreeGrid1();
			init(); // treegrid End
		});
		
		var treedata = [{
		    id: "1",
		    name: "TREE EXAMPLE",
		    category: "테스트",
		    level: "0",
		    parent: "null",
		    isLeaf: false,
		    expanded: false,
		    loaded: true
		}, {
		    id: "2",
		    name: "[임시]임시과제",
		    category: "준영구",
		    level: "1",
		    parent: "1",
		    isLeaf: false,
		    expanded: false,
		    loaded: true
		}, {
		    id: "3",
		    name: "[임시]당직관리",
		    category: "준영구",
		    level: "2",
		    parent: "2",
		    isLeaf: true,
		    expanded: false,
		    loaded: true,
		    icon: "ui-icon-flag"
		}, {
		    id: "4",
		    name: "[임시] 사용자계정 관리",
		    category: "5년",
		    level: "2",
		    parent: "2",
		    isLeaf: true,
		    expanded: false,
		    loaded: true,
		    icon: "ui-icon-flag"
		}, {
		    id: "5",
		    name: "[공통]부서 노무관리",
		    category: "5년",
		    level: "1",
		    parent: "1",
		    isLeaf: false,
		    expanded: false,
		    loaded: true,
		    icon: "ui-icon-flag"
		}, {
		    id: "6",
		    name: "[공통]부서 보안관리",
		    category: "5년",
		    level: "1",
		    parent: "1",
		    isLeaf: false,
		    expanded: false,
		    loaded: true,
		    icon: "ui-icon-flag"
		}, {
		    id: "7",
		    name: "[공통]부서 복무관리",
		    category: "5년",
		    level: "1",
		    parent: "1",
		    isLeaf: false,
		    expanded: false,
		    loaded: true,
		    icon: "ui-icon-flag"
		}, {
		    id: "8",
		    name: "[공통]부서 서무관리",
		    category: "5년",
		    level: "1",
		    parent: "1",
		    isLeaf: false,
		    expanded: false,
		    loaded: true,
		    icon: "ui-icon-flag"
		},{
		    id: "9",
		    name: "[공통]부서 예산관리",
		    category: "5년",
		    level: "1",
		    parent: "1",
		    isLeaf: false,
		    expanded: false,
		    loaded: true,
		    icon: "ui-icon-flag"
		}];
		
		function initTreeGrid1(data){
			var $grid = $("#treegrid01");
			var getColumnIndexByName = function (columnName) {
				var $this = $(this);
				var cm = $this.jqGrid('getGridParam', 'colModel');
				var l = cm.length;
				for (var i = 0; i < l; i++) {
					if (cm[i].name === columnName) {
						return i; // return the index
					}
				}
				return -1;
			}
			var orgExpandNode = $.fn.jqGrid.expandNode;
			var orgCollapseNode = $.fn.jqGrid.collapseNode;
			var lastSel;
			
			$.jgrid.formatter.integer.thousandsSeparator = ',';
			$.jgrid.formatter.number.thousandsSeparator = ',';
			$.jgrid.formatter.currency.thousandsSeparator = ',';
			
			$grid.jqGrid({
				datatype: "jsonstring",
			    datastr: treedata,
			    caption: "",
			    colNames:['단위과제별 기록물철','보존기간'],
			    colModel: [
			        { name: 'name', index:1, align:"left"},
			        { name: 'category', index:2, align:"center" }
			    ]
				,jsonReader: {
			        repeatitems: false,
			        root: function (obj) {
			            return obj;
			        },
			        page: function () {
			            return 1;
			        },
			        total: function () {
			            return 1;
			        },
			        records: function (obj) {
			            return obj.length;
			        }
			    }
				, height: 420
				, autowidth: true
				, gridview: true
				, treeGrid: true
				, treeGridModel: 'adjacency'
				, ExpandColumn: 'name'
				, treedatatype: "local"
				, ExpandColClick: true
			});
			
			$grid.jqGrid('setGridParam', {
				treeGrid: false
			});
			
			$grid.jqGrid('sortableRows', {
				update: function (e, ui) {
					var $myGrid = $(this).parent();
					var newParent;
					var newLevel;
					var prevId;
					var rowPrevData;
					var $iconDiv;
					var iCol;
					var rowid = ui.item[0].id;
					var rowData = $myGrid.jqGrid('getLocalRow', rowid);
					var $tr = $('#' + $.jgrid.jqID(rowid));
					
					if ($tr[0].rowIndex > 1) {
						prevId = $tr.prev().attr('id');
						rowPrevData = $myGrid.jqGrid('getLocalRow', prevId);
						if (rowPrevData.isLeaf) {
							newLevel = Number(rowPrevData.level);
							newParent = rowPrevData.parent;
						} else {
							newLevel = Number(rowPrevData.level) + 1;
							newParent = prevId;
						}
					} else {
						newParent = "null";
						newLevel = 0;
					}
					
					rowData.parent = newParent;
					rowData.level = newLevel;
					$iconDiv = $tr.find("div.tree-wrap");
					$iconDiv.width((newLevel + 1) * 12); // 18px per level
					$iconDiv.children("div.treeclick:first").css("left", (newLevel * 12) + 'px');
					
					iCol = getColumnIndexByName.call($grid[0], "level");
					$tr.children('td:eq(' + iCol + ')').text(newLevel);
				}
			});
			
			$grid.jqGrid('setGridParam', {
				treeGrid: true
			});
			
			$.jgrid.extend({
				expandNode: function (rc) {
					var ret = orgExpandNode.call(this, rc);
					if (!rc.isLeaf && (rc.level === "0" || rc.level === 0)) {
						$("#" + rc._id_ + " div.treeclick")
							.removeClass("ui-icon-triangle-1-s ui-icon-carat-1-e")
							.addClass("ui-icon-carat-1-s");
					}
					
					return ret;
				}
				, collapseNode: function (rc) {
					var ret = orgCollapseNode.call(this, rc);
					if (!rc.isLeaf && (rc.level === "0" || rc.level === 0)) {
						$("#" + rc._id_ + " div.treeclick")
							.removeClass("ui-icon-triangle-1-e ui-icon-carat-1-s")
							.addClass("ui-icon-carat-1-e");
					}
					
					return ret;
				}
			});
		}
		
		function setGrid(){
			$("#table1").jqGrid({
				mtype: 'POST'
				, datatype: 'local'
				, jsonReader: {
					repeatitems: false
				}
				, colNames: ['시스템코드', '시스템명', '사용유무' , '비고']
				, colModel: [
					{name:'SYS_CLASS_CD', align:'right'}
					, {name:'SYS_CLASS_NAME', align:'right'}
					, {name:'USE_YN', align:'center'}
					, {name:'MEMO', align:'right'}
				]
				, autowidth: true
				, shrinkToFit: false
				, onSelectRow: function(rowid, status, e){
					var rowdata = $("#table1").getRowData(rowid);
					var seachParam = {
						SYS_CLASS_CD : rowdata.SYS_CLASS_CD
					};
					
					getAjaxJsonData("cm1000DetailSel", seachParam, "searchGridDataDetailCallBack");
				}
			});
			
			searchGridDataHead();
		};
		
		function searchGridDataHead(){
			
			getAjaxJsonData("cm1000HeadSel", {}, "searchGridDataHeadCallBack");
		};
		
		function searchGridDataHeadCallBack(data) {
			$("#table1").clearGridData();
			$('#table1').jqGrid('setGridParam', {
				datatype: 'local'
				, data: data
			}).trigger("reloadGrid");
		};
		function openToastPopup(){
			$.iGrowl({
		        title: "테스트",
		        message: "처리가 완료되었습니다.",
		        type: "error",
		        //info, success, notice, error, simple
		        animShow: "fadeIn",
		        animHide: "fadeOut",
		        animation: true,
		        icon: "error",
		        placement: {
		            x: "center",
		            y: "middle"
		        },
		        delay: 12000
		    });
		};
		
		function openModalPopup(){
			$("#viewForm").dialog({
				autoOpen: true
				, title: "설비 리스트"
				, width: 900
				, height: 200
				, modal: true
				, open: function (event, ui) {
					popReset("viewForm");
				}
				, close: function () {
					$(this).dialog("close");
				}
				, buttons: {
					"닫기": function () {
						$(this).dialog("close");
					}
				}
				, focus: function (event, ui) {}
			}).css("z-index", 1000).prev(".ui-dialog-titlebar").css("background","#266f80").css("color","#fff");
		};
	
		function openConfirmPopup(){
			confirms("테스트\n테스트", "A");
		}
		
		function confirmYes(action){
			toast("정보", "확인을 눌렀습니다.", "info");
		}
		
		function confirmNo(action){
			toast("정보", "취소를 눌렀습니다.", "info");
		}
	</script>
</html>