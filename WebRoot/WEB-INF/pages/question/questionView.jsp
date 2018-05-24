<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>试题管理</title>
<link href="${pageContext.request.contextPath }/css/regcss.css"
	type="text/css" rel="stylesheet" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
	function changeStatus() {
		var status = document.getElementById("indexStatus").value;
		document.getElementById("status").value = status;
	}

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

	function editQuestion(id) {
		var message = "{'id':'" + id + "'}";
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/question/editQuestion.action",
			contentType : 'application/json;charset=utf-8',
			data : message, //数据格式是JSON串
			success : function(data) { //返回JSON结果
				$("#id").val(data["id"]);
				$("#editContent").val(data["questionContent"]);
				$("#editA").val(data["choiceA"]);
				$("#editB").val(data["choiceB"]);
				$("#editC").val(data["choiceC"]);
				$("#editD").val(data["choiceD"]);
				$("#editAnswer").val(data["standardAnswer"]);
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

	function deleteQuestion(id, name) {
		if (window.confirm("你确定要删除 :" + name +  "吗?")) {
			var message = "{'id':'" + id + "'}";
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/question/delete.action",
				contentType : 'application/json;charset=utf-8',
				data : message, //数据格式是JSON串
				success : function(data) { //返回JSON结果
					$("#dStartPage").val($("#startPage").val());
					$("#dCurrentPage").val($("#currentPage").val());
					$("#dPageSize").val($("#pageSize").val());
					$("#listForm").submit(); //提交表单
				}
			});
		/*$("#dQuestionId").val(id);//向form中引入id
		//引入分页信息至该form表单
		$("#dStartPage").val($("#startPage").val());
		$("#dCurrentPage").val($("#currentPage").val());
		$("#dPageSize").val($("#pageSize").val());
		$("#deleteForm").submit();//提交表单*/
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
					href="${pageContext.request.contextPath }/question/questionManage.action">试题导入</a>
			</div>
			<div class="left-title">
				<a
					href="${pageContext.request.contextPath }/question/questionView.action">试题查看</a>
			</div>
		</div>
		<div id="right">
			<div><p><b>管理题库</b></p>
	 		<hr style="margin-top: 10px;" />
	 		</div>
			<div class="mask">
				<div class="c">
					<div
						style="background-color: #173e65;height: 30px;color: #fff;font-size: 12px;padding-left: 7px;">
						修改信息<font style="float: right;padding-right: 10px;"
							onclick="cancelEdit()">X</font>
					</div>
					<form id="editForm" action="edit.action" method="post">
						题目种类：
						<select name="conType_id">
							<c:forEach items="${conTypeList }" var="item" varStatus="status">
								<option value="${item.id }"
									<c:if test="${item.id == conTypeId }">selected</c:if>>${item.typeName }</option>
							</c:forEach>
						</select>
						<br> 题目类型：
						<select name="queType_id">
							<c:forEach items="${queTypeList }" var="item" varStatus="status">
								<option value="${item.id }"
									<c:if test="${item.id == queTypeId }">selected </c:if>>${item.typeName }</option>
							</c:forEach>
						</select>
						<br> 题目内容：
						<textarea id="editContent" name="questionContent"
							style="width: 220px;"></textarea>
						<br>
						<hr style="margin-top: 10px;" />
						选项A：
						<input type="text" id="editA" name="choiceA"
							style="width: 220px;margin-left: 20px">
						<br> 选项B：
						<input type="text" id="editB" name="choiceB"
							style="width: 220px;margin-left: 20px">
						<br> 选项C：
						<input type="text" id="editC" name="choiceC"
							style="width: 220px;margin-left: 20px">
						<br> 选项D：
						<input type="text" id="editD" name="choiceD"
							style="width: 220px;margin-left: 20px">
						<br> 正确答案：
						<input type="text" id="editAnswer" name="standardAnswer"
							style="width: 220px;">
						<br> <br>
						<input type="hidden" name="id" id="id" />
						<input type="hidden" name="startPage" id="eStartPage" />
						<input type="hidden" name="currentPage" id="eCurrentPage" />
						<input type="hidden" name="pageSize" id="ePageSize" />
						<input type="submit" value="提交"
							style="background-color: #173e65;color: #FFFFFF;width: 70px;margin-left: 230px" />
					</form>
				</div>
			</div>


			<div>
				<form id="listForm" action="questionView.action" method="post">
					题目种类：
					<select name="conType_id">
						<option value=""></option>
						<c:forEach items="${conTypeList }" var="item" varStatus="status">
							<option value="${item.id }"
								<c:if test="${item.id == conTypeId }">selected</c:if>>${item.typeName }</option>
						</c:forEach>
					</select>
					题目类型：
					<select name="queType_id">
						<option value=""></option>
						<c:forEach items="${queTypeList }" var="item" varStatus="status">
							<option value="${item.id }"
								<c:if test="${item.id == queTypeId }">selected </c:if>>${item.typeName }</option>
						</c:forEach>
					</select>
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
			<div>
				<hr style="margin-top: 10px;" />
				<c:if test="${list!=null }">
					<table style="margin-top: 10px;width: 700px;text-align: center;"
						border="1">
						<tr class="question-title">
							<td>序号</td>
							<td>题目</td>
							<td>选项A</td>
							<td>选项B</td>
							<td>选项C</td>
							<td>选项D</td>
							<td>正确答案</td>
							<td>操作</td>
						</tr>
						<c:forEach items="${list }" var="item" varStatus="status">
							<tr>
								<td>${status.index+1 }</td>
								<td style="width: 250px">${item.questionContent }</td>
								<td>${item.choiceA }</td>
								<td>${item.choiceB }</td>
								<td>${item.choiceC }</td>
								<td>${item.choiceD }</td>
								<td>${item.standardAnswer }</td>

								<td class="question-deal"><a
										onclick="editQuestion('${item.id}')">编辑</a>| <a
										onclick="deleteQuestion('${item.id}','${item.questionContent }')">删除</a>
									<form id="deleteForm" action="delete.action" method="post">
										<input type="hidden" name="id" id="dQuestionId" />
										<input type="hidden" name="questionContent"
											id="dQuestionContent" />
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