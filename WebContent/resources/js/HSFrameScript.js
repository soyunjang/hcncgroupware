/**
 * 공통코드
 * -------------------------------------------------------------------
 * 01. $(document).ready			Document가 로드되었을 때 실행되는 코드
 * 02. noticeShowHide				로고 클릭하거나 탭 이동시 공지사항 팝업 닫기/열기
 * 03. getAjaxJsonData				AJAX 통신으로 Json을 받는 함수
 * 04. ajaxSubmit					저장, 삭제 버튼 클릭시 AJAX 통신하는 함수
 * 05. getLangCode					다국어코드 호출 함수(통합)
 * 06. getLangCodeDetail			다국어코드 호출 함수(세부)
 * 07. getLangCodePopup				다국어코드 호출 함수(팝업)
 * 08. getCommonCode				공통코드 호출 함수
 * 09. commonCodeSelectAdd			공통코드 호출 후 태그에 list값을 매칭
 * 10. getAuthCode					권한분류코드 호출 함수
 * 11. commonAuthSelectAdd			권한분류코드 호출 후 태그에 list값을 매칭
 * 12. reset						검색창 초기화 함수
 * 13. popReset						팝업 초기화 함수
 * 14. initFrame					iframe 추가 함수
 * 15. iframeCloseAction			iframe x버튼 이벤트
 * 16. toast						toast 함수
 * 17. confirms						confirm 팝업 함수
 * 18. toDate						오늘날짜 조회 함수
 * 19. loadingPanel					로딩 패널
 * 20. showLoadingPanel				로딩 패널 Show
 * 21. closeLoadingPanel			로딩 패널 Hide
 * 22. btnMymenuClick				마이메뉴 버튼 이벤트
 * 23. getMyMenu					마이메뉴 조회
 * 24. myMenuAddDel					마이메뉴 추가/삭세
 * 25. serializeObject				폼 데이터를 json으로 리턴
 * 26. comma						천단위 콤마
 * 27. getGridHeight				그리드 높이 계산
 * 28. mergeGridData				그리드 전체 데이터 CRUD 처리
 * 29. gridRequiredHeader			그리드 헤더의 필수 컬럼에 빨간색 *표시
 * 30. isEmpty						빈 값 체크
 * 32. openModalPopup				모달 팝업 호출
 * 33. checkRequiredValidation		필수입력 값 체크 
 * 34. mergeFormData				폼 전체 데이터 전송 처리 
 * 35. getSelectboxData				ajax 통신으로 데이터를 받아 makeSelectboxHtml 에 전달
 * 36. makeSelectboxHtml			데이터를 받아 select Element 생성  
 * 37. searchTreeList				전체부서 Tree 호출 함수
 * 38. goOpenFile					첨부파일 다운로드  
 * 39. getDateTimeDiff				시/분 차이 구하기
 * 40. getDateDiff					일 차이 구하기
 * 41. getDateMonthDiff				월 차이 구하기
 * 42. getDateAdd					주기(p_type)에 따라 넘어온 날짜(date)를 차이(p_diff)만큼 p_format 형태로 변환
 * 43. getDateDays					요일 가져오기
 * 44. getToday						오늘 날짜 가져오기
 * 45. toStringByFormatting			날짜 포맷 출력
 * 46. leftPad						1~9의 숫자를 01~09로 치환하여 출력
 * 47. openPopup					팝업 호출
 * 48. uploadFile					파일 업로드
 * 49. auto_fit_size				팝업 사이즈 자동 조절
 * 50. toStringByFormattingTime		시간 포맷
 * 51. getCookie					getCookie
 * 52. setCookie					setCookie
 * 53. getdirType					각종코드 호출 함수
 * 54. dirTypeSelectAdd				각종코드 호출 후 태그에 list값을 매칭
 * 55. getYears						selectbox에 년도 list값을 매칭
 * 56. getMonths					selectbox에 년도 list값을 매칭
 * 57. getWeek						selectbox에 주차 list값을 매칭
 * 58. getNowPeriod					selectbox에 오늘날짜의 주차 매칭
 * 59. getPeriod					주차 구하기
 * 60. numberPad					월, 일 날짜값 두자리( 00 )로 변경
 * 61. getParameterByName			URL 파라미터 값 가져오기(정규식)
 * 62. enableFormObject				form object의 element enable
 * 63. disableAllFormObject			URL 파라미터 값 가져오기(정규식)
 * 64. disableFormObject			form object의 element disable
 * 65. enableAllFormObject			URL 파라미터 값 가져오기(정규식)
 * -------------------------------------------------------------------
 */

$(document).ready(function(){
	$(".readonly").attr("readonly", true);
	
	//로고 눌렀을때 함수
	$("h1.logo a").click(function(){
		$('ul.openpage li').removeClass('active');
		$('.tab-content').removeClass('active');
		
		$(".openpage li").eq(0).addClass('active');
		$("	#frame" + $(".openpage li").eq(0).attr("data-tab")).addClass('active');
		
		noticeShowHide("main");
	});
	
	//탭 관련 함수
	$('ul.openpage li').click(function(){
		var tab_id = $(this).attr('data-tab');
		
		$('ul.openpage li').removeClass('active');
		$('.tab-content').removeClass('active');
		
		$(this).addClass('active');
		$("#frame" + tab_id).addClass('active');
		
		noticeShowHide(tab_id);
	});
	
	$("#btn01_IFRAME_CLOSE").click(function(){
		var menuId = window.frameElement.parentElement.id.replace("frame", "");
		var parent = $(window.parent.document).find("li[data-tab=" + menuId + "]");
		
		iframeCloseAction(parent, "iframe");
	});
	
	jQuery(window).on('resize.jqGrid', function () {
		jQuery("#table1").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
		jQuery("#table2").jqGrid('setGridWidth', (jQuery(".table-wrap").width()),true);
	});
});

/**
 * 메소드 설명 : 로고 클릭하거나 탭 이동시 공지사항 팝업 닫기/열기
 * -------------------------------------------------------------------
 * @param
 */
function noticeShowHide(type){
	var len = $(".popup").length;
	
	for(var i = 0; i < len; i++){
		if(type == "main"){
			if(document.cookie == ''){
				$('#' + $(".popup")[i].id + '').show();
				$('#' + $(".popup")[i].id + '').draggable();
			} else {
				$('#' + $(".popup")[i].id + '').hide();
			}
		} else {
			$('#' + $(".popup")[i].id + '').hide();
		}
	} 
}

/**
 * 메소드 설명 : AJAX 통신으로 Json을 받는 함수
 * -------------------------------------------------------------------
 * @param	String	url			통신할 RequestMapping값
 * @param	Array 	subParam 	전달할 파라미터
 * @param	String 	fnCallBack	callBack 함수명
 */
function getAjaxJsonData(url, subParam, fnCallBack){
	console.log('getAjaxJsonData', JSON.stringify(subParam));
	try{
		$.ajax({
			url : url
			, data : JSON.stringify(subParam)
			, type : 'POST'
			, dataType : 'json'
			, beforeSend : function(xmlHttpRequest){
				xmlHttpRequest.setRequestHeader("AJAX", "true"); // ajax 호출을  header에 기록
			}
			, contentType : "application/json; charset:UTF-8"
			, error : function(XMLHttpRequest, textStatus, errorThrown) {
				console.log('error', XMLHttpRequest, textStatus, errorThrown);
				if(XMLHttpRequest.status == 999){
					if(getParameterByName('isPopup') == "Y"){
						self.close();
						opener.location.href = "/";
						//alert("세션이 만료되었습니다. 로그인 화면으로 이동합니다.");
					} else {
						location.href = "/";
						//alert("세션이 만료되었습니다. 로그인 화면으로 이동합니다.");
					}
				} else if(XMLHttpRequest.readyState == 4 && XMLHttpRequest.status == 200){
					if(fnCallBack != '' && fnCallBack != null){
						eval(fnCallBack + "(XMLHttpRequest.responseText)");
					}
				}
				else{
					alert(XMLHttpRequest.responseText);
					//alert('Error: ' + XMLHttpRequest.responseText);
				}
			}
			, success : function(data, textStatus, XMLHttpRequest) {
				if(data != null){
					if(data.Errstate != null){
						toast("오류", data.Errmsg, "error");
	            		return;
	            	}
				}
				
				if(fnCallBack != '' && fnCallBack != null){
					eval(fnCallBack + "(data)");
				}
			}
		});
	}
	catch(e){}
};

/**
 * 메소드 설명 : 저장, 삭제 버튼 클릭시 AJAX통신하는 함수
 * -------------------------------------------------------------------
 * @param	String	url				통신할 RequestMapping값
 * @param	Array 	subParamList 	전달할 파라미터
 * @param	String 	fnCallBack		callBack 함수명
 * @param	String 	alertText		알람사용 문구
 */
function ajaxSubmit(url, subParamList, fnCallBack, alertText){
	var dataArray = [];
	
	for(var i = 0; i < subParamList.length; i++){
		dataArray.push(subParamList[i]);
	}
	
	try{
		$.ajax({
			url : url
			, data : JSON.stringify(dataArray)
			, type : 'POST'
			, dataType : 'json'
			, beforeSend : function(xmlHttpRequest){
				xmlHttpRequest.setRequestHeader("AJAX", "true"); // ajax 호출을  header에 기록
			}
			, contentType : "application/json; charset:UTF-8"
			, error : function(XMLHttpRequest, textStatus, errorThrown) {
				if(XMLHttpRequest.status == 999){
					if(getParameterByName('isPopup') == "Y"){
						self.close();
						//alert("세션이 만료되었습니다. 로그인 화면으로 이동합니다.");
						opener.location.href = "/";
					} else {
						//alert("세션이 만료되었습니다. 로그인 화면으로 이동합니다.");
						location.href = "/";
					}
				}
				else{
					alert('Error: ' + XMLHttpRequest.responseText);
				}
			}
			, success : function(data, textStatus, XMLHttpRequest) {
				if(data != null){
					if(data.Errstate != null){
						toast("오류", data.Errmsg, "error");
	            		return;
	            	}
				}
				
				if(fnCallBack != undefined && fnCallBack !=""){
					eval(fnCallBack + "(data)");
				}
				
				if(alertText != undefined && alertText != ""){
            		toast(alertText, alertText + " 되었습니다.", "success");
            	}
			}
		});
	}
	catch(e){}
};

