<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>网格系统</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" />
    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.js" type="text/javascript"></script>
	<script type="text/javascript" href="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style type="text/css">
    	.another{
    		background: #666;
    		color: black
    	}
    	#navbar-menu li{
    		color: black
    	}
    </style>
    <script type="text/javascript">
    	$(function(){
    		$("li").mouseover(function(){
    			$(this).addClass("another");
    		})
    		$("li").mouseout(function(){
    			$(this).removeClass("another");
    		})
    	})
    </script>
    </head>
    <body>
    	<div class="full-container">
	            <nav class="navbar navbar-inverse">
	                <!-- Brand and toggle get grouped for better mobile display -->
	                <div class="navbar-header">
	                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-menu" aria-expanded="false">
	                        <span class="sr-only">Toggle navigation</span>
	                        <span class="icon-bar"></span>
	                        <span class="icon-bar"></span>
	                        <span class="icon-bar"></span>
	                    </button>
	                </div>
	                <div id="navbar-menu" class="collapse navbar-collapse">
	                    <ul class="nav navbar-nav">
	                        <li><a href="super.jsp">首页</a></li>
	                        <li><a href="SublistServlet">学生信息</a></li>
	                        <li><a href="SublistTeacherServlet">老师信息</a></li>
	                        <li><a href="SublistPaperServlet">论文查重</a></li>
	                    </ul>
	                    <ul style="float:right" class="nav navbar-nav">
		                    <li>
		                    	<a href="main.jsp">退出登录</a>
		                    </li>
	                    </ul>
	                </div>
	            </nav>
	        </div>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>