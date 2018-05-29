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
</script>
</head>

<body class="allbody">
	<h1>试卷预览</h1>
	<c:if test="${papQuestionInfo!=null }">
		<h2>${papQuestionInfo }</h2>
	</c:if>
	<c:if test="${singleList!=null }">
		<h3>一、单项选择题</h3>
		<c:forEach items="${singleList }" var="item" varStatus="status">
			<p>${status.index+1 },${item.questionContent}</p>
			<table>
				<tr>
					<td>A、${item.choiceA }</td>
					<td>B、${item.choiceB }</td>
				</tr>
				<tr>
					<td>C、${item.choiceC }</td>
					<td>D、${item.choiceD }</td>
				</tr>
			</table>
			<p>正确答案：${item.standardAnswer }</p>
		</c:forEach>
	</c:if>
	<c:if test="${multiList!=null }">
		<h3>二、多项选择题</h3>
		<c:forEach items="${multiList }" var="item" varStatus="status">
			<p>${status.index+1 },${item.questionContent}</p>
			<table>
				<tr>
					<td>A、${item.choiceA }</td>
					<td>B、${item.choiceB }</td>
				</tr>
				<tr>
					<td>C、${item.choiceC }</td>
					<td>D、${item.choiceD }</td>
				</tr>
			</table>
			<p>正确答案：${item.standardAnswer }</p>
		</c:forEach>
	</c:if>
	<c:if test="${blankList!=null }">
		<h3>三、填空题</h3>
		<c:forEach items="${blankList }" var="item" varStatus="status">
			<p>${status.index+1 },${item.questionContent}</p>
			<p>正确答案：${item.standardAnswer }</p>
		</c:forEach>
	</c:if>
	<c:if test="${judgeList!=null }">
		<h3>四、判断题</h3>
		<c:forEach items="${judgeList }" var="item" varStatus="status">
			<p>${status.index+1 },${item.questionContent}</p>
			<p>正确答案：${item.standardAnswer }</p>
		</c:forEach>
	</c:if>
	<c:if test="${descripList!=null }">
		<h3>五、简答题</h3>
		<c:forEach items="${descripList }" var="item" varStatus="status">
			<p>${status.index+1 },${item.questionContent}</p>
			<p>正确答案：${item.standardAnswer }</p>
		</c:forEach>
	</c:if>

</body>
</html>