/**
 * 메소드 설명 : 다국어코드 호출 함수(통합)
 * -------------------------------------------------------------------
 * @param	String	SCREEN			화면ID
 * @param	String	TYPE			화면ID사이즈(6:CM1000/13:CM1000_Detail)
 * @param	String	LANG			다국어(한국어, 영어, 중국어)
 * @param	String 	returnType		반환형태(Array/Json)
 */
function getLangCode(SCREEN, TYPE, LANG, returnType){
	var returnValue;			// 반환값(Array/Json)
	var title = [];				// 제목 
	var btn = [];				// 버튼
	var search = [];			// 검색조건
	var grid = [];				// 그리드
	var info = [];				// 그리드 정보
	var idx0 = 0, idx1 = 0, idx2 = 0;		// Index
	
	$.ajax({
		url : '/getLangCode'
		, data : JSON.stringify({SCREEN : SCREEN, TYPE : TYPE, LANG : LANG})
		, type : 'POST'
		, async: false
		, dataType : 'json'
		, headers: {
			'Accept': 'application/json'
			, 'Content-Type': 'application/json'
		}
		, error : function(request, status, error){
			console.error('다국어코드를 불러오지 못했습니다.');
			return false;
		}
		, success : function(List){	// ajax 사용시 success에 구현하기
			if(returnType == 'Array'){
				returnValue = changeArray(List);	// changeArray 구현필요
			}
			else if(returnType == undefined || returnType == 'Json'){
				returnValue = List;
			}
			
			// jquery 실행해보는 사이트 http://www.w3big.com/try/try.php?filename=tryjs_lib_jquery
			for(var i = 0; i < returnValue.length; i++){
				if(returnValue[i].TYPE == "TITLE"){
					if(returnValue[i].UNIQUE_ID.substr(0, 3) != "Pop")
						title.push({UNIQUE_ID: returnValue[i].UNIQUE_ID, KOR_NM: returnValue[i].KOR_NM, LANG: returnValue[i].LANG});
				}
				
				if(returnValue[i].TYPE == "BUTTON"){
					btn.push({UNIQUE_ID: returnValue[i].UNIQUE_ID, KOR_NM: returnValue[i].KOR_NM, LANG: returnValue[i].LANG});
				}
				
				if(returnValue[i].TYPE == "SEARCH"){
					search.push({UNIQUE_ID: returnValue[i].UNIQUE_ID, KOR_NM: returnValue[i].KOR_NM, LANG: returnValue[i].LANG});
				}
				
				if(returnValue[i].TYPE == "GRID"){
					if(returnValue[i].UNIQUE_ID.substring(0, 3) != "Det" && returnValue[i].UNIQUE_ID.substring(0, 3) != "Pop" && returnValue[i].UNIQUE_ID.substring(0, 3) != "Tap"){
						grid.push(returnValue[i].LANG);
					}
				}
				
				if(returnValue[i].TYPE == "INFO"){
					if(returnValue[i].UNIQUE_ID.substring(0, 3) != "Pop")
						info.push({UNIQUE_ID: returnValue[i].UNIQUE_ID, KOR_NM: returnValue[i].KOR_NM, LANG: returnValue[i].LANG});
				}
			}
			
			/*타이틀 다국어 적용*/
			for(var i = 0; i < title.length; i++){
				if(title[i].UNIQUE_ID == SCREEN){
					$(".page-title > h2").text(title[i].LANG);
				}
				
				if(title[i].UNIQUE_ID != SCREEN) {
					if(title[i].UNIQUE_ID.substr(0, 3) == "Tap"){
						if($('.tab-wrap > ul > li').children("a:eq(" + idx0 + ")").text() == title[i].KOR_NM){
							$('.tab-wrap > ul > li').children("a:eq(" + idx0 + ")").text(title[i].LANG);
							idx0++;
						}
					} else {
						// 화면 내부 타이틀 다국어 적용
						$("." + title[i].UNIQUE_ID + "").text(title[i].LANG);
					}
				}
			}
			
			/*버튼 다국어 적용*/
			for(var i = 0; i < btn.length; i++){
				// 엑셀, 닫기		li의 a태그 찾기 https://androman.tistory.com/39
				if($(".page-btn-wrap > ul > li").children("a:eq(" + idx1 + ")").text() == btn[i].KOR_NM){	
					$(".page-btn-wrap > ul > li").children("a:eq(" + idx1 + ")").text(btn[i].LANG);
					idx1++;
				}
				
				// 검색
				if($(".srch-btn > ul > li > a").text().substr(0, 2) == btn[i].KOR_NM)
					$(".srch-btn > ul > li > a").text(btn[i].LANG);
				
				// 추가, 저장
				if($(".btn-right-box > ul > li").children("a:eq(" + idx2 + ")").text() == btn[i].KOR_NM){	
					$(".btn-right-box > ul > li").children("a:eq(" + idx2 + ")").text(btn[i].LANG);
					idx2++;
				}
				
				// 사용자관리,메뉴마스터_중복확인 버튼
				if($("#pop01_btn01_VERIFICATION").text() == btn[i].KOR_NM)
					$("#pop01_btn01_VERIFICATION").text(btn[i].LANG);
				
				// 메뉴마스터_변경 버튼
				if($("#pop01_btn01_CHANGE").text() == btn[i].KOR_NM)
					$("#pop01_btn01_CHANGE").text(btn[i].LANG);
			}
			
			/*검색조건 다국어 적용*/
			for(var i = 0; i < search.length; i++){
				if($(".sch-box > dl").children("dt:eq(" + i + ")").text() == search[i].KOR_NM)
					$(".sch-box > dl").children("dt:eq(" + i + ")").text(search[i].LANG);
			}
			
			/*gridInfo 다국어 적용*/
			for(var i = 0; i < info.length; i++){
				if($(".table-write > tbody > tr").children("th:eq(" + i + ")").text() == info[i].KOR_NM)
					$(".table-write > tbody > tr").children("th:eq(" + i + ")").html(info[i].LANG);
			}
		}
	});
	
	return grid;
};


/**
 * 메소드 설명 : 다국어코드 호출 함수(세부)
 * -------------------------------------------------------------------
 * @param	String	SCREEN			화면ID
 * @param	String	TYPE			화면ID사이즈(6:CM1000/13:CM1000_Detail)
 * @param	String	LANG			다국어(한국어, 영어, 중국어)
 * @param	String 	returnType		반환형태(Array/Json)
 */
function getLangCodeDetail(SCREEN, TYPE, LANG, returnType){
	var returnValue;	// 반환값(Array/Json)
	var grid = [];		// 그리드
	
	$.ajax({
		url : '/getLangCode'
		, data : JSON.stringify({SCREEN : SCREEN, TYPE : TYPE, LANG : LANG})
		, type : 'POST'
		, async: false
		, dataType : 'json'
		, headers: {
			'Accept': 'application/json'
			, 'Content-Type': 'application/json'
		}
		, error : function(request, status, error){
			console.error('다국어코드를 불러오지 못했습니다.');
			return false;
		}
		, success : function(List){	// ajax 사용시 success에 구현하기
			if(returnType == 'Array'){
				returnValue = changeArray(List);	// changeArray 구현필요
			}
			else if(returnType == undefined || returnType == 'Json'){
				returnValue = List;
			}
			
			for(var i = 0; i < returnValue.length; i++){
				if(returnValue[i].TYPE == "GRID"){
					if(returnValue[i].UNIQUE_ID.substr(0, 4) == SCREEN.substr(7, 4))
						grid.push(returnValue[i].LANG);	// object 형태로 넘겨야 함
				}
			}
		}
	});
	
	return grid;
};

/**
 * 메소드 설명 : 다국어코드 호출 함수(팝업_INPUT)
 * -------------------------------------------------------------------
 * @param	String	SCREEN			화면ID
 * @param	String	TYPE			화면ID사이즈(6:CM1000/13:CM1000_Detail)
 * @param	String	LANG			다국어(한국어, 영어, 중국어)
 * @param	String 	returnType		반환형태(Array/Json)
 */
