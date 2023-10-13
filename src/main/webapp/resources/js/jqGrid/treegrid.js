
/* JQ Grid resizing */
function init() {
	jQuery("#treegrid01").jqGrid( 'setGridWidth', (jQuery(".table-wrap").width()),true);
}
    
jQuery(window).on('resize.jqGrid', function () {
    jQuery("#treegrid01").jqGrid( 'setGridWidth', (jQuery(".table-wrap").width()),true);
});
function IndexJsInclude(){
    //:::::::::::::::::::::::::::::::: TreeMenu
    function expandAll() {
        var rows = $("#treegrid01").jqGrid('getGridParam','data');
    if (rows) {
            for (i=0;i<rows.length;i++) {
            $("#treegrid01").jqGrid('expandRow',rows[i]);
            //$("#treegrid").jqGrid('expandNode',rows[i]);
        }
    }
    }

    function collapseAll() {
        var rows = $("#treegrid01").jqGrid('getGridParam','data');
    if (rows) {
            for (i=0;i<rows.length;i++) {
            $("#treegrid01").jqGrid('collapseRow',rows[i]);
            //$("#treegrid").jqGrid('collapseNode',rows[i]);
        }
    }
    }

    /* treegrid01 */
    $(document).ready(function() {
    var treedata = [{
        id: "1",
        name: "IT계획부",
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
        name: "[기록물철] 당직관리",
        category: "준영구",
        level: "2",
        parent: "2",
        isLeaf: true,
        expanded: false,
        loaded: true,
        icon: "ui-icon-flag"
    }, {
        id: "4",
        name: "[기록물철] 사용자계정 관리",
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
    }],
        $grid = $("#treegrid01"),
        getColumnIndexByName = function (columnName) {
            var $this = $(this),
                cm = $this.jqGrid('getGridParam', 'colModel'),
                i, l = cm.length;
            for (i = 0; i < l; i++) {
                if (cm[i].name === columnName) {
                    return i; // return the index
                }
            }
            return -1;
        },
        orgExpandNode = $.fn.jqGrid.expandNode,
        orgCollapseNode = $.fn.jqGrid.collapseNode,
        lastSel;

    $.jgrid.formatter.integer.thousandsSeparator = ',';
    $.jgrid.formatter.number.thousandsSeparator = ',';
    $.jgrid.formatter.currency.thousandsSeparator = ',';
    $grid.jqGrid({
        datatype: "jsonstring",
        datastr: treedata,
        caption: "",
        colNames:['단위과제별 기록물철','보존기간'],
        colModel: [
            { name: 'name', index:1, width: '70%', align:"left"},
            { name: 'category', index:2, width: '30%', align:"center" }
        ],
        height: 420,
        //pager: '#pager01',
        gridview: true,
        autowidth:true,    
        shrinkToFit: false,
        rowNum: 10000,
        sortname: '',
        treeGrid: true,
        treeGridModel: 'adjacency',
        treedatatype: "local",
        ExpandColumn: 'name',
        //cellEdit: true,
        //cellsubmit : 'clientArray',
        editurl: 'clientArray',
        
        onSelectRow: function (rowid) {
            var $this = $(this);
            if (rowid && rowid !== lastSel) {
                $this.jqGrid('restoreRow', lastSel);
                lastSel = rowid;
            }
        },
        ondblClickRow: function (rowid) {
            $(this).jqGrid('editRow', rowid, true);
        },
        jsonReader: {
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
        });
        /* 그리드 하단 옵션 설정 
        jqGrid('navGrid', '#pager01', {
            edit: false,
            add: false,
            del: false,
            search: false,
            refresh: true,
            refreshtext: "새로고침"
        },
        {}, // edit options
        {}, // add options
        {}, // del options
        {multipleSearch:true}
        );*/
        
    $grid.jqGrid('setGridParam', {
        treeGrid: false
    });
    $grid.jqGrid('sortableRows', {
        update: function (e, ui) {
            var $myGrid = $(this).parent(),
                newParent, newLevel, prevId, rowPrevData, $iconDiv, iCol,
                rowid = ui.item[0].id,
                rowData = $myGrid.jqGrid('getLocalRow', rowid),
                $tr = $('#' + $.jgrid.jqID(rowid));
            newRowIndex = $tr[0].rowIndex;
            if (newRowIndex > 1) {
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
                // set parent to null and level to 0
                newParent = "null";
                newLevel = 0;
            }
            rowData.parent = newParent;
            rowData.level = newLevel;
            $iconDiv = $tr.find("div.tree-wrap");
            $iconDiv.width((newLevel + 1) * 12); // 18px per level
            $iconDiv.children("div.treeclick:first").css("left", (newLevel * 12) + 'px');
            //alert("item with id=" + ui.item[0].id + " is droped");

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
        },
        collapseNode: function (rc) {
            var ret = orgCollapseNode.call(this, rc);
            if (!rc.isLeaf && (rc.level === "0" || rc.level === 0)) {
                $("#" + rc._id_ + " div.treeclick")
                    .removeClass("ui-icon-triangle-1-e ui-icon-carat-1-s")
                    .addClass("ui-icon-carat-1-e");
            }
            return ret;
        }
    });

    init();

    })
}
