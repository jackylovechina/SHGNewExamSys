<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>
	<form id="listForm" action="questionView.action" method="post">
		<select name="conType_id">
		<c:forEach items="${conTypeList }" var="item" varStatus="status">
			<option value="${item.id }" >${item.typeName }</option>
		</c:forEach>
		</select>
		<select name="queType_id">
		<c:forEach items="${queTypeList }" var="item" varStatus="status">
			<option value="${item.id }">${item.typeName }</option>
		</c:forEach>
		</select>
		 题目：<input type="text" name="questionContent" style="width: 120px"/>
		<input type="submit" value="搜索" style="background-color: #173e65;color: #FFFFFF;width: 70px;"/>
		<br/>
		<!-- 显示错误消息 -->
		<c:if test="${errorMsg }">
			<font color="red">${errorMsg }</font>
			<br/>
		</c:if>
		<input type="hidden" name="startPage" id="startPage" value="${startPage }"/>
		<input type="hidden" name="currentPage" id="currentPage" value="${currentPage }"/>
		<input type="hidden" name="pageSize" id="pageSize" value="${pageSize }"/>
		<input type="hidden" name="sumPageNumber" id="sumPageNumber" value="${sumPageNumber }"/>
		<input type="hidden" name="countNumber" id="countNumber" value="${countNumber }"/>
		
	</form>
</div>
<div>
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
					<td>${item.questionContent }</td>
					<td>${item.choiceA }</td>
					<td>${item.choiceB }</td>
					<td>${item.choiceC }</td>
					<td>${item.choiceD }</td>
					<td>${item.standardAnswer }</td>
					<td class="question-deal"><a>编辑</a>|<a>删除</a>
						<form id="deleteForm" action="delete.action" method="post">
							<input 
								type="hidden" name="id" id="dQuestionId" /> 
							<input
								type="hidden" name="startPage" id="dStartPage" /> 
							<input
								type="hidden" name="currentPage" id="dCurrentPage" /> 
							<input
								type="hidden" name="pageSize" id="dPageSize" />
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
	<a onclick="toPrePage()">上一页</a><a onclick="toNextPage()">下一页</a> 
	<input
		type="text" id="pageNumber" style="width: 50px;">
	<button onclick="toLocationPage()">Go</button>
	<dir id="pageInfo"></dir>
</div>