function getLangCodePopup(SCREEN, TYPE, FORM, LANG, returnType){
	var returnValue;		// 반환값(Array/Json)
	var returnPopup = []; 	// 반환값
	var info = [];			// 정보
	var btn = [];			// 버튼
	
	$.ajax({
		url : '/getLangCode'
		, data : JSON.stringify({SCREEN : SCREEN, TYPE : TYPE, LANG : LANG})
		, type : 'POST'
		, async: false
		, dataType : 'json'
		, headers: {
			'Accept': 'application/json'
			, 'Content-Type': 'application/json'
		}
		, error : function(request, status, error){
			console.error('다국어코드를 불러오지 못했습니다.');
			return false;
		}
		, success : function(List){	// ajax 사용시 success에 구현하기
			if(returnType == 'Array'){
				returnValue = changeArray(List);	// changeArray 구현필요
			} else if(returnType == undefined || returnType == 'Json'){
				returnValue = List;
			}

			for(var i = 0; i < returnValue.length; i++){
				if(returnValue[i].TYPE == "TITLE"){
					if(SCREEN.length == 11 && returnValue[i]['UNIQUE_ID'].substr(0, 4) == SCREEN.substr(7, 4)){
						returnPopup.push(returnValue[i].LANG);
					}
				}
			}
			
			for(var i = 0; i < returnValue.length; i++){
				if(returnValue[i].TYPE == "INFO"){
					if(SCREEN.length == 11 && returnValue[i]['UNIQUE_ID'].substr(0, 4) == SCREEN.substr(7, 4)){
						info.push({UNIQUE_ID: returnValue[i].UNIQUE_ID, KOR_NM: returnValue[i].KOR_NM, LANG: returnValue[i].LANG});
					}
				}
			}

			for(var i = 0; i < returnValue.length; i++){
				if(returnValue[i].TYPE == "BUTTON"){
					if(SCREEN.length == 11 && returnValue[i]['UNIQUE_ID'].substr(0, 4) == SCREEN.substr(7, 4)){
						btn.push({UNIQUE_ID: returnValue[i].UNIQUE_ID, KOR_NM: returnValue[i].KOR_NM, LANG: returnValue[i].LANG});
					}
				}
			}
			
			var idx1 = 0;
			for(var i = 0; i < info.length; i++){
				if($("#" + FORM + " .table-write2 > tbody > tr").children("th:eq(" + idx1 + ")").text() != ''){
					if($("#" + FORM + " .table-write2 > tbody > tr").children("th:eq(" + idx1 + ")").text() == info[i].KOR_NM){	
						$("#" + FORM + " .table-write2 > tbody > tr").children("th:eq(" + idx1 + ")").html(info[i].LANG);
						idx1++;
					}
				}
				
				if($("#" + FORM + " .table-write2 > tbody > tr > td > label").text() == info[i].KOR_NM){
					$("#" + FORM + " .table-write2 > tbody > tr > td > label").text(info[i].LANG);
				}
			}

			for(var i = 0; i < btn.length; i++){
				returnPopup.push(btn[i].LANG);
			}
		}
	});
	
	return returnPopup;
};

/**
 * 메소드 설명 : 다국어코드 호출 함수(팝업_GRID)
 * -------------------------------------------------------------------
 * @param	String	SCREEN			화면ID
 * @param	String	TYPE			화면ID사이즈(6:CM1000/13:CM1000_Detail)
 * @param	String	LANG			다국어(한국어, 영어, 중국어)
 * @param	String 	returnType		반환형태(Array/Json)
 */
function getLangCodePopupGrid(SCREEN, TYPE, FORM, LANG, returnType){
	var returnValue;		// 반환값(Array/Json)
	var returnPopup = []; 	// 반환값
	var grid = [];			// 그리드
	var btn = [];			// 버튼
	
	$.ajax({
		url : '/getLangCode'
		, data : JSON.stringify({SCREEN : SCREEN, TYPE : TYPE, LANG : LANG})
		, type : 'POST'
		, async: false
		, dataType : 'json'
		, headers: {
			'Accept': 'application/json'
			, 'Content-Type': 'application/json'
		}
		, error : function(request, status, error){
			console.error('다국어코드를 불러오지 못했습니다.');
			return false;
		}
		, success : function(List){	// ajax 사용시 success에 구현하기
			if(returnType == 'Array'){
				returnValue = changeArray(List);	// changeArray 구현필요
			} else if(returnType == undefined || returnType == 'Json'){
				returnValue = List;
			}

			for(var i = 0; i < returnValue.length; i++){
				if(returnValue[i].TYPE == "TITLE"){
					if(SCREEN.length == 11 && returnValue[i]['UNIQUE_ID'].substr(0, 4) == SCREEN.substr(7, 4)){
						returnPopup.push(returnValue[i].LANG);
					}
				}
			}
			
			for(var i = 0; i < returnValue.length; i++){
				if(returnValue[i].TYPE == "GRID"){
					if(SCREEN.length == 11 && returnValue[i]['UNIQUE_ID'].substr(0, 4) == SCREEN.substr(7, 4)){
						grid.push({UNIQUE_ID: returnValue[i].UNIQUE_ID, KOR_NM: returnValue[i].KOR_NM, LANG: returnValue[i].LANG});
					}
				}
			}

			for(var i = 0; i < returnValue.length; i++){
				if(returnValue[i].TYPE == "BUTTON"){
					if(SCREEN.length == 11 && returnValue[i]['UNIQUE_ID'].substr(0, 4) == SCREEN.substr(7, 4)){
						btn.push({UNIQUE_ID: returnValue[i].UNIQUE_ID, KOR_NM: returnValue[i].KOR_NM, LANG: returnValue[i].LANG});
					}
				}
			}
			
			var idx1 = 0;
			for(var i = 0; i < grid.length; i++){
				if($("#" + FORM + " .table-write2 > tbody > tr").children("th:eq(" + idx1 + ")").text() != ''){
					if($("#" + FORM + " .table-write2 > tbody > tr").children("th:eq(" + idx1 + ")").text() == grid[i].KOR_NM){	
						$("#" + FORM + " .table-write2 > tbody > tr").children("th:eq(" + idx1 + ")").html(grid[i].LANG);
						idx1++;
					}
				}
			}

			for(var i = 0; i < btn.length; i++){
				returnPopup.push(btn[i].LANG);
			}
		}
	});
	
	return returnPopup;
};

/**
 * 메소드 설명 : 공통코드 호출 함수
 * -------------------------------------------------------------------
 * @param	String	SYS_CLASS_CD	코드그룹
 * @param	String 	returnType		반환형태(Array/Json)
 */
function getCommonCode(SYS_CLASS_CD, returnType){
	var returnValue;	// 반환값(Array/Json)
	
	$.ajax({
		url : '/getCommonCode'
		, data : JSON.stringify({sysClassCd : SYS_CLASS_CD})
		, type : 'POST'
		, async: false
		, dataType : 'json'
		, headers: {
			'Accept': 'application/json'
			, 'Content-Type': 'application/json'
		}
		, error : function(request, status, error){
			console.error('공통코드를 불러오지 못했습니다.');
			return false;
		}
		, success : function(List){
			if(returnType == 'Array'){
				returnValue = changeArray(List);
			}
			else if(returnType == undefined || returnType == 'Json'){
				returnValue = List;
			}
		}
	});
	
	return returnValue;
};

/**
 * 메소드 설명 : 공통코드 호출 함수(SORT)
 * -------------------------------------------------------------------
 * @param	String	SYS_CLASS_CD	코드그룹
 * @param	String 	returnType		반환형태(Array/Json)
 */
function getCommonCodeEsc(SYS_CLASS_CD, returnType){
	var returnValue;	// 반환값(Array/Json)
	
	$.ajax({
		url : '/getCommonCodeEsc'
		, data : JSON.stringify({sysClassCd : SYS_CLASS_CD})
		, type : 'POST'
		, async: false
		, dataType : 'json'
		, headers: {
			'Accept': 'application/json'
			, 'Content-Type': 'application/json'
		}
		, error : function(request, status, error){
			console.error('공통코드를 불러오지 못했습니다.');
			return false;
		}
		, success : function(List){
			if(returnType == 'Array'){
				returnValue = changeArray(List);
			}
			else if(returnType == undefined || returnType == 'Json'){
				returnValue = List;
			}
		}
	});
	
	return returnValue;
};

/**
 * 메소드 설명 : 공통코드 호출 후 태그에 list값을 매칭
 * -------------------------------------------------------------------
 * @param	String	element		매칭할 select 태그ID
 * @param	Json 	list		데이터값
 * @param	String 	allYn		'전체' 항목여부(Y:전체 표시/N:전체 미표시)
 */
function commonCodeSelectAdd(element, list, allYn){
	$("#" + element).empty();
	
	for(var i = 0; i < list.length; i++){
		var option = "<option value=" + list[i].SYS_ITEM_CD + ">" + list[i].SYS_ITEM_NAME + "</option>";
		if(i == 0){
			if(allYn == undefined || allYn == 'Y'){
				$("#" + element).append("<option value=''>전체</option>");
			}
		}
		$("#" + element).append(option);
	}
}

/**
 * 메소드 설명 : 권한분류코드 호출 함수
 * -------------------------------------------------------------------
 * @param	String 	returnType		반환형태(Array/Json)
 */
function getAuthCode(returnType){
	var returnValue;	// 반환값(Array/Json)
	
	$.ajax({
		url : '/getAuthCode'
		, type : 'POST'
		, async: false
		, dataType : 'json'
		, headers: {
			'Accept': 'application/json'
			, 'Content-Type': 'application/json'
		}
		, error : function(request, status, error){
			console.error('공통코드를 불러오지 못했습니다.');
			return false;
		}
		, success : function(List){
			if(returnType == 'Array'){
				returnValue = changeArray(List);
			}
			else if(returnType == undefined || returnType == 'Json'){
				returnValue = List;
			}
		}
	});
	
	return returnValue;
};

/**
 * 메소드 설명 : 권한분류코드 호출 후 태그에 list값을 매칭
 * -------------------------------------------------------------------
 * @param	String	element		매칭할 select 태그ID
 * @param	Json 	list		데이터값
 * @param	String 	allYn		'전체' 항목여부(Y:전체 표시/N:전체 미표시)
 */
function commonAuthSelectAdd(element, list, allYn){
	$("#" + element).empty();
	
	for(var i = 0; i < list.length; i++){
		var option = "<option value=" + list[i].AUTH_TYPE_CD + ">" + list[i].AUTH_TYPE_NAME + "</option>";
		if(i == 0){
			if(allYn == undefined || allYn == 'Y'){
				$("#" + element).append("<option value=''>전체</option>");
			}
		}
		$("#" + element).append(option);
	}
}

