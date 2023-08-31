<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<%-- <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="description" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="icon" href="data:;base64,=">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/import.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.min.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jqGrid/ui.jqgrid.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/igrowl/igrowl.min.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/fontawesome/all.min.css'/>">
		
		<script type="text/javascript" src="<c:url value='/resources/js/jquery.min.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/jquery-migrate-1.4.1.min.js'/>"></script>
		
		<script type="text/javascript" src="<c:url value='/resources/js/jqGrid/jquery.jqGrid.min.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/igrowl/igrowl.min.js'/>"></script>
		
		<!-- jqGrid 트리 구현 js-->
		<script type="text/javascript" src="<c:url value='/resources/js/jqGrid/grid.locale-kr.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/jqGrid/treegrid.js'/>"></script>
		
		<script type="text/javascript" src="<c:url value='/resources/js/script.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/HSFrameScript.js'/>"></script>
		
		<link rel="favicon" href="/favicon.ico">
		<title>HCNC 그룹웨어</title>
	</head>
	<%@ include file="/WEB-INF/include/include.jsp" %>
	<!-- 오른쪽 마우스 클릭 금지 -->
 	<body oncontextmenu="return false">
		<div class="sub-main-wrap">
			<div class="sub-header">
				<tiles:insertAttribute name="header" />
			</div>
			<div class="lnb-wrap">
				<tiles:insertAttribute name="left"/>
			</div>
			<div class="util-area">
				<ul class="openpage">
					<li class="active" data-tab="main">
						<a href="javascript:void(0);"><i class="ace-icon fa fa-home home-icon"></i></a>
					</li>
				</ul><!-- /.openpage -->
			</div>
			<div class="sub-container-wrap">
				<div class="tab-contents">
					<tiles:insertAttribute name="body"/>
				</div>
			</div>
			<div class="footer-wrap">
				<tiles:insertAttribute name="footer" />
			</div>
		</div>
	</body>
</html>