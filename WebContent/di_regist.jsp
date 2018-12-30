<%@page import="java.io.InputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提示信息</title>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/bootstrap-theme.css" rel="stylesheet" />
<script src="http://libs.baidu.com/jquery/2.1.4/jquery.js" type="text/javascript"></script>
<script type="text/javascript" href="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){ 
		var time=setInterval (showTime, 1000);
		var second=5;
		function showTime(){ 
			if(second==0){
				window.location="index.jsp";
				clearInterval(time);
			}
			$("#time").html('<font>'+second+'s</font> 后将跳转到学生列表页面。');
			second--;
		}
	}); 
</script>
<style type="text/css">
	.btn{
		width:120px;
		height:30px;
		background-color: #39abff;
		color:white;
		border-radius: 3px;
		outline: none
	}
</style>
</head>
<body>
	<%request.setCharacterEncoding("utf-8");%>
	<jsp:useBean id="user" class="com.bean.Student"></jsp:useBean>
	<jsp:setProperty property="*" name="user"></jsp:setProperty>
	<%
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/student?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false";
			String username = "root";
			String pwd = "hhh123456.";
			Connection conn = DriverManager.getConnection(url,username,pwd);
			String idnum = request.getParameter("idnum");
			String num = request.getParameter("name");
			String sclass = request.getParameter("sclass");
			String sql = "insert into t_student(idnum,name,gender,sclass,phone,address) values(?,?,?,?,?,?)";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getIdnum());
			ps.setString(2, user.getName());
			ps.setString(3, user.getGender());
			ps.setString(4, user.getSclass());
			ps.setString(5, user.getPhone());
			ps.setString(6, user.getAddress());
			int row = ps.executeUpdate();//执行更新操作，返回所影响的行数
			if(row > 0){
				%>
					<h1>添加学生成功</h1>
					<h3 style="color: red" id="time"></h3>
				<%
			}
			ps.close();
			conn.close();
		}catch(Exception e){
			%>
			<center>
				<h1 style="margin-top: 150px">增加学生信息失败</h1>
				<a href="regist.jsp"><input class="btn" type="button" value="重新填写"></a>
			</center>
		<%
			e.printStackTrace();
		}
	%>
</body>
</html>