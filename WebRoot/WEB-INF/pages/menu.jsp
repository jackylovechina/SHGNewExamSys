<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div id="menuContent" style="background-color: #1e76cf;color: #ffffff;height: 120px" >
	<h1 style="margin-left: 10px;margin-top: 10px;">
		<a >山船考试培训系统</a>
	</h1><br/>
	<div class="topview" style="margin-left: 10px;margin-bottom: 10px;">
	<a href="${pageContext.request.contextPath }/exam/examManage.action">考试管理</a>
 	<a href="${pageContext.request.contextPath }/question/questionManage.action">试题管理</a>
 	<a>基础数据</a>
 	<a>用户设置</a>
	</div>
	
</div>
<div style="border-bottom-color: #cccccc">
	<span style="margin-left: 10px;">欢迎您 ， ${sessionScope.user.name }</span>

</div>