/**
 * 메소드 설명 : 검색창 초기화 함수
 * -------------------------------------------------------------------
 * @param	String	method
 */
function reset(method){
	var select;		// 선택박스
	var input;		// 텍스트박스
	var checkbox;	// 체크박스
	var radio;		// 라디오버튼
	
	select = $(".search-wrap").find("select");
	input = $(".search-wrap").find("input");
	checkbox = $(".search-wrap").find("input[type=checkbox]");
	radio = $(".search-wrap").find("input[type=radio]");
	
	input.val("");
	select.find("option:eq(0)").prop("selected", "selected");
	checkbox.prop('checked', false);
	
	for(var i = 0; i < radio.length; i++){
		$('input[name="' + radio[i].name + '"]').removeAttr('checked');
		$('input[name="' + radio[i].name + '"]')[0].checked = true;
	}
	
	if(method != undefined && method != ""){
//		eval(method);
		new Function(method)();
	}
};

/**
 * 메소드 설명 : 팝업 초기화 함수
 * -------------------------------------------------------------------
 * @param	String	viewForm	팝업DIV ID
 */
function popReset(viewForm){
	var viewId = "#" + viewForm;	// 팝업DIV ID
	var select;						// 선택박스
	var input;						// 텍스트박스
	var checkbox;					// 체크박스
	var radio;						// 라디오버튼
	
	select = $(viewId + " .modal-cont").find("select");
	input = $(viewId + " .modal-cont").find("input");
	checkbox = $(viewId + " .modal-cont").find("input[type=checkbox]");
	radio = $(viewId + " .modal-cont").find("input[type=radio]");
	
	input.val("");
	select.find("option:eq(0)").prop("selected", "selected");
	checkbox.prop('checked', false);
	
	for(var i = 0; i < radio.length; i++){
		$('input[name="' + radio[i].name + '"]').removeAttr('checked');
		$('input[name="' + radio[i].name + '"]')[0].checked = true;
	}
};

/**
 * 메소드 설명 : iframe 추가 함수
 * -------------------------------------------------------------------
 * @param	String	$this	탭
 */
function initFrame($this){
	loadingPanel();
	
	var tab = $(".openpage li[data-tab=" + $this.id + "]");
	
	var div = document.createElement("div");
	div.setAttribute("id", "frame" + $this.id);
	
	if($this.className.substring(0, 8) == "menuItem") {
		$('.tab-content').removeClass($this.className);
		div.setAttribute("class", "tab-content active " + $this.className);
	} else { 
		div.setAttribute("class", "tab-content active");
	}
	
	if(tab.length > 0){
		if($this.className != null) {
			var parent = $(window.parent.document).find("li[data-tab=" + $this.id + "]");
			
			iframeCloseAction(parent, "iframe");
		} else {
			$('ul.openpage li').removeClass('active');
			$('.tab-content').removeClass('active');
			
			tab.addClass('active');
			$("#frame" + $this.id).addClass('active');
			return;
		}
	}
	
	if($(".openpage li").length == 11){
		toast("최대개수 초과", "탭 최대개수는 10개 입니다.", "error");
		return;
	}
	
	$('ul.openpage li').removeClass('active');
	$('.tab-content').removeClass('active');
	
	var ifr = document.createElement("iframe");
	if($this.className != null) 
		ifr.setAttribute("src", "/" + $this.id + "?" + $this.text);
	else 
		ifr.setAttribute("src", "/" + $this.id);
	ifr.setAttribute("style", 'width:100%; height: 100%');
	
//	ifr.onload = function () {
		//this.height = parseInt(this.contentDocument.documentElement.scrollHeight) + "px";
//	}
	
	// 페이지
	div.append(ifr);
	$(".tab-contents").append(div);
	
	// 탭
	var addNav = '<li class="active" data-tab="'+ $this.id + '"><a href="javascript:void(0);">' + $this.title + '</a><a class="btn-close"><i class="fas fa-times"></a>';
	$(".openpage").append(addNav);
	
	noticeShowHide("notMain");
	
	//생성된 시점의 탭 클릭 이벤트
	$(".openpage li").last().click(function(){
		$('ul.openpage li').removeClass('active');
		$('.tab-content').removeClass('active');
		
		$(this).addClass('active');
		$("#frame" + $(this).attr('data-tab')).addClass('active');
		
		noticeShowHide("notMain");	// 공지사항 팝업 닫기/열기
	});
		
	
	//탭 x버튼 이벤트
	$(".openpage li").last().find("a").last().click(function(){
		var parent = $(this).parent("li");
		var parentIdx = parent.index();
		iframeCloseAction(parent);
	});
}

/**
 * 메소드 설명 : iframe x버튼 이벤트
 * -------------------------------------------------------------------
 * @param	String	parent		parent
 * @param	String	location	iframe
 */
function iframeCloseAction(parent, location){
	var parentIdx = parent.index();
	
	var $this = $(document);
	if(location == "iframe"){
		$this = $(window.parent.document);
	}
	
	$this.find("#frame" + parent.attr('data-tab')).remove();
	$this.find(".openpage li[data-tab=" + parent.attr('data-tab') + "]").remove();
	
	//활성화 되어 있는 탭을 삭제 하였을때
	if(parent.attr("class").indexOf("active") > -1){
		$this.find('ul.openpage li').removeClass('active');
		$this.find('.tab-content').removeClass('active');
		
		if(parentIdx > 1){//삭제할 탭이 2번째 탭 이상일 경우
			$this.find(".openpage li").eq(parentIdx - 1).addClass('active');
			$this.find("#frame" + $this.find(".openpage li").eq(parentIdx - 1).attr("data-tab")).addClass('active');
		}
		else{ //삭제할 탭이 첫번째 탭일 경우
			if($this.find(".openpage li").length == 1){ //main만 남았을때
				$this.find(".openpage li").eq(0).addClass('active');
				$this.find("#frame" + $this.find(".openpage li").eq(0).attr("data-tab")).addClass('active');
			}
			else{ //main이외에 탭이 존재할때
				$this.find(".openpage li").eq(parentIdx).addClass('active');
				$this.find("#frame" + $this.find(".openpage li").eq(parentIdx).attr("data-tab")).addClass('active');
			}
		}
	}
}

/**
 * 메소드 설명 : toast 함수
 * -------------------------------------------------------------------
 * @param	String	title		제목
 * @param	String	message		메시지
 * @param	String	type		타입(info/error/success)
 */
function toast(title, message, type){
	$.iGrowl({
	    title: title
	    , message: message
	    , type: type == undefined || type == "" ? "success" : type
	    , animShow: "fadeIn"
	    , animHide: "fadeOut"
	    , animation: true
	    , icon: type == undefined || type == "" ? "success" : type
	    , placement: {
	    	x: "center"
	    	, y: "middle"
	    }
		, delay: 1000
	});
}

/**
 * 메소드 설명 : confirm 팝업 함수
 * -------------------------------------------------------------------
 * @param	String	message		메시지(저장하시겠습니까?)
 * @param	String	action		행위(C:생성/U:추가)
 */
function confirms(message, action){
	$('.popup-cont').find("p").remove();
	
	var p = $(document.createElement("p"));
	p.html(message.replace("\n", "<br>"));
	
	$('.popup-cont').append(p);
	$('#confirmPopUp').addClass("active");
	
	$('#confirmPopupYes').unbind('click');
	$("#confirmPopupYes").click(function(){
		$('#confirmPopUp').removeClass("active");
		
		if (typeof confirmYes != 'undefined' && $.isFunction(confirmYes)) {
			confirmYes(action);
		}
	});
	
	$('#confirmPopupNo').unbind('click');
	$("#confirmPopupNo").click(function(){
		$('#confirmPopUp').removeClass("active");
		
		if (typeof confirmNo != 'undefined' && $.isFunction(confirmNo)) {
			confirmNo(action);
		}
	});
}

function confirms2(message, action){
	$('.popup-cont').find("p").remove();
	
	var p = $(document.createElement("p"));
	p.html(message.replace("\n", "<br>"));
	
	$('.popup-cont').append(p);
	$('#confirmPopUp').addClass("active");
	
	$('#confirmPopupYes').unbind('click');
	$("#confirmPopupYes").click(function(){
		$('#confirmPopUp').removeClass("active");
		
		if (typeof confirmYes2 != 'undefined' && $.isFunction(confirmYes2)) {
			confirmYes2(action);
		}
	});
	
	$('#confirmPopupNo').unbind('click');
	$("#confirmPopupNo").click(function(){
		$('#confirmPopUp').removeClass("active");
		
		if (typeof confirmNo2 != 'undefined' && $.isFunction(confirmNo2)) {
			confirmNo2(action);
		}
	});
}

/**
 * 메소드 설명 : 오늘날짜 조회 함수
 * -------------------------------------------------------------------
 * @param	
 */
function toDate(){
	var date = new Date();
	var today = "";
	
	if(date.getDate() < 10){
		today = date.getFullYear() + "" + ("0" + (date.getMonth() + 1)).slice(-2) + "" + "0" + date.getDate();
	}
	else{
		today = date.getFullYear() + "" + ("0" + (date.getMonth() + 1)).slice(-2) + "" + date.getDate();
	}
	
	return today;
}

/**
 * 메소드 설명 : 로딩 패널  
 * -------------------------------------------------------------------
 * @param	
 */
function loadingPanel() {
	showLoadingPanel();
    setTimeout("closeLoadingPanel()", 1000);
}

