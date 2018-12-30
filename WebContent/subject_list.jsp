<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课题信息</title>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/bootstrap-theme.min.css" rel="stylesheet" />
<link href="js/jquery-1.4.2.min.js">
<link href="js/bootstrap.min.js">
<%
	// 获取请求的上下文
	String context = request.getContextPath();
%>
<script type="text/javascript">
// 当前第几页数据
var currentPage = ${result.currentPage};

// 总页数
var totalPage = ${result.totalPage};

function submitForm(actionUrl){
	var formElement = document.getElementById("stuForm");
	formElement.action = actionUrl;
	formElement.submit();
}

// 第一页
function firstPage(){
	if(currentPage == 1){
		alert("已经是第一页数据");
		return false;
	}else{
		submitForm("<%=context %>/SublistSubjectServlet?pageNum=1");
		return true;
	}
}

// 下一页
function nextPage(){
	if(currentPage == totalPage){
		alert("已经是最后一页数据");
		return false;
	}else{
		submitForm("<%=context %>/SublistSubjectServlet?pageNum=" + (currentPage+1));
		return true;
	}
}

// 上一页
function previousPage(){
	if(currentPage == 1){
		alert("已经是第一页数据");
		return false;
	}else{
		submitForm("<%=context %>/SublistSubjectServlet?pageNum=" + (currentPage-1));
		return true;
	}
}
// 尾页
function lastPage(){
	if(currentPage == totalPage){
		alert("已经是最后一页数据");
		return false;
	}else{
		submitForm("<%=context %>/SublistSubjectServlet?pageNum=${result.totalPage}");
		return true;
	}
}
</script>
</head>
<body onload="initPage();">
<%request.setCharacterEncoding("utf-8"); %>
	<jsp:include page="jsp/common/student_header.jsp" />
	<div class="container" style="margin-top: 20px">
	<div class="row">
		<div class="col-md-5">
			<form action="SublistSubjectServlet" id="stuForm"  method="post">
				<div class="input-group col-lg-12" style="margin-top:0px positon:relative">
			       <input type="text" class="form-control"placeholder="请输入老师姓名"  name="teacher" id="teacher" / >
			       <span class="input-group-btn">
			       		<button class="btn btn-success" type="submit">查找</button>
			       		<a href="teacherShow.jsp" class="btn btn-failure">查看教师简介</a>
			       </span>
 				</div>
			</form>
		</div>
	</div>
		<span style="color: red;font-weight: bold">${success }</span>
		<h3>课题信息列表：</h3>
		<!-- 后台返回结果为空 -->
		
		<!-- 后台返回结果不为空 -->
			<table border="0.5px" cellspacing="0px" class="table table-striped">
				<thead>
					<tr height="30" >
						<th>课题名称</th>
						<th>指导老师</th>
						<th>学生数</th>
						<th>截止日期</th>
						<th>操作</th>
					</tr>
				</thead>
				<c:if test="${fn:length(result.dataList) gt 0 }">
					<c:forEach items="${result.dataList}" var="subject">
						<tr>
							<td>${subject.name}</td>
							<td>${subject.teacherName}</td>
							<td>${subject.studentNum}</td>
							<td>${subject.limit}</td>
							<td>
						 		<a href="AddSubjectServlet?method=student&idnum=${idnum }&subject=${subject.name }&teacher=${subject.teacherName }" class="btn btn-success">选择</a>
						 		<a href="addPaper.jsp?teacher=${subject.teacherName }&subject=${subject.name}" class="btn btn-info">提交</a>
							</td>
						</tr>
					</c:forEach>
			</table>
			<br> 共${result.totalRecord }条记录共${result.totalPage }页&nbsp;&nbsp;当前第${result.currentPage }页&nbsp;&nbsp;
			<a href="#" onclick="firstPage();">首页</a>&nbsp;&nbsp; 
			<a href="#" onclick="previousPage();">上一页</a>&nbsp;&nbsp;
			<a href="#" onclick="nextPage();">下一页</a>&nbsp;&nbsp; 
			<a href="#" onblur="lastPage();">尾页</a>	
		</c:if>
	</div>
	
</body>
</html>