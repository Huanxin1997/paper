<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>教师-首页</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" />
   	<script src="http://libs.baidu.com/jquery/2.1.4/jquery.js" type="text/javascript"></script>
	<script type="text/javascript" href="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
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
        .task li{
        	width: 100%;
        	position: relative;
        	border: 1px solid #666;
        	border-top: none;
        	height: 60px;
        	padding:18px;
			list-style-type:none;
        }
        .task{
        	border-radius: 15px
        }
        .logo{
        	font-size: 20px
        }
        #container a{
        	font-weight: bold
        }
        
    </style>
    <script type="text/javascript">
    	$(function(){
    		//限制字符个数
    	    $(".task a").each(function(){
    	        var maxwidth=10;
    	        if($(this).text().length>maxwidth){
    	            $(this).text($(this).text().substring(0,maxwidth));
    	            $(this).html($(this).html()+'...');
    	        }
    	    });
    		
    		//鼠标悬停出现整个题目
    	    $(".task a").mouseover(function (e) {
                var Mytitle = $(this).html();//获取超链接 title属性的内容
                //设置 title属性内容为空
                
                $("body").append("<div id='div_toop' style='background:#eee;border:1px solid #666'>" + Mytitle + "</div>");//将要显示的内容添加到 新建 div标签中 并追加到 body 中
                $("#div_toop")
                    .css({
                        "top": (e.pageY + 10) + "px",
                        "position": "absolute",
                        "left": (e.pageX + 20) + "px"
                    }).show("fast");
            }).mouseout(function () {
                this.title = this.Mytitle;
                $("#div_toop").remove();//移除对象
            }).mousemove(function (e) { 
                $("#div_toop")
                    .css({
                        //设置 div 内容位置 
                        "top": (e.pageY + 10) + "px",
                        "position": "absolute",//添加绝对位置
                        "left": (e.pageX + 20) + "px"
                    });
            });
    	})
    </script>
    </head>
    <body>
        <jsp:include page="jsp/common/teacher_header.jsp"></jsp:include>
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
	        					<h5 style="font-weight: bold">角色：教师</h5>
	        				</div>
	        				<div style="margin:-90px 20px"><img alt="" src="Images/avator.png" width="90px" style="border-radius: 50%;float: right"> </div>
	        			</div>
	        		</div>
	        	</div>
	        </div>
  
        <div id="container" class="row">
        	<div class="col-md-1"></div>
            <ul class="col-md-2 task" style="border-top: 3px solid red">
                <li>
                	<div class="glyphicon glyphicon-tag logo"></div>
                	&nbsp
                	<a>基于SSM的教学平台开发</a>
                </li>
                <li>
                	<div class="glyphicon glyphicon-tag logo"></div>
                	&nbsp
                	<a>基于云平台的智慧校园数据中心</a>
                </li>
                <li>
                	<div class="glyphicon glyphicon-tag logo"></div>
                	&nbsp
                	<a>基于SDN的负载均衡节能技术研究</a>
                </li>
                <li>
                	<div class="glyphicon glyphicon-tag logo"></div>
                	&nbsp
                	<a>数据挖掘技术在网络教学中的应用研究</a>
                </li>
            </ul>
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