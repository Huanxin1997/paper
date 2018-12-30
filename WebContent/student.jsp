<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>学生-首页</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" />
    <style type="text/css">
        .btn{
        	width: 150px;
        	height:150px;
        	background: #eee;
        	border: 1px solid #666
        }
        .bg{
        	background: url(/Images/bg.jpg) no-repeat;
		    background-size: 100% auto;
		    filter: brightness(.5);
		    height: auto;
		    min-height: 260px;
		    margin-bottom: 10px;
		    position: absolute;
		    width: 100%;
        }
        .picture{
        	background: url(Images/test.jpg) no-repeat;
		    background-size: 100% auto;
		    margin-top: -20px;
		    filter: brightness(.5);
		    height: auto;
		    min-height: 260px;
		    margin-bottom: 10px;
		    position: absolute;
		    width: 100%;
        }
        .showID{
        	height: 250px;
        	width: 100%;
        	color: white
        }
        .card{
        	width: 250px;
        	height: 150px;
        	margin-top: 18px;
        	color:#000000;
        	border-radius: 15px;
        	background: white;
        }
        .title{
        	width: 65%;
        	margin: 0 auto;
        	font-weight: bold
        	
        }
    </style>
    </head>
    <body>
        <jsp:include page="jsp/common/student_header.jsp"></jsp:include>
        <div class="picture"></div>
	        <div class="showID">
	        	<div class="row">
	        		<div class="col-md-8 col-sm-6 title">
	        			<div class="title">
	        				<h2>I·论文评价管理系统</h2>
	        				<h4>I·论文评价管理系统(I.Paper Evaluation Management System)，开发于2018年。平台提供论文课题发布、论文提交、论文评分、论文查重等功能，使用对象为在校学生和教师，暂时是一个实验平台，不提供真实使用</h4>
	        			</div>
	        		</div>
	        		<div class="col-md-4 col-sm-6">
	        			<div class="card">
	        				<div style="padding:20px 20px">
	        					<h3 style="font-weight: bold">${name }</h3>
	        					<h5 style="font-weight: bold">角色：学生</h5>
	        				</div>
	        				<div style="margin:-90px 20px"><img alt="" src="Images/avator.png" width="90px" style="border-radius: 50%;float: right"> </div>
	        			</div>
	        		</div>
	        	</div>
	        </div>
  
        <div id="container" class="row">
        	<div class="col-md-1"></div>
            <div class="col-md-2" style="border-top: 3px solid red">
                
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-7" style="border: 2px solid #a59e9e;height:250px;border-radius: 10px">
                更多功能正在开发中
            </div>
            <div class="col-md-1"></div>
        </div>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>