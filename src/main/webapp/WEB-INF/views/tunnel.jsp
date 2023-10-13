<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
com.hs.home.controller.UserInfo userinfo = (com.hs.home.controller.UserInfo)session.getAttribute("User");
 if(userinfo == null){%>
	<% response.sendRedirect("/");%>
<%}else{%>
<% response.sendRedirect("/main"); %>
<%}%>