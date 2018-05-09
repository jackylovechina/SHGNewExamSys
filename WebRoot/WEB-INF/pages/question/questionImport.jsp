<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<form action="fileImport.action" method="post" name="question"
	enctype="multipart/form-data">
	<select name="conType_id"
		style="width:190px;height: 26px;margin-top:8px;margin-left: 10px;">
		<c:forEach items="${conTypeList }" var="contentType"
			varStatus="status">
			<option value="${contentType.id }">${contentType.typeName }</option>
		</c:forEach>
	</select> <select name="queType_id"
		style="width:190px;height: 26px;margin-top:8px;margin-left: 10px;">
		<c:forEach items="${queTypeList }" var="questionType"
			varStatus="status">
			<option value="${questionType.id }">${questionType.typeName }</option>
		</c:forEach>
	</select> <br>
	<br> <font style="margin-left: 10px;">选择题库文件：</font> 
	<input type="file" name="excelFile"> 
	<input type="submit" value="批量添加" style="background-color: #99ffff"> <br>
	<c:if test="${importMsg!=null }">
		<font style="margin-left: 10px">${importMsg }</font>
	</c:if>

</form>