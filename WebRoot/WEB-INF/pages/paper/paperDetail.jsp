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
	<c:if test="${paperList!=null }">
		<c:forEach items="${paperList }" var="item" varStatus="status">
			<p>${item.id }</p>
		</c:forEach>
	</c:if>

</body>
</html>