function showLoding() {
	var width  = document.body.clientWidth;		// 화면의 넓이
    var height = document.body.clientHeight;	// 화면의 높이
    var loadingSearch = "";
	
    loadingSearch = "<div id='loadingSearch'>";
    loadingSearch += "<img id='searchImg' src='/resources/img/sub/icon-loadingSearch.gif' style='position: absolute; display: auto; left: 47.5%; top: 35%;'/>";
    loadingSearch += "<p style='text-align: center; padding-top: 23%; font-size: 22px;'>처리중입니다. <br>잠시만 기다려주세요.</p></div>";
    
    $('body').prepend(loadingSearch);	// 레이어 추가

	$('#loadingSearch').css({
    		'position' : 'absolute'
    		, 'z-index' : '9000'
    		, 'background-color' : 'white'
    		, 'display' : 'block'
    		, 'width' : width
    		, 'height': height
    		, 'opacity' : '1'
    });
    
    $('#loadingSearch').show();	// loadingPanel show
}

/**
 * 메소드 설명 : 로딩 패널 숨기기, 지우기
 * -------------------------------------------------------------------
 * @param	
 */
function closeLoading() {
    $('#loadingSearch').hide();
    $("#loadingSearch").remove();
}

/**
 * 메소드 설명 : 로딩 패널 보여주기
 * -------------------------------------------------------------------
 * @param	png	로딩 패널 이미지
 */
function showLoadingPanel() {
	var width  = document.querySelector('.sub-container-wrap').clientWidth;		// 화면의 넓이
    var height = document.querySelector('.sub-container-wrap').clientHeight;	// 화면의 높이
    var top = document.querySelector('.sub-container-wrap').offsetTop;
    var left = document.querySelector('.sub-container-wrap').offsetLeft;
    var loadingPanel = "";
    var tabCnt = $('.openpage li').length; 
    
    if(tabCnt < 11){
	    // 화면 출력 html
	    loadingPanel = "<div id='loadingPanel'>";
	    loadingPanel += "<img id='loadingImg' src='/resources/img/sub/icon-loadingPanel.gif'style='position: absolute; display: block; left: 45%; top: 35%;'/>";
	    loadingPanel += "</div>";
	    
	    $('body').append(loadingPanel);	// 레이어 추가
	 
	    // loadingPanel css
	    // opacity : 불투명도
	    $('#loadingPanel').css({
	    		'position' : 'absolute'
	    		, 'z-index' : '9000'
	    		, 'background-color' : 'white'
	    		, 'display' : 'block'
	    		, 'margin-left' : left + 'px'
	    		, 'width' : width
	    		, 'height': height
	    		, 'opacity' : '1'
	    }); 
	  
	    $('#loadingPanel').show();	// loadingPanel show
    }
}

/**
 * 메소드 설명 : 로딩 패널 숨기기, 지우기
 * -------------------------------------------------------------------
 * @param	
 */
function closeLoadingPanel() {
    $('#loadingPanel').hide();
    $("#loadingPanel").remove();
}

//폼 데이터를 json으로 리턴
function serializeObject(elem) {
	console.log('serializeObject', elem, elem[0].tagName);
	var obj = null;
	try {
		if (elem[0].tagName && elem[0].tagName.toUpperCase() == "FORM") {
			var arr = elem.serializeArray();
			console.log('arr', arr);
			if (arr) {
				obj = {};
				jQuery.each(arr, function() {
					if(!isEmpty(obj[this.name])){
						obj[this.name] += ',' + this.value;
					} else {
						obj[this.name] = this.value;
					}
				});
			}//if ( arr ) {
		}
	} catch (e) {
		alert(e.message);
	} finally {
	}

	return obj;
};

//천단위 콤마
function comma(str) {
	if (str == '' || str == null) return '';
	return str.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
}

function uncomma(str) {
     str = String(str);
     return str.replace(/[^\d]+/g, '');
 }

//그리드 높이 계산
function getGridHeight() {
	var windowHeight = $(window).height();
	console.log('windowHeight', windowHeight);

	var pageTitleWrap = $('.page-title-wrap').outerHeight(true);
	var tabWrap = $('.tab-wrap').outerHeight(true);
	var searchZone = $('.search-zone').outerHeight(true);
	var row1Wrap = $('div.row.row-1').outerHeight(true);
	var row2Wrap = 0;
	if($('div.row.row-1').next('div').hasClass('.row.row-2')){
		row2Wrap = $('div.row.row-2').outerHeight(true);
	} 
	var pageBtnWrap = $('.page-btn-wrap').outerHeight(true);
	console.log('height', pageTitleWrap, tabWrap, searchZone, row1Wrap, row2Wrap, pageBtnWrap);

	var gridHeight = windowHeight - (pageTitleWrap + tabWrap + searchZone + row1Wrap + 30 + 56 + row2Wrap + pageBtnWrap);
	console.log('gridHeight', gridHeight);

	return gridHeight;
}

//그리드 전체 데이터 CRUD 처리
function mergeGridData(gridArray, url, callback) {
	var param = {};
	var dataObj = new Object();
	$.each(gridArray, function(index, data) {
		var gridObj = $("#" + gridArray[index]);
		var dataIds = gridObj.jqGrid("getDataIDs");
		console.log(gridObj, dataIds);
		
		var dataListC = new Array();
		var dataListU = new Array();
		var dataListD = new Array();
		var jsonArray = new Array();
		$.each(dataIds, function(gIndex, gData) {
			gridObj.jqGrid('saveRow', dataIds[gIndex]);
			var rowData = gridObj.jqGrid("getRowData", dataIds[gIndex]);
			if ($("tr#" + dataIds[gIndex], gridObj).hasClass('insert')) {
				rowData.action = 'C';
				jsonArray.push(rowData);
			} else if ($("tr#" + dataIds[gIndex], gridObj).hasClass('update')) {
				rowData.action = 'U';
				jsonArray.push(rowData);
			} else if ($("tr#" + dataIds[gIndex], gridObj).hasClass('delete')) {
				rowData.action = 'D';
				jsonArray.push(rowData);
			}
		});
		console.log('jsonArray', jsonArray);
		
		dataObj[data] = jsonArray;
	});
	console.log('dataObj', dataObj, JSON.stringify(dataObj));
	getAjaxJsonData(url, dataObj, callback);
}

//그리드 헤더의 필수 컬럼에 빨간색 *표시
function gridRequiredHeader(gridObj) {
	var cm = gridObj.getGridParam("colModel");
	var required_ids = gridObj.getGridParam("rq_ids");// 헤더에 빨간색 *표시

	$(cm).each(function(i) {
		if ($.inArray(this.name, required_ids) > -1) {
			var html = $("#jqgh_" + gridObj[0].id + "_" + this.name).html();

			// ie8에서 대소문자로 인한 문제 해결
			if (html.toLowerCase().indexOf("<span style=\"color:") == -1) {
				/* 그리드 헤더 텍스트 앞에 * 표시 */
				$("#jqgh_" + gridObj[0].id + "_" + this.name).html("<span style='color:#f00;'>*</span> " + html);
			}
		}
	});
}

//빈 값 체크
function isEmpty(val) {
    return val == null || $.trim(val).length == 0;
}

function openModalPopup(elem){
	var url = $(elem).data('url');
	
	var modalElem = '<iframe src="'+url+'" width="100%" height="100%"></iframe>';
		
	var chk = $('.modal-cont').append(modalElem);
	console.log('chk', chk);
	if(chk){
		$('#modalPopup').modal({
			escapeClose: false,
			clickClose: false,
			showClose: false
		}).show();
	}
}

//필수입력 값 체크
function checkRequiredValidation(formArray) {
	console.log('checkRequiredValidation', formArray);
	
	var flag = true;
	var defaultClassName = 'form-control';
	var option = {
		targetClass : defaultClassName,
		type : 'text'
	};

	$.each(formArray, function(index, data){
		var fElem = $('#' + data);
		// 체크 할 타켓을 지정하지 않은 경우 formid에 있는 모든 요소를 체크할 class로 선언
		fElem.find('input').addClass(defaultClassName);
		fElem.find('select').addClass(defaultClassName);
		fElem.find('textarea').addClass(defaultClassName);
			
		fElem.find('.' + option.targetClass).each(function() {
			var elem = $(this);
			var elemName = elem.attr('name');
			
			if (elem.is(':required') && elem.is(':enabled') && isEmpty(elem.val())) {
				var title = $('label[for="'+elemName+'"]').text();
				if (option.type == 'text') {
					alert('[' + title + ']' + '을(를) 입력해 주세요.');
				} else {
					alert('[' + title + ']' + '을(를) 선택해 주세요.');
				}
	
				flag = false;
				elem.focus();
				return false;
			}
		});
	});

	return flag;
}

//폼 전체 데이터 전송 처리
function mergeFormData(formArray, url, callback) {
	var param = {};
	var dataObj = new Object();
	dataObj.objName = formArray
	$.each(formArray, function(index, data) {
		var frmElem = $('#' + data);
		eval('dataObj.' + data + ' = serializeObject(frmElem)');
	});
	console.log('dataObj', dataObj, JSON.stringify(dataObj));
	getAjaxJsonData(url, dataObj, callback);
}

