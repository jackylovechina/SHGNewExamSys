<%@ page language="java" pageEncoding="utf-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Test</title>
</head>
<body>
	<form action="findEmployee.action" method="post">
		用户姓名：<input type="text" name="name" /></br> 
		<input type="submit" value="查询">
	</form>
	<table width="300px;" border=1>
		<tr>
			<td>序号</td>
			<td>姓名</td>
			<td>账号</td>
			
		</tr>
		<c:forEach items="${employeeList }" var="employee" varStatus="status">
			<tr>
				<td>${status.index+1 }</td><td>${employee.name }</td>
				<td>${employee.number }</td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>