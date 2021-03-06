<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>考试管理</title>
<link href="${pageContext.request.contextPath }/css/regcss.css"
	type="text/css" rel="stylesheet" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
	function checkAdd() {
		if ($("#startTime").val() == null || $("#startTime").val() == "") {
			alert("开始日期不能为空");
			return false;
		}
		if ($("#endTime").val() == null || $("#endTime").val() == "") {
			alert("结束日期不能为空");
			return false;
		}
		if ($("#examName").val() == null || $("#examName").val() == "") {
			alert("考试名称不能为空");
			return false;
		}
		return true;
	}
</script>

</head>

<body class="allbody">
	<div id="menu">
		<%@ include file="../menu.jsp"%>
	</div>
	<div id="wrap">
		<div id="left">
			<div class="left-title">
				<a href="${pageContext.request.contextPath }/exam/examImport.action">新增考试</a>
			</div>
			<div class="left-title">
				<a href="${pageContext.request.contextPath }/exam/examView.action">管理考试</a>
			</div>
		</div>
		<div id="right">
			<%-- <%@ include file="import.jsp" %> --%>
			<c:if test="${Info!=null }">
				<font>${Info }</font>
			</c:if>
			<div>
				<p>
					<b>新增考试</b>
				</p>
				<hr style="margin-top: 10px;" />
			</div>
			<div>
				<form action="importExam.action" onsubmit="return checkAdd()">
					<table>
						<tr>
							<td>考试开始日期：<input type="date" name="startTime"
									id="startTime"></td>
							<td>考试结束日期：<input type="date" name="endTime" id="endTime"></td>
						</tr>
						<tr>
							<td>设置考试名称：<input type="text" name="examName" id="examName"></td>
							<td style="text-align: right ;"><input type="submit"
									value="增加考试"></td>
						</tr>
					</table>
				</form>

			</div>
		</div>
	</div>
</body>
</html>