<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>管理员-首页</title>
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
        .row{
        	margin-top: 20px
        }
        img{
        	margin-top:-20px
        }
        .picture{
        	background: url(Images/test.jpg) no-repeat;
		    background-size: 100% auto;
		    filter: brightness(.5);
		    height: auto;
		    min-height: 260px;
		    margin-bottom: 10px;
		    position: absolute;
		    width: 100%;
        }
    </style>
    <body>
        <jsp:include page="jsp/common/super_header.jsp"></jsp:include>
        <div class="picture"></div><img alt="" src="Images/teat.jpg" width="100%">
        <div id="container" class="row" >
            <div class="col-md-3" style="border-top: 3px solid red">
                <center>
                    <ul class="nav nav-tabs nav-stacked">
                        <li><img src="Images/avator.png" width="120px" style="margin-top: 40px"></li>
                        <h2>${welcome}</h2>
                        <li>上次登录时间：</li>
                        <li>${time }</li>
                        <li>创建时间：</li>
                        <li>2018年11月26日 21:38:06</li>
                    </ul>    
                </center>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-8" style="border: 1px solid #666;height:250px">
                更多功能正在开发中
            </div>
        </div>


        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
