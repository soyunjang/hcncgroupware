<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="description" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/import.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.min.css'/>">
		
		<!-- jqGrid css -->
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jqGrid/ui.jqgrid.css'/>">
		<!-- iGrowl css -->
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/igrowl/igrowl.min.css'/>">
		
		<!-- 코드 하이라이팅을 위한 CodeMirror css-->
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/toastui-editor/codemirror.min.css'/>">
		<!-- toastui-editor css -->
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/toastui-editor/toastui-editor.min.css'/>">
		<!-- fontawesome css -->
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/fontawesome/all.min.css'/>">
		
		<script type="text/javascript" src="<c:url value='/resources/js/jquery.min.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/jquery-migrate-1.4.1.min.js'/>"></script>
		
		<!-- jqGrid js-->
		<script type="text/javascript" src="<c:url value='/resources/js/jqGrid/jquery.jqGrid.min.js'/>"></script>
		
		<!-- igrowl js-->
		<script type="text/javascript" src="<c:url value='/resources/js/igrowl/igrowl.min.js'/>"></script>
		<!-- toastui-editor js-->
		<script type="text/javascript" src="<c:url value='/resources/js/toastui-editor/toastui-editor.js'/>"></script>
		
		<!-- excel js -->
		<script type="text/javascript" src="<c:url value='/resources/js/excel/FileSaver.min.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/excel/xlsx.full.min.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/excel/xlsx.bundle.js'/>"></script>
		
		<!-- jqGrid 트리 구현 js-->
		<script type="text/javascript" src="<c:url value='/resources/js/jqGrid/grid.locale-kr.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/jqGrid/treegrid.js'/>"></script>
	
		<script type="text/javascript" src="<c:url value='/resources/js/script.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/HSFrameScript.js'/>"></script>
		<title>HCNC</title>
	</head>
	<%@ include file="/WEB-INF/include/includeFrame.jsp" %>
	<body oncontextmenu="return false">
		<tiles:insertAttribute name="body"/>
	</body>
	<div id="confirmPopUp" class="popup-bg">
		<div class="popup-wrap">
			<div class="popup-cont"></div>
			<div class="popup-btn">
				<a href="javascript:void(0);" id="confirmPopupYes" title="확인" class="">확인</a>
				<a href="javascript:void(0);" id="confirmPopupNo" title="취소" class="bg-gray btn-close">취소</a>
		</div>
	</div>	
	</div>
</html>