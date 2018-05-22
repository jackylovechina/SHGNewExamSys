<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>试题管理</title>
<link href ="${pageContext.request.contextPath }/css/regcss.css" 
	type="text/css" rel="stylesheet"/>
<script type="text/javascript" 
	src="${pageContext.request.contextPath }/js/jquery-1.4.4.min.js"></script>

</head>

<body class="allbody">
	<div id="menu">
	<%@ include file="../menu.jsp" %>
	</div>
	
	 <div id="wrap">
	 	<div id="left">
	 	<div class="left-title">
	 	<a href="${pageContext.request.contextPath }/exam/examImport.action">新增考试</a>
	 	</div>
	 	<div class="left-title">
	 	<a href="${pageContext.request.contextPath }/exam/examView.action">管理考试</a>
	 	</div>
	 	<div class="left-title">
	 	<a href="${pageContext.request.contextPath }/paper/paperManage.action">添加试卷</a>
	 	</div>
	 	<div class="left-title">
	 		<a>管理试卷</a>
	 	</div>
	 	</div>
	 	<div id="right">
	 		<%-- <%@ include file="import.jsp" %> --%>
	 	
	 	</div>
	 
	 </div>
	

</body>
</html>