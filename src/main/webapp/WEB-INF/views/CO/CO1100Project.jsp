<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- .modal-cont 팝업영역 START -->
<div class="modal-cont">
  <div class="title-wrap-popup">
    <div class="title-zone">
      <h2 class="title1">설비마스터</h2>
    </div>
  </div>
  <div class="contents-wrap">
    <div class="row row-1 row-wrap-popup-title">
      <div class="col col-1 wp30">
        <section>
          <div class="title-wrap">
            <div class="title-tab-box">
              <ul>
                <li><a href="#" id="link_subTab1" data-id="subTab1" data-treeid="dataTree1">내 설비</a></li>
                <li><a href="#" id="link_subTab2" data-id="subTab2" data-treeid="dataTree2">계층</a></li>
                <li><a href="#" id="link_subTab3" data-id="subTab3" data-treeid="dataTree3">위치</a></li>
                <li><a href="#" id="link_subTab4" data-id="subTab4" data-treeid="dataTree4">종류</a></li>
              </ul>
            </div>
          </div>
          <div class="check-box-wrap">
            <ul>
              <li><input type="checkbox" id="eqcheck" onchange="eqchecked();"><label for="">하위포함</label></li>
            </ul>
          </div>
          <div class="subtab-wrap">
            <div class="subTabs">
              <div id="subTab1" class="subTab">
                <div id="dataTree1"></div>
              </div>
              <div id="subTab2" class="subTab">
                <div id="dataTree2"></div>
              </div>
              <div id="subTab3" class="subTab">
                <div id="dataTree3"></div>
              </div>
              <div id="subTab4" class="subTab">
                <div id="dataTree4"></div>
              </div>
            </div>
          </div>
        </section>
      </div>
      <div class="col col-2 wp70">
        <section>
          <div class="title-wrap">
            <div class="title-zone">
              <h2 class="title2">설비 내용</h2>
              <!-- <span id="tableCom1_cnt">0</span> -->
            </div>
          </div>
          <div class="table-wrap">
            <table id="tableCom1"></table>
          </div>
        </section>
      </div>
    </div>
  </div>
</div>
<!-- .modal-cont 팝업영역 END -->

<script type="text/javascript">
  var isPopup = '${param.isPopup}';
  var popupCallbackfun = '${param.callbackfun}';

  /**
   * CM1200	프로젝트 조회 팝업
   * -------------------------------------------------------------------
   * 01. 공통코드
   * 02. 그리드
   * 03. CRUD
   * -------------------------------------------------------------------
   */
  //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 공통코드
  /* 공통코드_다국어 */
  var langHead;

  /* Document가 로드되었을 때 실행되는 코드 */
  $(document).ready(function() {
    // 화면ID, 화면ID사이즈(6:CM1000/13:CM1000_Detail), 다국어
    langPop2 = getLangCodeDetail("CO1100_Pop2", 11, "${LANG}");

    setGrid();
  });

  //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 그리드
  /* jqGrid 셋팅 */
  function setGrid(){
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

        $("#pop01_txt01_SALE").val(rowdata.SALES_NUM);
        $("#pop01_txt01_PROJECT").val(rowdata.PROJECT_NM);

        $("#viewForm2").dialog("close");
      }
    });
    });

  searchGridDataProject();
  };

  //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: CRUD
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

  /* 프로젝트 조회 팝업 */
  function openModalPopup_Project(){
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

              $("#pop01_txt01_SALE").val(rowdata.SALES_NUM);
              $("#pop01_txt01_PROJECT").val(rowdata.PROJECT_NM);
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
  };
</script>