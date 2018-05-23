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

			<div id="paperList">
				<c:if test="${list!=null }">
					<table style="margin-top: 10px;width: 1000px;text-align: center;"
						border="1">
						<tr>
							<td>序号</td>
							<td>试卷名称</td>
							<td>总分</td>
							<td>单选题数量</td>
							<td>单选题分值</td>
							<td>多选题数量</td>
							<td>多选题分值</td>
							<td>填空题数量</td>
							<td>填空题分值</td>
							<td>判断题数量</td>
							<td>判断题分值</td>
							<td>简答题数量</td>
							<td>简答题分值</td>
							<td>操作</td>
						</tr>
						<c:forEach items="${list }" var="item" varStatus="status">
							<tr>
								<td>${status.index+1 }</td>
								<td>${item.name }</td>
								<td>${item.totalScore }</td>
								<td>${item.singleChoiceCount }</td>
								<td>${item.singleChoiceValue }</td>
								<td>${item.multiChoiceCount }</td>
								<td>${item.multiChoiceValue }</td>
								<td>${item.blankCount }</td>
								<td>${item.blankValue }</td>
								<td>${item.judgeCount }</td>
								<td>${item.judgeValue }</td>
								<td>${item.descriptionCount }</td>
								<td>${item.descriptionValue }</td>
								<td><a onclick="editPaper('${item.id}')">编辑</a>|<a
										onclick="deletePaper('${item.id}','${item.name }')">删除</a>
									<form id="deleteForm" action="delete.action" method="post">
										<input type="text" name="id" id="dId" />
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
				<div style="margin-top: 10px;">
					<a onclick="toPrePage()">上一页</a>
					<a onclick="toNextPage()">下一页</a>
					<input type="text" id="pageNumber" style="width: 50px;">
					<button onclick="toLocationPage()">Go</button>
					<p id="pageInfo"></p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>