function getSelectboxData(p_id, p_option, callback) {
	var elem = $('#' + p_id);

	p_option = p_option || {};

	var option = {
		// ajax
		url : p_option.url || {}, // ajax url
		async : isEmpty(p_option.async) ? false : p_option.async,
		data : p_option.data || {},
		type : p_option.type || 'post',
		dataType : p_option.dataType || 'json',

		// selectbox
		defaultText : p_option.defaultText || '', // 셀렉트 박스 기본 text
		defaultValue : p_option.defaultValue || '', // 셀렉트 박스 기본 value
		selectedValue : p_option.selectedValue, // selected value
		dataObjArr : p_option.dataObjArr || [], // option에 추가로 더해질 data값
		valueName : p_option.valueName || 'CODE', // 데이터 value object명
		textName : p_option.textName || 'VALUE' // 데디터 text object명
	};

	// option 초기화
	elem.children('option').remove();
	
	// 기본 값 세팅
	if (!isEmpty(option.defaultText)) {
		$('<option>', {
			value : option.defaultValue,
			text : option.defaultText,
		}).appendTo(elem);
	}

	if (option.dataType != 'local') {
		$.ajax({
			type : option.type,
			url : option.url,
			data : option.data,
			dataType : option.dataType,
			async : option.async,
		}).done(function(data) {
			if (data != null) {
				makeSelectboxHtml(elem, option, data, callback);
			}

		}).fail(function(jqXHR, textStatus) {
			console.log('getSelectboxData FAIL ::: ', jqXHR, textStatus);

		}).always(function() {
		});
	} else {
		makeSelectboxHtml(elem, option, option.data, callback);
	}
}

function makeSelectboxHtml(elem, option, data, callback) {
	if (option.dataObjArr.length > 0) {
		$.each(data, function(i, info) {
			let optionElem = $('<option>');
			optionElem.val(info[option.valueName]);
			optionElem.text(info[option.textName]);
			optionElem.data('type', info[option.typeValue]);
			$.each(option.dataObjArr, function(j, data) {
				optionElem.data(data.toLowerCase(), info[data])
			});

			optionElem.attr('selected', option.isSelectedAll);

			if (!isEmpty(option.selectedValue) && option.selectedValue == info[option.valueName]) {
				optionElem.attr('selected', true);
			}

			optionElem.appendTo(elem);
		});
	} else {
		$.each(data, function(i, info) {
			let optionElem = $('<option>');
			optionElem.val(info[option.valueName]);
			optionElem.text(info[option.textName]);
			optionElem.attr('data-type', info[option.typeValue]);
			optionElem.attr('selected', option.isSelectedAll);

			if (!isEmpty(option.selectedValue) && option.selectedValue == info[option.valueName]) {
				optionElem.attr('selected', true);
			}

			optionElem.appendTo(elem);
		});
	}

	if (callback != null) {
		callback(elem);
	}
}

function searchTreeList(url, subParam, fnCallBack){
	$.ajax({
		url : url
		, data : JSON.stringify(subParam)
		, type : 'POST'
		, dataType : 'json'
		, beforeSend : function(xmlHttpRequest){
			xmlHttpRequest.setRequestHeader("AJAX", "true"); // ajax 호출을  header에 기록
		}
		, contentType : "application/json; charset:UTF-8"
		, error : function(XMLHttpRequest, textStatus, errorThrown) {
			if(XMLHttpRequest.status == 999){
				if(getParameterByName('isPopup') == "Y"){
					self.close();
					//alert("세션이 만료되었습니다. 로그인 화면으로 이동합니다.");
					opener.location.href = "/";
				} else {
					//alert("세션이 만료되었습니다. 로그인 화면으로 이동합니다.");
					location.href = "/";
				}
			}
			else{
				alert('Error: ' + XMLHttpRequest.responseText);
			}
		}
		, success : function(data, textStatus, XMLHttpRequest) {
			console.log('searchTreeList > success', data, textStatus, XMLHttpRequest);
			if(data != null){
				if(data.Errstate != null){
					toast("오류", data.Errmsg, "error");
            		return;
            	}
			}
			if(fnCallBack != '' && fnCallBack != null){
				eval(fnCallBack + "(data)");
			}
		}
	});

}

/**
 * 파일을 열때 호출된다.
 */
function goOpenFile(physicalFileName) {
	console.log('goOpenFile', physicalFileName);
	if (physicalFileName == null || physicalFileName == "") { return; }

	var param = "?" + "isDownloadPage=true" + "&" + "physicalFileName=" + physicalFileName;

	bottomForm.action = "/downloadFile.do" + param;
	bottomForm.submit();
}

/**
 * 시/분 차이 구하기. 숫자만 있
 * @param date1 string
 * @param date2 string
 * @returns
 */
function getDateTimeDiff(date1, date2) {
    let getDate1, getDate2;
    
    date1 = date1.replace(DATE_GUBUN_REGEX, '');
    date2 = date2.replace(DATE_GUBUN_REGEX, '');
    
    if(date1.length == 10) {
        getDate1 = new Date(parseInt(date1.substring(0,4)), parseInt(date1.substring(4,6)) - 1, parseInt(date1.substring(6,8)), parseInt(date1.substring(8,10)));
        getDate2 = new Date(parseInt(date2.substring(0,4)), parseInt(date2.substring(4,6)) - 1, parseInt(date2.substring(6,8)), parseInt(date2.substring(8,10)));
        
    } else if(date1.length == 12) {
        getDate1 = new Date(parseInt(date1.substring(0,4)), parseInt(date1.substring(4,6)) - 1, parseInt(date1.substring(6,8)), parseInt(date1.substring(8,10)), parseInt(date1.substring(10,12)));
        getDate2 = new Date(parseInt(date2.substring(0,4)), parseInt(date2.substring(4,6)) - 1, parseInt(date2.substring(6,8)), parseInt(date2.substring(8,10)), parseInt(date2.substring(10,12)));
        
    } else {
        alert('유효하지 않은 날짜 형식입니다.\n');
        return;
    }
    
    return getDate2.getTime() - getDate1.getTime();
}


/**
 * 일 차이 구하기
 * @param date1
 * @param date2
 * @returns
 */
function getDateDiff(date1, date2) {
    date1 = date1.replace(DATE_GUBUN_REGEX, '');
    date2 = date2.replace(DATE_GUBUN_REGEX, '');
    
    if(date1.length >= 8 || date2.length >= 8) {
        let getDate1 = new Date(parseInt(date1.substring(0,4)), parseInt(date1.substring(4,6)) - 1, parseInt(date1.substring(6,8)));
        let getDate2 = new Date(parseInt(date2.substring(0,4)), parseInt(date2.substring(4,6)) - 1, parseInt(date2.substring(6,8)));
        let getDiffTime = getDate2.getTime() - getDate1.getTime();
        
        return Math.floor(getDiffTime / (1000 * 60 * 60 * 24));
        
    } else {
        return null;
    }
}


/**
 * 월 차이 구하기
 * @param d1
 * @param d2
 * @returns
 */
function getDateMonthDiff(date1, date2) {
    date1 = date1.replace(DATE_GUBUN_REGEX, '');
    date2 = date2.replace(DATE_GUBUN_REGEX, '');
    
    if(date1.length >= 6 || date2.length >= 6) {
        let months;
        let getDate1 = new Date(parseInt(date1.substring(0,4)), parseInt(date1.substring(4,6)) - 1);
        let getDate2 = new Date(parseInt(date2.substring(0,4)), parseInt(date2.substring(4,6)) - 1);
        
        months = (getDate2.getFullYear() - getDate1.getFullYear()) * 12;
        months -= getDate1.getMonth();
        months += getDate2.getMonth();
        
        return months <= 0 ? 0 : months;
        
    } else {
        return null;
    }
}


/**
 * 주기(p_type)에 따라 넘어온 날짜(date)를 차이(p_diff)만큼 p_format 형태로 변환
 * @param type date형식 (years, months, days, hours, 15m)
 * @param date 날짜
 * @param diff 차이값
 */
function getDateAdd(p_type, p_date, p_diff, p_format) {
	let date, diff, format;
	
	//console.log(p_type, p_date, p_diff, p_format);
	
	if(p_date instanceof Date) {
		date = p_date;
	} else {
		let strDate = this.replaceStr(p_date, '[-| ]', ''); // '-'과 공백을 없에기
		console.log('strDate ::: ' + strDate);
		date = moment(strDate, 'YYYY-MM-DD').toDate();
	}
	
	if(typeof p_diff === 'number') {
		diff = p_diff;
	} else {
		diff = parseInt(p_diff);
	}
	
	if(p_type == 'years') {
		format = p_format||'YYYY';
	} else if(p_type == 'months') {
		format = p_format||'MM';
	} else if(p_type == 'days') {
		format = p_format||'DD';
	} else if(p_type == 'hours') {
		format = p_format||'HH';
	}
	
	//console.log(p_type, date, diff, format.toUpperCase());
	
	if(diff < 0) {
		return moment(date).subtract(diff*-1, p_type).format(format.toUpperCase());
	} else if(diff > 0) {
		return moment(date).add(diff, p_type).format(format.toUpperCase());
	} else {
		return moment(date).add(0, p_type).format(format.toUpperCase());
	}
}


/**
 * 요일 가져오기
 * @param date 날짜(입력 안하면 오늘 요일)
 */
const WEEK_KOR = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
function getDateDays(date) {
	if(!isEmpty(date)) {
		date = date.replace(DATE_GUBUN_REGEX, '');
		return WEEK_KOR[new Date(parseInt(date.substring(0,4)), parseInt(date.substring(4,6)) - 1, parseInt(date.substring(6,8))).getDay()];
	} else {
		return WEEK_KOR[new Date().getDay()];
	}
}

/**
 * 오늘 년,월,일
 */
function getToday(){
	let now = new Date();
	var y = now.getFullYear();
	var m = parseInt(now.getMonth())+1 < 10 ? '0' + (parseInt(now.getMonth())+1) : parseInt(now.getMonth())+1;
	var d = now.getDate() < 10 ? '0' + now.getDate() : now.getDate(); 
    return [y,m,d];
}

function toStringByFormatting(source, delimiter = '-') {
    const year = source.getFullYear();
    const month = leftPad(source.getMonth() + 1);
    const day = leftPad(source.getDate());

    return [year, month, day].join(delimiter);
}

