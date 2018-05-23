<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>试题管理</title>
<link href="${pageContext.request.contextPath }/css/regcss.css"
	type="text/css" rel="stylesheet" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
	function init() {
		var countNumber = document.getElementById("countNumber").value;
		var sumPage = document.getElementById("sumPageNumber").value;
		var currentPage = document.getElementById("currentPage").value;
		var info = "一共<font color='blue'>" + countNumber + "</font>条数据," +
			"共<font color='blue'>" + sumPage + "</font>页," +
			"当前第<font color='blue'>" + currentPage + "</font>页";
		document.getElementById("pageInfo").innerHTML = info;

	}
</script>
</head>

<body class="allbody" onload="init()">
	<div id="menu">
		<%@ include file="../menu.jsp"%>
	</div>

	<div id="wrap">
		<div id="left">
			<div class="left-title">
				<a
					href="${pageContext.request.contextPath}/paper/paperManage.action">添加试卷</a>
			</div>
			<div class="left-title">
				<a
					href="${pageContext.request.contextPath }/paper/prePaperView.action">管理试卷</a>
			</div>
		</div>
		<div id="right">
			<%-- <%@ include file="import.jsp" %> --%>
			<div>
				<p>
					<b>管理试卷</b>
				</p>
				<hr style="margin-top: 10px;" />
			</div>

			<div>
				<form action="paperView.action" method="post">
					所属考试：
					<select name="exam_id">
						<c:if test="${examList!=null }">
							<c:forEach items="${examList }" var="exam" varStatus="status">
								<option value="${exam.id }"
									<c:if test="${exam.id == old_exam_id }">selected</c:if>>${exam.examName }</option>
							</c:forEach>
						</c:if>
					</select>
					<input type="submit" value="查询试卷">
					<input type="hidden" name="startPage" id="startPage"
						value="${startPage }" />
					<input type="hidden" name="currentPage" id="currentPage"
						value="${currentPage }" />
					<input type="hidden" name="pageSize" id="pageSize"
						value="${pageSize }" />
					<input type="hidden" name="sumPageNumber" id="sumPageNumber"
						value="${sumPageNumber }" />
					<input type="hidden" name="countNumber" id="countNumber"
						value="${countNumber }" />

				</form>
			</div>
		</div>
	</div>
</body>
</html>