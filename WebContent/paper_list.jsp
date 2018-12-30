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
	<script src="http://libs.baidu.com/jquery/2.1.4/jquery.js" type="text/javascript"></script>
	<script href="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" ></script>
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
		function openAddModal(obj) {			
			//获取当前点击行的id
			//清空之前模态框内容
			$(".text").empty();
			var $td = $(obj).parents('tr').children('td');
			var serial = $td.eq(0).text();
			var idnum = $td.eq(1).text();
			var author = $td.eq(2).text();
			var subject = $td.eq(3).text();
			var title = $td.eq(4).text();
			var teacher = $td.eq(5).text();
			//检查是否已经查重
			if(($td.eq(6).text()).length>0){
				alert("已查重！请勿重复操作");
			}
			else{
				$("#serial").append(serial); 
				$("#idnum").append(idnum);
				$("#author").append(author);
				$("#subject").append(subject);
				$("#title").append(title);
				$("#teacher").append(teacher);
				//弹出模态框
				$("#myModal").modal('show');	
			}
		}
	</script>
	<script type="text/javascript">
		function check(obj){
			//$("#repetition").click(function(){

				var serial = $("#serial").val();
				var repetition = $("#rep").val();

				$.ajax({
					type: 'POST',
					url: 'RepetitionServlet',
					data: {
						serial: serial,
						repetition: repetition
					},
					success:function(message){
						alert(message);
						window.location.reload();
					}
				})
			//})
		}
	</script>
	<style type="text/css">
		#repModal{
			font-size: 16px;
			font-weight: bold
		}
		.text{
			margin-bottom:15px
		}
	</style>
</head>
<body onload="initPage();">
	<jsp:include page="jsp/common/super_header.jsp" />
	<div class="full-container" style="margin-top: 20px">
	<div class="row">
		<div class="col-md-5">
			<form action="SublistPaperServlet" id="stuForm"  method="post">
				<div class="input-group col-lg-12" style="margin-top:0px positon:relative">
			       <input type="text" class="form-control"placeholder="请输入学生学号"  name="idnum" id="stu_name" / >
			       <span class="input-group-btn">
			       		<button class="btn btn-success" type="submit">查找</button>
			       </span>
 				</div>
			</form>
		</div>
		<div class="col-md-6">
		</div>
	</div>
		<br>
		<!-- 后台返回结果为空 -->
		<c:if test="${fn:length(result.dataList) eq 0 }">
		</c:if>
		
		<!-- 后台返回结果不为空 -->
			<table border="0.5px" cellspacing="0px" class="table table-striped" style="text-align: center">
				<thead>
					<tr height="30" style="text-align: center">
						<th style="text-align: center">流水号</th>
						<th style="text-align: center">学号</th>
						<th style="text-align: center">姓名</th>
						<th style="text-align: center">课题</th>
						<th style="text-align: center">题目</th>
						<th style="text-align: center">指导老师</th>
						<th style="text-align: center">重复率</th>
						<th style="text-align: center">操作</th>
					</tr>
				</thead>
				<c:if test="${fn:length(result.dataList) gt 0 }">
					<c:forEach items="${result.dataList}" var="paper">
						<tr>
							<td>${paper.serial}</td>
							<td>${paper.idnum}</td>
							<td>${paper.author}</td>
							<td>${paper.subject}</td>
							<td>${paper.title}</td>
							<td>${paper.teacher}</td>
							<td>${paper.repetition_rate}</td>
							<td>
						 		<input type="button" class="btn btn-info" id="repetition" onclick="openAddModal(this)" value="查重">
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
	
	<!-- 修改查重结果模态框 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <form class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel">论文信息</h4>
	            </div>
	            <div class="modal-body" id="repModal">
	            	<div id="serial"></div>
	            	<br>
	            	作者：<div id="author" class="text form-control"></div>
	            	学号：<div id="idnum" class="text form-control"></div>
	            	题目：<div id="title" class="text form-control"></div>
	            	课题：<div id="subject" class="text form-control"></div>
	            	指导老师：<div id="teacher" class="text form-control"></div>
	            	<br>
	                <div>查重结果：</div>
	                <input type="number" class="form-control" oninput="if(value>1.0)value=1.0;if(value<0.0)value=0.0" id="rep" required><br>
	            </div>
	            <div class="modal-footer">
	            	<button type="submit" class="btn btn-info" id="repetition" onclick="check(this);">查重</button>
	                <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
	            </div>
	        </form><!-- /.modal-content -->
	    </div>  <!-- /.modal -->
	</div>
</body>
</html>