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
        <div class="full-container" id="menu">
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
	                    <li><a href="main.jsp">
	                        <span class="glyphicon glyphicon-th"> 首页</span>
	                    </a></li>
	                    <li><a href="school.jsp">
	                        <span class="glyphicon glyphicon-screenshot"> 查看学校</span>
	                    </a></li>
	                    <li><a href="#">
	                        <span class="glyphicon glyphicon-briefcase"> 使用手册</span>
	                    </a></li>
	                </ul>
	                <ul class="nav navbar-nav navbar-right">
	                    <li><a data-toggle="modal" data-target="#login" href=""><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
	                </ul>
	            </div>
	        </nav>
	    </div>
	    <!-- 登录窗口 -->
    <div id="login" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <button class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-title">
                    <h1 class="text-center">登录</h1>
                </div>
                <div class="modal-body">
                    <form class="form-group" action="LoginServlet">
                        <div class="form-group">
                            <label for="">用户名</label>
                            <input class="form-control" type="text" id="idnum" name="idnum" placeholder="请输入账号">
                        </div>
                        <div class="form-group">
                            <label for="">密码</label>
                            <input class="form-control" type="password" id="password" name="password" placeholder="请输入密码">
                        </div>
                        <label class="radio-inline">
                            <input type="radio" name="role" id="role" value="Super"  checked> 管理员
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="role" id="role"  value="teacher"> 老师
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="role" id="role"  value="t_student"> 学生
                        </label><br>
                        <h2 style="color: red">${error }</h2>
                        <div class="text-right">
                            <button class="btn btn-primary" type="submit" id="btn-login">登录</button>
                            <button class="btn btn-danger" data-dismiss="modal">取消</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>