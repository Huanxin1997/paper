<%@page import="com.bean.Paper"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>批改论文</title>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/bootstrap-theme.min.css" rel="stylesheet" />
<script src="http://libs.baidu.com/jquery/2.1.4/jquery.js" type="text/javascript"></script>
<script type="text/javascript" href="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<%
	// 获取请求的上下文
	String context = request.getContextPath();
%>
<script type="text/javascript">
	function update(obj){
		var rows = obj.parentNode.parentNode.rowIndex;
		var r = $("#paper tr:eq("+rows+") td:eq(5)").html();
		if(r > 0){
			if(r > 0.3){
				alert("查重不合格，系统自动评定0分");
			}else{
				var serial = $("#paper tr:eq("+rows+") td:eq(0)").text();
				var idnum = $("#paper tr:eq("+rows+") td:eq(1)").text();
				var author = $("#paper tr:eq("+rows+") td:eq(2)").text();
				var title = $("#paper tr:eq("+rows+") td:eq(3)").text();
				var url = 'giveScore.jsp?serial='+serial+'&idnum='+idnum+'&author='+author+'&title='+title;
				window.location.href=url;
			}	
		}else{
			alert("暂未查重！您没有权限");
		}	
	}
	
	
	
</script>
</head>
<body>
	<jsp:include page="jsp/common/teacher_header.jsp" />
	<div class="container" style="margin-top: 20px">
	<div class="row">
		<div class="col-md-5">
		</div>
	</div>
		
		<h2>论文信息列表：</h2>
		
		<!-- 后台返回结果为空 -->
		<c:if test="${fn:length(result.dataList) eq 0 }">
			<span style="color: red">暂无可查阅的论文</span>
		</c:if>
		
		<!-- 后台返回结果不为空 -->
			<table border="0.5px" cellspacing="0px" class="table table-striped" id="paper">
				<thead>
					<tr height="30" >
						<th>流水号</th>
						<th>学号</th>
						<th>姓名</th>
						<th>题目</th>
						<th>课题</th>
						<th>重复率</th>
						<th>分数</th>
						<th>操作</th>
					</tr>
				</thead>
				<c:if test="${fn:length(result.dataList) gt 0 }">
					<c:forEach items="${result.dataList}" var="paper">
						<tr>
							<td>${paper.serial}</td>
							<td>${paper.idnum}</td>
							<td>${paper.author}</td>
							<td>${paper.title}</td>
							<td>${paper.subject}</td>
							<td>${paper.repetition_rate}</td>
							<td>${paper.score}</td>
							<td>
						 		<a href="DownloadPaperServlet?name=<c:out value="${paper.idnum}"></c:out>">	
						 			<input type="button" class="btn btn-success" value="下载" >
						 		</a>
						 		<a id="check" class="btn btn-info" onclick="update(this)">评分</a>
							</td>
						</tr>
					</c:forEach>
			</table>
		</c:if>
	</div>
	<div id="modal-container" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">
			标题栏
			</h3>
		</div>
		<div class="modal-body">
			<p>显示信息</p>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button> <button class="btn btn-primary">保存设置</button>
		</div>
	</div>
</body>
</html>