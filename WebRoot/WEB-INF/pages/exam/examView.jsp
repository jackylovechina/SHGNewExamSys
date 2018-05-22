<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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
	function toPrePage() {
		var currentPageObject = document.getElementById("currentPage");
		var currentPage = parseInt(currentPageObject.value);
		if (currentPage == 1) {
			alert("数据已到顶！");
		} else {
			currentPageObject.value = currentPage - 1;
			var pageSize = parseInt(document.getElementById("pageSize").value);
			var startPageObject = document.getElementById("startPage");
			startPageObject.value = parseInt(startPageObject.value) - pageSize;
			document.getElementById("listForm").submit();
		}
	}
	function toNextPage() {
		var currentPageObject = document.getElementById("currentPage");
		var currentPage = parseInt(currentPageObject.value);
		var sumPage = parseInt(document.getElementById("sumPageNumber").value);
		if (currentPage >= sumPage) {
			alert("数据已到底！");
		} else {
			currentPageObject.value = currentPage + 1;
			var pageSize = parseInt(document.getElementById("pageSize").value);
			var startPageObject = document.getElementById("startPage");
			startPageObject.value = parseInt(startPageObject.value) + pageSize;
			document.getElementById("listForm").submit();
		}
	}
	function toLocationPage() {
		var pageNumber = document.getElementById("pageNumber").value;
		var currentPageObject = document.getElementById("currentPage");
		var currentPage = currentPageObject.value;
		if (pageNumber == null || pageNumber == "") {
			alert("请输入要跳转的页数");
		} else {
			pageNumber = parseInt(pageNumber);
			var sumPage = parseInt(document.getElementById("sumPageNumber").value);
			if (pageNumber < 1) {
				alert("数据已经到顶");
			} else if (pageNumber > sumPage) {
				alert("数据已经到底");
			} else {
				currentPageObject.value = pageNumber;
				var pageSize = parseInt(document.getElementById("pageSize").value);
				var startPageObject = document.getElementById("startPage");
				if (pageNumber > currentPage) {
					startPageObject.value = parseInt(startPageObject.value) + pageSize;
				} else if (pageNumber < currentPage) {
					startPageObject.value = parseInt(startPageObject.value) - pageSize;
				}
				document.getElementById("listForm").submit();
			}
		}
	}
	function editExam(id) {
		var message = "{'id':'" + id + "'}";
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/exam/editExam.action",
			contentType : 'application/json;charset=utf-8',
			data : message, //数据格式是JSON串
			success : function(data) { //返回JSON结果
				$("#editExamName").val(data["examName"]);
				$("#editStartTime").val(data["startTime"].substring(0,10));
				$("#editEndTime").val(data["endTime"].substring(0,10));
				$("#Id").val(data["id"]);
				//显示弹出框
				$(".mask").css("display", "block");
				//引入分页信息至form表单
				$("#eStartPage").val($("#startPage").val());
				$("#eCurrentPage").val($("#currentPage").val());
				$("#ePageSize").val($("#pageSize").val());
			}
		});

	}
	function cancelEdit() {
		$(".mask").css("display", "none");
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
			<c:if test="${Info!=null }">
				<font>${Info }</font>
			</c:if>
			<div><p><b>管理考试</b></p>
			<hr style="margin-top: 10px;" />
			</div>
			<div>
				<form id="listForm" action="examView.action" method="post">
					考试名称：
					<input type="text" name="examName">
					<input type="submit" value="搜索"
						style="background-color: #173e65;color: #FFFFFF;width: 70px;" />
					<br>
					<!-- 显示错误消息 -->
					<c:if test="${errorMsg }">
						<font color="red">${errorMsg }</font>
						<br />
					</c:if>

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
			<div class="mask">
				<div class="c">
					<div
						style="background-color: #173e65;height: 20px;color: #fff;font-size: 12px;padding-left: 7px;">
						修改信息<font style="float: right;padding-right: 10px;" onclick="cancelEdit()">X</font>
					</div>
					<form id="editForm" action="edit.action" method="post">
						<br>
						考试名称：
						<input type="text" id="editExamName" name="examName" >
						<br><br>
						开始日期：
						<input type="date" id="editStartTime" name="startTime" >
						<br />
						截止日期：
						<input type="date" id="editEndTime" name="endTime" >
						<br />
						
						<input type="hidden" name="id" id="Id" />
						<input type="hidden" name="startPage" id="eStartPage" />
						<input type="hidden" name="currentPage" id="eCurrentPage" />
						<input type="hidden" name="pageSize" id="ePageSize" />
						<input type="submit" value="提交"
							style="background-color: #173e65;color: #FFFFFF;width: 70px;" />
					</form>
				</div>
			</div>

			<div>
				<hr style="margin-top: 10px;" />
				<c:if test="${list!=null }">
					<table style="margin-top: 10px;width: 700px;text-align: center;"
						border="1">
						<tr class="question-title">
							<td>序号</td>
							<td>考试名称</td>
							<td>起始日期</td>
							<td>截止日期</td>
							<td>操作</td>
						</tr>
						<c:forEach items="${list }" var="item" varStatus="status">
							<tr>
								<td>${status.index+1 }</td>
								<td style="width: 250px">${item.examName }</td>
								<td>${item.startTime }</td>
								<td>${item.endTime }</td>
								<td class="question-deal"><a
										onclick="editExam('${item.id}')">编辑</a>| <a
										onclick="deleteExam('${item.id}','${item.examName }')">删除</a>
									<form id="deleteForm" action="delete.action" method="post">
										<input type="hidden" name="id" id="dId" />
										<input type="hidden" name="startPage" id="dStartPage" />
										<input type="hidden" name="currentPage" id="dCurrentPage" />
										<input type="hidden" name="pageSize" id="dPageSize" />
									</form></td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
				<c:if test="${list==null }">
					<b>搜索结果为空！</b>
				</c:if>
			</div>
			<div style="margin-top: 10px;">
				<a onclick="toPrePage()">上一页</a>
				<a onclick="toNextPage()">下一页</a>
				<input type="text" id="pageNumber" style="width: 50px;"></input>
				<button onclick="toLocationPage()">Go</button>
				<dir id="pageInfo"></dir>
			</div>
		</div>
	</div>
</body>
</html>