function leftPad(value) {
    if (value >= 10) {
        return value;
    }

    return `0${value}`;
}

//팝업 호출
function openPopup(elem, data){
	console.log('openPopup', elem, data);
	
	var url = $(elem).data('url');
	var callbackfun = $(elem).data('callbackfun');
	var opentabid = $(elem).data('opentabid');
	var size = $(elem).data('size');
	
	url += '?isPopup=Y';
	
	//콜백Function 명
	if(!isEmpty(callbackfun) && callbackfun != undefined){
		url += '&callbackfun=' + callbackfun;
	}
	
	//오픈 탭 아이디
	if(!isEmpty(opentabid) && opentabid != undefined){
		url += '&opentabid=' + opentabid;
	}
	
	//data
	if(!isEmpty(data) && data != undefined){
		for(key in data) {
			url += '&' + key + '=' + data[key];
		}
	}
	console.log('openPopup', url, callbackfun, opentabid, size);

	var popWidth;
	var popHeight;
	var page_id = url.substr(1);
	if(!isEmpty(size) && size != undefined){
		// S : small, M : middle, L : large, C : CUSTOM
		if(size == 'S'){
			popWidth = 450;
			popHeight = 355;
		} else if(size == 'M'){
			popWidth = 800;
			popHeight = 600;
		} else if(size == 'L'){
			popWidth = 1200;
			popHeight = 700;
		} else if(size == 'C'){
			popWidth = $(elem).data('width');
			popHeight = $(elem).data('height');
		}
	} else {
		if (page_id.search("woResultMstr") != -1 ) {
			popWidth = 1100;
			popHeight = 800;
		} else if (page_id.search("woPlanMstr") !=-1) {
			popWidth = 1170;
			popHeight = 730;
		} else if(page_id.search("pua100ChangeUserPW") !=-1){
			popWidth = 450;
			popHeight = 355;
		} else {
			popWidth = 1200;
			popHeight = 700;
		}
	}
	
	//==================================================================
	// pop up이 중앙에 위치하게 한다.
	var TopPosition  = (parseInt(screen.height) / 2) - (popHeight / 2);
	var LeftPosition = (parseInt(screen.width) / 2) - (popWidth / 2);

	var options = "width=" + popWidth + ",height=" + popHeight + "" + ",top=" + TopPosition + "px,left=" + LeftPosition + "px" + ",toolbar=no,scrollbars=no,resizable=yes";
	
	var newPopup = window.open(url, "", options);
	newPopup.focus();
}

function uploadFile(formData, url, callback) {
	console.log('uploadFile', formData, url, callback);		
	// FormData의 key 확인
	for (let key of formData.keys()) {
	  console.log(key);
	}
	
	// FormData의 value 확인
	for (let value of formData.values()) {
	  console.log(value);
	}
	$.ajax({
		type : "POST",
		enctype : 'multipart/form-data',
		url : url,
		data : formData,
		processData : false,
		contentType : false,
		cache : false,
		timeout : 600000,
		success : function(data) {
			console.log('uploadFile > ajax > success', data);
			if(!isEmpty(callback) && callback != 'undefined'){
				eval(callback + '(data)');
			}
		},
		error : function(e) {
			console.log('uploadFile > ajax > error', e);
		}
	});
}

function auto_fit_size() {
    window.resizeTo(100, 100);
    var thisX = parseInt(document.body.scrollWidth);
    var thisY = parseInt(document.body.scrollHeight);
    var maxThisX = screen.width - 50;
    var maxThisY = screen.height - 50;
    var marginY = 0;
    //alert(thisX + "===" + thisY);
    //alert("임시 브라우저 확인 : " + navigator.userAgent);
    // 브라우저별 높이 조절. (표준 창 하에서 조절해 주십시오.)
    if (navigator.userAgent.indexOf("MSIE 6") > 0) marginY = 60;        // IE 6.x
    else if(navigator.userAgent.indexOf("MSIE 7") > 0) marginY = 80;    // IE 7.x
    else if(navigator.userAgent.indexOf("Firefox") > 0) marginY = 50;   // FF
    else if(navigator.userAgent.indexOf("Opera") > 0) marginY = 30;     // Opera
    else if(navigator.userAgent.indexOf("Netscape") > 0) marginY = -2;  // Netscape

    if (thisX > maxThisX) {
        window.document.body.scroll = "yes";
        thisX = maxThisX;
    }
    if (thisY > maxThisY - marginY) {
        window.document.body.scroll = "yes";
        thisX += 19;
        thisY = maxThisY - marginY;
    }
    window.resizeTo(thisX+10, thisY+marginY);
}

function toStringByFormattingTime(source, delimiter = ':') {
    const str1 = source.substr(0,2);
    const str2 = source.substr(2,2);

    return [str1, str2].join(delimiter);
}

function getCookie(name) 
{ 
		var nameOfCookie = name + "="; 
		var x = 0; 
		while ( x <= document.cookie.length ) 
		{ 
				var y = (x+nameOfCookie.length); 
				if ( document.cookie.substring( x, y ) == nameOfCookie ) { 
						if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) 
								endOfCookie = document.cookie.length; 
						return unescape( document.cookie.substring( y, endOfCookie ) ); 
				} 
				x = document.cookie.indexOf( " ", x ) + 1; 
				if ( x == 0 ) 
						break; 
		} 
		return ""; 
}

// 팝업창 하루동안만 띄우기 소스부분 
function setCookie( name, value, expiredays )
{
	 var todayDate = new Date();
	 todayDate.setDate( todayDate.getDate() + expiredays );
	 document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString()+";"
}

function getAjaxData(url, subParam, fnCallBack){
	console.log('getAjaxData', url, subParam);
	try{
		$.ajax({
			url : url
			, data : subParam
			, type : 'POST'
			, dataType : 'json'
			, beforeSend : function(xmlHttpRequest){
				xmlHttpRequest.setRequestHeader("AJAX", "true"); // ajax 호출을  header에 기록
			}
			, contentType : "application/json; charset:UTF-8"
			, error : function(XMLHttpRequest, textStatus, errorThrown) {
				if(XMLHttpRequest.status == 999){
					if(getParameterByName('isPopup') == "Y"){
						self.close();
						//alert("세션이 만료되었습니다. 로그인 화면으로 이동합니다.");
						opener.location.href = "/";
					} else {
						//alert("세션이 만료되었습니다. 로그인 화면으로 이동합니다.");
						location.href = "/";
					}
				}
				else{
					alert('Error: ' + XMLHttpRequest.responseText);
				}
			}
			, success : function(data, textStatus, XMLHttpRequest) {
				if(data != null){
					if(data.Errstate != null){
						toast("오류", data.Errmsg, "error");
	            		return;
	            	}
				}
				
				if(fnCallBack != '' && fnCallBack != null){
					eval(fnCallBack + "(data)");
				}
			}
		});
	}
	catch(e){}
};

/**
 * 메소드 설명 : 각종코드 호출 함수
 * -------------------------------------------------------------------
 * @param	String	DIR_TYPE		코드종류
 * @param	String 	returnType		반환형태(Array/Json)
 */
function getdirType(DIR_TYPE, returnType){
	var returnValue;	// 반환값(Array/Json)
	
	$.ajax({
		url : '/getDirType'
		, data : JSON.stringify({dirType : DIR_TYPE})
		, type : 'POST'
		, async: false
		, dataType : 'json'
		, headers: {
			'Accept': 'application/json'
			, 'Content-Type': 'application/json'
		}
		, error : function(request, status, error){
			console.error('공통코드를 불러오지 못했습니다.');
			return false;
		}
		, success : function(List){
			if(returnType == 'Array'){
				returnValue = changeArray(List);
			}
			else if(returnType == undefined || returnType == 'Json'){
				returnValue = List;
			}
		}
	});
	
	return returnValue;
};

/**
 * 메소드 설명 : 각종코드 호출 후 태그에 list값을 매칭
 * -------------------------------------------------------------------
 * @param	String	element		매칭할 select 태그ID
 * @param	Json 	list		데이터값
 * @param	String 	allYn		'전체' 항목여부(Y:전체 표시/N:전체 미표시)
 */
function dirTypeSelectAdd(element, list, allYn){
	$("#" + element).empty(); 
	
	for(var i = 0; i < list.length; i++){
		var option = "<option value=" + list[i].CODE + ">" + list[i].DESCRIPTION + "</option>";
		if(i == 0){
			if(allYn == undefined || allYn == 'Y'){
				$("#" + element).append("<option value=''>전체</option>");
			}
		}
		$("#" + element).append(option);
	}
}

/**
 * 메소드 설명 : selectbox에 년도 list값을 매칭
 * -------------------------------------------------------------------
 * @param	String	element		매칭할 select 태그ID
 * @param	String	setYear		매칭할 값
 */
function getYears(element, setYear){
	$("#" + element + " option").remove();	// 기존 optopn을 삭제함

    // 올해 기준으로 -2년부터 +5년을 보여줌.
	var startY = Number(setYear)-5;
	var endY = Number(setYear)+5;
    for(var y = startY; y <= endY; y++){
        $('#' + element).append("<option value='"+ y +"'>"+ y + "년" +"</option>");
    }
    
    jQuery("#" + element + " > option[value="+setYear+"]").attr("selected", "true");
}

/**
 * 메소드 설명 : selectbox에 월 list값을 매칭
 * -------------------------------------------------------------------
 * @param	String	element		매칭할 select 태그ID
 */
function getMonths(element, setMonth) {
	$("#" + element + " option").remove();	// 기존 optopn을 삭제함

	for (var i = 1; i <= 12; i++) {
      $("#" + element).append("<option value='" + i + "'>" + i + "월" + "</option>");
    }
    
    jQuery("#" + element + " > option[value="+setMonth+"]").attr("selected", "true");
}

