<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrap-theme.min.css" rel="stylesheet">
	<script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
<title>Insert title here</title>
<style type="text/css">
	img{
		width: 100%;
	}
	#ad-carousel{
		margin-top: -20px
	}
	.Picture_word{
		position:absolute;
		right:15%;
		bottom:240px;
		left:15%;
		z-index:10;
		padding-top:20px;
		padding-bottom:20px;
		color:#fff;
		text-shadow:0 1px 2px rgba(0,0,0,.6)
	}
	#introduce{
		font-size: 48px;
		font-weight: bold;
	}
</style>
</head>
<body>
	<jsp:include page="jsp/common/login_header.jsp"></jsp:include>
	<div id="ad-carousel" class="carousel slide" data-ride="carousel">
	    <ol class="carousel-indicators">
	        <li data-target="#ad-carousel" data-slide-to="0" class="active"></li>
	        <li data-target="#ad-carousel" data-slide-to="1"></li>
	        <li data-target="#ad-carousel" data-slide-to="2"></li>
	    </ol>
	    <div class="carousel-inner">
	        <div class="item active">
	            <img src="Images/bg2.jpg" alt="1 slide">
	
	            <div class="container">
	                <div class="Picture_word">
	                	
	                    <p id="introduce" class="showIntroduce">I·论文评价管理系统</p>
	                    <p style="font-size: 24px">I·论文评价管理系统(I.Paper Evaluation Management System)，开发于2018年。平台提供论文课题发布、论文提交、论文评分、论文查重等功能。</p>
	                </div>
	            </div>
	        </div>
	        <div class="item">
	            <img src="Images/bg2.jpg" alt="2 slide">
	
	            <div class="container">
	                <div class="Picture_word">
	                    <p id="introduce" class="showIntroduce">我是学生？</p>
	                    <p style="font-size: 24px">提供选择老师课题，上传论文，查询成绩、查询重复率等功能。</p>
	                </div>
	            </div>
	        </div>
	        <div class="item">
	            <img src="Images/bg2.jpg" alt="3 slide">
	
	            <div class="container">
	                <div class="Picture_word">
	                    <p id="introduce" class="showIntroduce">我是老师？</p>
	                    <p style="font-size: 24px">您可以在这里发布课题，批改论文，将极大提高您的工作效率。</p>
	                </div>
	            </div>
	        </div>
	    </div>
	    <a class="left carousel-control" href="#ad-carousel" data-slide="prev"><span
	            class="glyphicon glyphicon-chevron-left"></span></a>
	    <a class="right carousel-control" href="#ad-carousel" data-slide="next"><span
	            class="glyphicon glyphicon-chevron-right"></span></a>
	</div>
	
</body>
</html>