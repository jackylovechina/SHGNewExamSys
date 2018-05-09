<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	<%@ include file="../menu.jsp" %><br>
	
	<form action="">
	<select>
	<c:forEach items="${conTypeList }" var="contentType" varStatus="status">
	<option value="${contentType.id }">${contentType.typeName }</option>
	</c:forEach>
	</select>
	<select>
	<c:forEach items="${queTypeList }" var="questionType" varStatus="status">
	<option value="${questionType.id }">${questionType.typeName }</option>
	</c:forEach>
	</select>
	<br>
	选择题库文件：<input type="file" >
	
	<input type="submit" value="批量添加" style="background-color: #99ffff">
	</form>
	

</body>
</html>