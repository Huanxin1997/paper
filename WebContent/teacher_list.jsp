<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息</title>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/bootstrap-theme.min.css" rel="stylesheet" />
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
		submitForm("<%=context %>/SublistTeacherServlet?pageNum=1");
		return true;
	}
}

// 下一页
function nextPage(){
	if(currentPage == totalPage){
		alert("已经是最后一页数据");
		return false;
	}else{
		submitForm("<%=context %>/SublistTeacherServlet?pageNum=" + (currentPage+1));
		return true;
	}
}

// 上一页
function previousPage(){
	if(currentPage == 1){
		alert("已经是第一页数据");
		return false;
	}else{
		submitForm("<%=context %>/SublistTeacherServlet?pageNum=" + (currentPage-1));
		return true;
	}
}

// 尾页
function lastPage(){
	if(currentPage == totalPage){
		alert("已经是最后一页数据");
		return false;
	}else{
		submitForm("<%=context %>/SublistTeacherServlet?pageNum=${result.totalPage}");
		return true;
	}
}
</script>
<body onload="initPage();">
	<jsp:include page="jsp/common/super_header.jsp" />
	<div class="container" style="margin-top: 20px">
	<div class="row">
		<div class="col-md-5">
			<form action="SublistTeacherServlet" id="stuForm"  method="post">
				<div class="input-group col-lg-12" style="margin-top:0px positon:relative">
			       <input type="text" class="form-control"placeholder="请输入教师工作号"  name="name" id="stu_name" / >
			       <span class="input-group-btn">
			       		<button class="btn btn-success" type="submit">查找</button>
			       </span>
 				</div>
			</form>
		</div>
		<div class="col-md-1">
			<a href="regist.jsp" ><button class="btn btn-info btn-search">添加</button></a>
		</div>
		<div class="col-md-6">
		</div>
	</div>
		<br>
		<h3>教师信息列表：</h3><br>
		<br>
		<!-- 后台返回结果为空 -->
		<c:if test="${fn:length(result.dataList) eq 0 }">
		</c:if>
		
		<!-- 后台返回结果不为空 -->
			<table border="0.5px" cellspacing="0px" class="table table-striped" style="text-align: center">
				<thead>
					<tr height="30" style="text-align: center">
						<th style="text-align: center">工作号</th>
						<th style="text-align: center">姓名</th>
						<th style="text-align: center">课题数</th>
						<th style="text-align: center">学生数</th>
					</tr>
				</thead>
				<c:if test="${fn:length(result.dataList) gt 0 }">
					<c:forEach items="${result.dataList}" var="teacher">
						<tr>
							<td>${teacher.idnum}</td>
							<td>${teacher.name}</td>
							<td>${teacher.subjectNum}</td>
							<td>${teacher.studentNum}</td>
							<td>
						 		<a href="UpdateStudentServlet?name=${student.idnum}">
						 			<input type="button" class="btn btn-success" value="修改">
						 		</a>
						 		<a href="DelStudentServlet?name=<c:out value="${student.idnum}"></c:out>">	
						 			<input type="button" class="btn btn-danger" value="删除">
						 		</a>
						 		<a href="SublistPaperServlet?name=<c:out value="${student.idnum}"></c:out>">	
						 			<input type="button" class="btn btn-info" value="查看课题">
						 		</a>
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