<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册</title>
<link href ="${pageContext.request.contextPath }/css/regcss.css" 
	type="text/css" rel="stylesheet"/>
<script type="text/javascript">
	function validate() {
		if (document.getElementById("name").value == "") {
			alert("姓名不能为空");
			document.getElementById("name").focus();
			return false;

		} else if (document.getElementById("password").value == "") {
			alert("密码不能为空");
			document.getElementById("password").focus();
			return false;

		} else if (document.getElementById("number").value == "") {
			alert("工号不能为空");
			document.getElementById("number").focus();
			return false;

		} else if (document.getElementById("sex").value == "") {
			alert("性别不能为空");
			document.getElementById("sex").focus();
			return false;

		}
		return true;

	}
</script>
</head>
<body>
	<div id="content">
		<div id="form">
			<h1>用户注册</h1>
			<form action="register.action" method="post" id="myform" onsubmit="return validate()">
			
			工号<input type="text" id="number" name="number"
				style="width:190px;height: 26px;margin-top:8px;margin-left: 54px;"/></br>
			密码<input type="password" id="password" name="password"
				style="width:190px;height: 26px;margin-top:8px;margin-left: 54px;"  /></br>
			姓名<input type="text" id="name" name="name"
				style="width:190px;height: 26px;margin-top:8px;margin-left: 54px;" /></br>
			性别<select id="sex" name="sex"
				style="width:190px;height: 26px;margin-top:8px;margin-left: 54px;" >
				<option value="男" selected="selected">男</option>
				<option value="女">女</option>
				</select></br>
			部门<select id="dep_id" name="dep_id" 
				style="width:190px;height: 26px;margin-top:8px;margin-left: 54px;">
				<!--<c:forEach items="${departments }" var="department" varStatus="status">
				<option value="${department.id }">${department.name }</option>
				</c:forEach>-->
				<option value="volvo">Volvo</option>
				<option value="saab">Saab</option>
				<option value="fiat" selected="selected">Fiat</option>
				<option value="audi">Audi</option>
				</select></br>
				
				<input type="submit" value="注册" 
				style="width:50px;height: 30px;margin-top:8px;margin-bottom: 8px"/>
				<a href="toLogin.action">返回登录</a>
			</form>
			<!--  -->
			<c:if test="${errorMsg!=null }">
				<font color="red">${errorMsg }</font>
			</c:if>
		</div>
	
	</div>

</body>
</html>













