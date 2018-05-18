<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>试题管理</title>
<link href ="${pageContext.request.contextPath }/css/regcss.css" 
	type="text/css" rel="stylesheet"/>
<script type="text/javascript" 
	src="${pageContext.request.contextPath }/js/jquery-1.4.4.min.js"></script>

</head>

<body class="allbody" >
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
	 	<a href="${pageContext.request.contextPath }/paper/paperManage.action">试卷管理</a>
	 	</div>
	 	</div>
	 	<div id="right">
	 		<%-- <%@ include file="import.jsp" %> --%>
	 		<c:if test="${Info!=null }">
	 		 <font>${Info }</font> 
	 		</c:if>
	 		<div><p><b>新增考试</b></p>
	 		<hr style="margin-top: 10px;" />
	 		</div>
	 		<div>
	 		<form action="importExam.action">
	 		<table >
	 		<tr>
	 		<td>考试开始日期：<input type="date" name="startTime"></td>
	 		<td>考试结束日期：<input type="date" name="endTime"></td>
	 		</tr>
	 		<tr>
	 		<td>设置考试名称：<input type="text" name="examName"></td>
	 		<td style="text-align: right ;"><input type="submit" value="增加考试"></td>
	 		</tr>
	 		</table>
	 		</form>
	 		
	 		</div>
	 	
	 	</div>
	 
	 </div>
	

</body>
</html>