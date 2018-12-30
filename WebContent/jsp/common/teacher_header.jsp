<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>网格系统</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="js/jquery-1.4.2.min.js">
	<link href="js/bootstrap.min.js">
    <style type="text/css">
        body{
            margin: 0 auto;
        }
    </style>
    <script type="text/javascript">
    	
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
                        <li><a href="teacher.jsp">首页</a></li>
                        <li><a href="addSubject.jsp?teacher=${welcome }">课题发布</a>
                        </li>
                        <li class="dropdown">
                        	<a class="dropdown-toggle" data-toggle="dropdown">查看论文
                        		<b class="caret"></b>
                        	</a>
                        	<ul class="dropdown-menu">
                        		<li><a href="SublistPaperServlet?teacher=${name}">全部论文</a></li>
                        		<li><a href="SublistPaperServlet?teacher=${name}">批改论文</a></li>
                        	</ul>
                        </li>
                        <li class="dropdown">
                        	<a onclick="updateMessage();">修改信息</a>
                        </li>
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