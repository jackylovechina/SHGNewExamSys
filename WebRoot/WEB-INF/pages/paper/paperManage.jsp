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
	function sumScore() {
		var singleChoiceCount = $("#singleChoiceCount").val();
		var singleChoiceValue = $("#singleChoiceValue").val();
		var multiChoiceCount = $("#multiChoiceCount").val();
		var multiChoiceValue = $("#multiChoiceValue").val();
		var blankCount = $("#blankCount").val();
		var blankValue = $("#blankValue").val();
		var judgeCount = $("#judgeCount").val();
		var judgeValue = $("#judgeValue").val();
		var descriptionCount = $("#descriptionCount").val();
		var descriptionValue = $("#descriptionValue").val();
		var sumScore = Number(singleChoiceCount)*Number(singleChoiceValue) 
			+ Number(multiChoiceCount)*Number(multiChoiceValue)
			+ Number(blankCount)*Number(blankValue)
			+ Number(judgeCount)*Number(judgeValue)
			+ Number(descriptionCount)*Number(descriptionValue);
		$("#totalScore").val(sumScore);

	}
	function checkAdd() {
		if ($("#examId").val() == null || $("#examId").val() == "") {
			alert("考试名不能为空");
			return false;
		}
		if ($("#examName").val() == null || $("#examName").val() == "") {
			alert("试卷名不能为空");
			return false;
		}
		var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
		if ($("#singleChoiceCount").val() == null || $("#singleChoiceCount").val() == "") {
			alert("单选数量不能为空");
			return false;
		}
		if ($("#singleChoiceValue").val() == null || $("#singleChoiceValue").val() == "") {
			alert("单选分值不能为空");
			return false;
		}
		if ($("#multiChoiceCount").val() == null || $("#multiChoiceCount").val() == "") {
			alert("多选数量不能为空");
			return false;
		}
		if ($("#multiChoiceValue").val() == null || $("#multiChoiceValue").val() == "") {
			alert("多选分值不能为空");
			return false;
		}
		if ($("#blankCount").val() == null || $("#blankCount").val() == "") {
			alert("填空数量不能为空");
			return false;
		}
		if ($("#blankValue").val() == null || $("#blankValue").val() == "") {
			alert("填空分值不能为空");
			return false;
		}
		if ($("#judgeCount").val() == null || $("#judgeCount").val() == "") {
			alert("判断数量不能为空");
			return false;
		}
		if ($("#judgeValue").val() == null || $("#judgeValue").val() == "") {
			alert("判断分值不能为空");
			return false;
		}
		if ($("#descriptionCount").val() == null || $("#descriptionCount").val() == "") {
			alert("简答数量不能为空");
			return false;
		}
		if ($("#descriptionValue").val() == null || $("#descriptionValue").val() == "") {
			alert("简答分值不能为空");
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
			<div class="left-title">
				<a
					href="${pageContext.request.contextPath }/paper/paperManage.action">添加试卷</a>
			</div>
			<div class="left-title">
				<a>管理试卷</a>
			</div>
		</div>
		<div id="right">
			<%-- <%@ include file="import.jsp" %> --%>
			<div>
				<p>
					<b>添加试卷</b>
				</p>
				<hr style="margin-top: 10px;" />
			</div>
			<div>
				<form action="addPaper.action" onsubmit="return checkAdd()"
					onchange="sumScore()">
					所属考试：
					<select name="exam_id" id="examId">
						<c:if test="${examList!=null }">
							<c:forEach items="${examList }" var="item" varStatus="status">
								<option value="${item.id }">${item.examName }</option>
							</c:forEach>
						</c:if>
					</select>
					试卷名称：
					<input name="name" type="text" id="examName">
					<br>
					<br>
					<table border="1">
						<tr>
							<th>题型</th>
							<th>数量</th>
							<th>分值</th>
						</tr>
						<tr>
							<td>单项选择题</td>
							<td><input name="" type="number" id="singleChoiceCount"></td>
							<td><input name="" type="number" id="singleChoiceValue"></td>
						</tr>
						<tr>
							<td>多项选择题</td>
							<td><input name="" type="number" id="multiChoiceCount"></td>
							<td><input name="" type="number" id="multiChoiceValue"></td>
						</tr>
						<tr>
							<td>填空题</td>
							<td><input name="" type="number" id="blankCount"></td>
							<td><input name="" type="number" id="blankValue"></td>
						</tr>
						<tr>
							<td>判断题</td>
							<td><input name="" type="number" id="judgeCount"></td>
							<td><input name="" type="number" id="judgeValue"></td>
						</tr>
						<tr>
							<td>简答题</td>
							<td><input name="" type="number" id="descriptionCount"></td>
							<td><input name="" type="number" id="descriptionValue"></td>
						</tr>
					</table>
					<p style="color: red;">提示：填写完成点击空白处即可出现总分计算结果！</p>
					总分：
					<textarea rows="1" cols="2" readonly="readonly" id="totalScore"
						name="totalScore"></textarea>
					<input type="submit"
						style="width: 150px;margin-left: 170px;background-color: #66ffcc">
				</form>
				<hr style="margin-top: 10px;" />
				<hr style="margin-top: 10px;" />
			</div>
		</div>

	</div>


</body>
</html>