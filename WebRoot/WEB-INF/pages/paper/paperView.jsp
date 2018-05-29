<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>试卷管理</title>
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
	function deletePaper(id, name) {
		if (window.confirm("你确定要删除 :" + name + "吗?\n删除试卷同时会删除其相关联数据信息！")) {
			var message = "{'id':'" + id + "'}";
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/paper/delete.action",
				contentType : 'application/json;charset=utf-8',
				data : message, //数据格式是JSON串
				success : function(data) { //返回JSON结果
					$("#dStartPage").val($("#startPage").val());
					$("#dCurrentPage").val($("#currentPage").val());
					$("#dPageSize").val($("#pageSize").val());
					$("#listForm").submit(); //提交表单
				}
			});
		}
	}
	function makePaper(id) {
		var message = "{'id':'" + id + "'}";
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/paperQuestion/create.action",
			contentType : 'application/json;charset=utf-8',
			data : message, //数据格式是JSON串
			success : function(data) { //返回JSON结果
				$("#Id").val(data["id"]);
				$("#paper_name").val(data["name"]);
				$("#single_c").text(data["singleChoiceCount"]);
				$("#single_v").text(data["singleChoiceValue"]);
				$("#multi_c").text(data["multiChoiceCount"]);
				$("#multi_v").text(data["multiChoiceValue"]);
				$("#blank_c").text(data["blankCount"]);
				$("#blank_v").text(data["blankValue"]);
				$("#judge_c").text(data["judgeCount"]);
				$("#judge_v").text(data["judgeValue"]);
				$("#description_c").text(data["descriptionCount"]);
				$("#description_v").text(data["descriptionValue"]);
				$(".mask").css("display", "block");

			}
		});
	}
	function cancelEdit() {
		$(".mask").css("display", "none");

	}
	function getPaperDetail(pap_id) {
		var url = "${pageContext.request.contextPath}/paperQuestion/getPaperDetail?pap_id=" + pap_id;
		window.open(url, "试卷详情", "scrollbars=yes");
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
				<a href="${pageContext.request.contextPath }/paper/paperView.action">管理试卷</a>
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
				<form action="paperView.action" method="post" id="listForm">
					所属考试：
					<select name="exam_id">
						<option></option>
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
			<div class="mask">
				<div class="c-create">
					<div
						style="background-color: #173e65;height: 20px;color: #fff;font-size: 12px;padding-left: 7px;">
						生成试卷
						<a style="float: right;padding-right: 10px;"
							onclick="cancelEdit()">X</a>
					</div>

					<form id="createForm" action="createPaper.action" method="post">
						试题类型：
						<select name="queType_id" id="queType_id">
							<c:forEach items="${conTypeList }" var="conType"
								varStatus="status">
								<option value="${conType.id }">${conType.typeName }</option>
							</c:forEach>
						</select>
						<br>
						试卷名称：
						<input id="paper_name" type="text" readonly="readonly">
						<br>
						<br>
						<table border="1" style="margin-left: 30px;">
							<tr>
								<th></th>
								<th>单选</th>
								<th>多选</th>
								<th>填空</th>
								<th>判断</th>
								<th>简答</th>
							</tr>
							<tr>
								<td>数量</td>
								<td id="single_c"></td>
								<td id="multi_c"></td>
								<td id="blank_c"></td>
								<td id="judge_c"></td>
								<td id="description_c"></td>
							</tr>
							<tr>
								<td>分值</td>
								<td id="single_v"></td>
								<td id="multi_v"></td>
								<td id="blank_v"></td>
								<td id="judge_v"></td>
								<td id="description_v"></td>
							</tr>
						</table>
						<br>
						<input type="hidden" name="pap_id" id="Id" />
						<input type="submit" value="生成"
							style="background-color: #173e65;color: #FFFFFF;width: 70px; margin-left: 150px;" />
					</form>
				</div>
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
								<td><a href="#" onclick="getPaperDetail('${item.id}')">${item.name }</a></td>
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
								<td class="question-deal"><a
										onclick="makePaper('${item.id}')">生成</a>| <a
										onclick="deletePaper('${item.id}','${item.name }')">删除</a>
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
				<div style="margin-top: 10px;">
					<a onclick="toPrePage()">上一页</a>
					<a onclick="toNextPage()">下一页</a>
					<p id="pageInfo"></p>
				</div>
			</div>
			<div>
				<c:if test="${createInfo!=null }">
					<b>${createInfo }</b>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>