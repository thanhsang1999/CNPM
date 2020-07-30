<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Header -->

<header class="header">
	<%@include file="header/topbar.jsp"%>
	<%@include file="header/headermain.jsp"%>
	<%@include file="header/mainNavigation.jsp"%>
	

</header>
<%if(session.getAttribute("user")==null) {%>
	<%@include file="header/formLogIn.jsp"%>
	<%@include file="header/formSignUp.jsp"%>
	<%@include file="header/formQMK.jsp"%>
	<%}%>