/**
 * 메소드 설명 : selectbox에 주차 list값을 매칭
 * -------------------------------------------------------------------
 * @param	String	element		매칭할 select 태그ID
 */
function getWeek(element, week) {
	$("#" + element + " option").remove();	// 기존 optopn을 삭제함
	
	for (var i = 1; i <= 53; i++) {
      $("#" + element).append("<option value='" + i + "'>" + i + "주차" + "</option>");
    }
    
    jQuery("#" + element + " > option[value="+week+"]").attr("selected", "true");
}

/**
 * 메소드 설명 : selectbox에 오늘날짜의 주차 매칭
 * -------------------------------------------------------------------
 * @param	String	element		매칭할 select 태그ID
 * @param	String	nowDate		오늘날짜(양식 yyyy-mm-dd)
 */
function getNowPeriod(element, splitDay){                
	// 주차 구하기( JS기준 : 일요일 0, 월요일 1 ~ 토요일 6 )                        
	//var splitDay = nowDate.split("-");                
	var startYearDay = '1/1/'+splitDay[0];                
	var today = splitDay[1] + '/' + splitDay[2] + '/' + splitDay[0];                
	var dt = new Date(startYearDay);                
	var tDt = new Date(today);                
	var diffDay = (tDt-dt) / 86400000; 
	// 1월 1일부터 현재날자까지 차이에서 7을 나눠서 몇주가 지났는지 확인을 함
	// 요일을 기준으로 1월 1일보다 이전 요일이라면 1주가 더 늘었으므로 +1 시켜줌.                
	var weekDay = parseInt(diffDay / 7) + 1;     
	           
	if( tDt.getDay() < dt.getDay() )                    
		weekDay += 1;                
		  
	jQuery("#" + element + " > option[value="+weekDay+"]").attr("selected", "true");    
}

function getPeriod(setYear, setMonth){
	let cYear = setYear;
	let cMonth = setMonth.replace(/(^0+)/, "") - 1;

	// 날짜형으로 데이트 포맷
    let date = new Date(cYear, cMonth);

    // 월요일을 중심으로한 주차 구하기( JS기준 : 일요일 0, 월요일 1 ~ 토요일 6 )
    let firstDay = new Date(date.getFullYear(), date.getMonth(), 1);	// 달의 첫번째 일자
    let lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);	// 달의 마지막 일자
	
	let weekObj = null;
    let weekObjArray = new Array();
    let weekStand = 8;  // 월요일 고정
    let firstWeekEndDate = true;
    let thisMonthFirstWeek = firstDay.getDay();

    for(var num = 1; num <= 6; num++) {
	    // 마지막월과 첫번째월이 다른경우 빠져나온다.
        if(lastDay.getMonth() != firstDay.getMonth()) {
            break;
        }

        weekObj = new Object();

        // 한주의 시작일은 월의 첫번째 월요일로 설정
        if(firstDay.getDay() <= 1) {
            // 한주의 시작일이 일요일이라면 날짜값을 하루 더해준다.
            if(firstDay.getDay() == 0) { firstDay.setDate(firstDay.getDate() + 1); }

            weekObj.weekStartDate =
                  firstDay.getFullYear().toString()
                + "-"
                + numberPad((firstDay.getMonth() + 1).toString(), 2)
                + "-"
                + numberPad(firstDay.getDate().toString() , 2);
        }

        if(weekStand > thisMonthFirstWeek) {
            if(firstWeekEndDate) {
                if((weekStand - firstDay.getDay()) == 1) {
                    firstDay.setDate(firstDay.getDate() + (weekStand - firstDay.getDay()) - 1);
                }

                if((weekStand - firstDay.getDay()) > 1) {
                    firstDay.setDate(firstDay.getDate() + (weekStand - firstDay.getDay()) - 1)
                }

                firstWeekEndDate = false;
            } else {
                firstDay.setDate(firstDay.getDate() + 6);
            }
        } else {
            firstDay.setDate(firstDay.getDate() + (6 - firstDay.getDay()) + weekStand);
        }

        // 월요일로 지정한 데이터가 존재하는 경우에만 마지막 일의 데이터를 담는다.
        if(typeof weekObj.weekStartDate !== "undefined") {
            weekObj.weekEndDate =
                  firstDay.getFullYear().toString()
                + "-"
                + numberPad((firstDay.getMonth() + 1).toString(), 2)
                + "-"
                + numberPad(firstDay.getDate().toString(), 2);           

            weekObjArray.push(weekObj);
        }

        firstDay.setDate(firstDay.getDate() + 1);
    }
    
    return weekObjArray;
}

// 월, 일 날짜값 두자리( 00 )로 변경
function numberPad(num, width) {
    num = String(num);
    return num.length >= width ? num : new Array(width - num.length + 1).join("0") + num;
}

// URL 파라미터 값 가져오기(정규식)
function getParameterByName(name) {
  name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
  var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
  results = regex.exec(location.search);
  return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

/**
 * 파라메터로 전송되어진 폼 object의 모든 elements 를
 * enable 상태로 한다.
 * class가 input_read인 상태는 항상 disable이다.
 * onlyEnable:true 인경우 disable은 해주지않고 enable 만 해준다.
 */
function enableFormObject(obj, onlyEnable)
{
	if(obj)
	{
		for(var i=0;i<obj.elements.length;i++)
		{
			// class 가  input_read 경우는 무조건 disable 이다.
			if (obj.elements[i].className == "input_read")
			{
				if (!onlyEnable)
				{
					obj.elements[i].disabled = true;
					obj.elements[i].readOnly = true;
				}
			}
			else
			{
				obj.elements[i].disabled = false;
				obj.elements[i].readOnly = false;
			}
		}
	}
}

function disableAllFormObject(obj)
{
	if(obj)
	{
		for(var i=0;i<obj.elements.length;i++)
		{
			if (obj.elements[i].type != 'hidden' && obj.elements[i].tagName != 'FIELDSET')
			{
				// class 가 input_read 인 경우는 원래 disable 혹은 readOnly 이므로 따로 설정 필요없음
				if (obj.elements[i].className != "input_read")
				{
					if (obj.elements[i].type == 'textarea')
					{
						obj.elements[i].readOnly = true;
					}
					else
					{
						obj.elements[i].disabled = true;
					}
				}
			}
		}
	}
}

/**
 * 파라메터로 전송되어진 폼 object의 모든 elements 를
 * disable 상태로 한다.
 */
function disableFormObject(obj)
{
	if(obj)
	{
		for(var i=0;i<obj.elements.length;i++)
		{
			if (obj.elements[i].type != 'hidden' && obj.elements[i].tagName != 'FIELDSET')
			{
				// class 가 input_read 인 경우는 원래 disable 혹은 readOnly 이므로 따로 설정 필요없음
				if (obj.elements[i].className != "input_read")
				{
					if (obj.elements[i].type == 'text' || obj.elements[i].type == 'textarea')
					{
						obj.elements[i].readOnly = true;
					}
					else
					{
						obj.elements[i].disabled = true;
					}
				}
			}
		}
	}
}

function enableAllFormObject(obj, onlyEnable)
{
	if(obj)
	{
		for(var i=0;i<obj.elements.length;i++)
		{
				obj.elements[i].disabled = false;
				obj.elements[i].readOnly = false;
		}
	}
}

//그리드 전체 데이터 CRUD 처리
function mergeFormNGridData(formArray, gridArray, url, callback) {
	var param = {};
	var dataObj = new Object();
	
	dataObj.objName = formArray
	$.each(formArray, function(index, data) {
		var frmElem = $('#' + data);
		eval('dataObj.' + data + ' = serializeObject(frmElem)');
	});
	
	$.each(gridArray, function(index, data) {
		var gridObj = $("#" + gridArray[index]);
		var dataIds = gridObj.jqGrid("getDataIDs");
		console.log(gridObj, dataIds);
		
		var dataListC = new Array();
		var dataListU = new Array();
		var dataListD = new Array();
		var jsonArray = new Array();
		$.each(dataIds, function(gIndex, gData) {
			gridObj.jqGrid('saveRow', dataIds[gIndex]);
			var rowData = gridObj.jqGrid("getRowData", dataIds[gIndex]);
			if ($("tr#" + dataIds[gIndex], gridObj).hasClass('insert')) {
				rowData.action = 'C';
				jsonArray.push(rowData);
			} else if ($("tr#" + dataIds[gIndex], gridObj).hasClass('update')) {
				rowData.action = 'U';
				jsonArray.push(rowData);
			} else if ($("tr#" + dataIds[gIndex], gridObj).hasClass('delete')) {
				rowData.action = 'D';
				jsonArray.push(rowData);
			}
		});
		console.log('jsonArray', jsonArray);
		dataObj[data] = jsonArray;
	});
	console.log('dataObj', dataObj, JSON.stringify(dataObj));
	getAjaxJsonData(url, dataObj, callback);
}

function inputNumberFormat(elem) {
     elem.val(comma(uncomma(elem.val())));
}

function fileDelete(tElem){
	console.log('fileDelete', tElem);
	
	if(confirm("선택한 파일을 정말 삭제하시겠습니까?")){
		var param = {
			IMAGE_NO : tElem.id
		};
		getAjaxJsonData('fileDelete', param, 'fileDeleteCallBack');	
	}
}

function fileDataDelete(tElem, editMode){
	console.log('fileDelete', tElem);
	
	if(editMode) {
		if(confirm("선택한 파일을 정말 삭제하시겠습니까?")){
			var param = {
				IMAGE_NO : tElem.id
				, NAME : tElem.dataset.name
			};
			getAjaxJsonData('fileDelete', param, 'fileDeleteCallBack');	
		}
	}
}