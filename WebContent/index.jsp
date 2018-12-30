<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%
		// 获取请求的上下文
		String context = request.getContextPath();
	%>
	<title>学生信息</title>
	<link href="css/bootstrap.min.css" rel="stylesheet" />
	<link href="css/bootstrap-theme.css" rel="stylesheet" />
	<script src="http://libs.baidu.com/jquery/2.1.4/jquery.js" type="text/javascript"></script>
	<script type="text/javascript" href="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
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
			submitForm("<%=context %>/SublistServlet?pageNum=1");
			return true;
		}
	}
	
	// 下一页
	function nextPage(){
		if(currentPage == totalPage){
			alert("已经是最后一页数据");
			return false;
		}else{
			submitForm("<%=context %>/SublistServlet?pageNum=" + (currentPage+1));
			return true;
		}
	}
	
	// 上一页
	function previousPage(){
		if(currentPage == 1){
			alert("已经是第一页数据");
			return false;
		}else{
			submitForm("<%=context %>/SublistServlet?pageNum=" + (currentPage-1));
			return true;
		}
	}
	
	// 尾页
	function lastPage(){
		if(currentPage == totalPage){
			alert("已经是最后一页数据");
			return false;
		}else{
			submitForm("<%=context %>/SublistServlet?pageNum=${result.totalPage}");
			return true;
		}
	}
	</script>
	<script type="text/javascript">
		$(function(){
			$("tbody>tr").mouseover(function(){
				$(this).addClass("selected")
			});
			$("tbody>tr").mouseout(function(){
				$(this).removeClass("selected")
			});
		})
		
	</script>
	<script type="text/javascript">
		function openAddModal(obj) {
			$("#myModal").modal('show');
			//获取当前点击行的id
			var $td = $(obj).parents('tr').children('td');
			var id = $td.eq(0).text();
			var name = $td.eq(1).text();
			var address = $td.eq(3).text();
			$("#idnum").append(id);
			$("#name").append(name);//将获取的该行的id值填充到模态框的文框中，文本框的ID为itemmodalid，其他的数据也是如此处理
		}
		function deleteTr(obj){
		    $(obj).parent().parent().remove();
		}
	</script>
	<style type="text/css">
		.selected{
			background: #ffe0e0
		}
	</style>
</head>
<body onload="initPage();">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel">修改学生</h4>
	            </div>
	            <div class="modal-body">
	            	<label id="idnum" class="form-control">学号：</label>
	            	<label id="name" class="form-control">姓名：</label>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-success" data-dismiss="modal">关闭</button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div>  <!-- /.modal -->
	</div>
	<jsp:include page="jsp/common/super_header.jsp" />
	<div class="full-container" style="margin-top: 20px">
	<div class="row">
		<div class="col-md-5">
			<form action="SublistServlet" id="stuForm"  method="post">
				<div class="input-group col-lg-12" style="margin-top:0px positon:relative">
			       <input type="text" class="form-control"placeholder="请输入学号"  name="name" id="stu_name" / >
			       <span class="input-group-btn">
			       		<button class="btn btn-success" type="submit">查找</button>
			       </span>
 				</div>
			</form>
		</div>
		<div class="col-md-1">
			<a data-toggle="modal" data-target="#add" class="btn btn-info "><span class="glyphicon glyphicon-log-in" ></span> 增加学生</a>
		</div>
		<div class="col-md-6">
		</div>
	</div>
		<br>
		学生信息列表：<br>
		<br>
		<!-- 后台返回结果为空 -->
		<c:if test="${fn:length(result.dataList) eq 0 }">
		</c:if>
		
		<!-- 后台返回结果不为空 -->
			<table border="0.5px" cellspacing="0px" class="table" style="text-align: center">
				<thead>
					<tr height="30" style="text-align: center">
						<th style="text-align: center">学号</th>
						<th style="text-align: center">姓名</th>
						<th style="text-align: center">性别</th>
						<th style="text-align: center">班级</th>
						<th style="text-align: center">手机</th>
						<th style="text-align: center">地址</th>
						<th style="text-align: center">操作</th>
					</tr>
				</thead>
				<c:if test="${fn:length(result.dataList) gt 0 }">
				<tbody>
					<c:forEach items="${result.dataList}" var="student">
						<tr>
							<td><c:out value="${student.idnum}"></c:out></td>
							<td><c:out value="${student.name}"></c:out></td>
							<td><c:out value="${student.gender}"></c:out></td>
							<td><c:out value="${student.sclass}"></c:out></td>
							<td><c:out value="${student.phone}"></c:out></td>
							<td><c:out value="${student.address}"></c:out></td>
							<td>
						 		<input type="button" class="btn btn-success" id="update" value="修改" onclick="openAddModal(this)">
						 		<!-- <a href="DelStudentServlet?name=<c:out value="${student.idnum}"></c:out>">	
						 			<input type="button" class="btn btn-danger" id="delete" value="删除">
						 		</a> -->	
						 		<input type="button" class="btn btn-danger" id="delete" value="删除" onclick="deleteTr(this);">
						 		<a href="SublistPaperServlet?idnum=<c:out value="${student.idnum}"></c:out>">	
						 			<input type="button" class="btn btn-info" value="查看论文">
						 		</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br> 共${result.totalRecord }条记录共${result.totalPage }页&nbsp;&nbsp;当前第${result.currentPage }页&nbsp;&nbsp;
			<a href="#" onclick="firstPage();">首页</a>&nbsp;&nbsp; 
			<a href="#" onclick="previousPage();">上一页</a>&nbsp;&nbsp;
			<a href="#" onclick="nextPage();">下一页</a>&nbsp;&nbsp; 
			<a href="#" onblur="lastPage();">尾页</a>	
		</c:if>
	</div>
	
	<!--增加学生模态框-->
	 <div id="add" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <button class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-title">
                    <h1 class="text-center">增加学生</h1>
                </div>
		        <div class="modal-body">
		            <form class="form-signin" action="di_regist.jsp" method="post" onsubmit="return check(this)>
		
		                <label for="" style="font-weight:bold">学号</label>
		                <input type="text" name="idnum" id="idnum" class="form-control" placeholder="请输入学号" required autofocus><br>
		                <label for="">姓名</label>
		                <input type="text" name="name" id="name" class="form-control" placeholder="请输入姓名" required maxLength="10"><br>
		                <label for="">性别</label>
						<input type="text" name="gender" id="gender" class="form-control"placeholder="请输入性别" required maxLength="1"><br> 
		                <label for="">班级</label>
		                <input type="text" name="sclass" id="sclass" class="form-control" placeholder="输入所在班级，如：16软件01" required maxLength="16"><br>
		                <label for="">联系方式</label>
		                <input type="text" name="phone" id="phone" class="form-control" placeholder="输入联系方式" required maxLength="11"><br>
		                <label for="">地址</label>
		                <input type="text" name="address" id="address" class="form-control" placeholder="输入地址" required maxLength="40"><br><br><br>
		                <input type="submit" class="btn btn-primary" id="btn-reg" value="提交">
		                <a href="index.jsp" class="btn btn-default" id="btn-reg">返回登录</a>
		            </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>