<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <title>首页</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="css/style_common.css" rel="stylesheet" />
    <link href="css/style10.css" rel="stylesheet" />
    <link href="css/demo.css" rel="stylesheet" />
	<script src="http://libs.baidu.com/jquery/2.1.4/jquery.js" type="text/javascript"></script>
	<script type="text/javascript" href="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style type="text/css">
        body{
            height: 1000px
        }
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
    <script type="text/javascript">
    	$(function(){
    		$("input").blur(function(){
    			var r = $(this).parent();
    			r.find(".formtips").remove();
    			if($(this).is("#idnum")){
    				if(this.value==""){
    					r.append('<span class="formtips" style="color: red">请输入账号</span>')
    				}
    			}
    			if($(this).is("#password")){
    				if(this.value==""){
    					r.append('<span class="formtips" style="color: red">请输入密码</span>')
    				}
    			}
    		});
    	})
    </script>
</head>
<body>
    <jsp:include page="jsp/common/login_header.jsp"></jsp:include>
	<div class="container-full">
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

    <!--老师展示区-->
    <div class="container" style="margin-top: 30px">
        <div class="row">
            <div class="span12">
                <div class="tabbable" id="tabs-353594">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#panel-1" data-toggle="tab" style="color: black">推荐课题</a>
                        </li>
                        <li>
                            <a href="#panel-2" data-toggle="tab" style="color: black">推荐老师</a>
                        </li>
                    </ul>
                     
                    <div class="tab-content" style="margin-top: 30px">
                        <div class="tab-pane active" id="panel-1">
                            <div class="row">
                                <div class="picture">
                                    <ul class="nav nav-tabs">
                                        <li class="col-md-4">
                                            <div class="thumbnail">
                                                <div class="view view-tenth">
													<img src="Images/2.jpg" />
													<div class="mask">
														<h2>冯诺尔曼结构</h2>
														<p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</p>
														<a href="" class="info">查看更多</a>
													</div>
												</div>
                                                <div class="caption">
                                                    <h3>基于</h3>
                                                    <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">详情</button>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="col-md-4">
                                            <div class="thumbnail">
                                                <div class="view view-tenth">
													<img src="Images/1.jpg" />
													<div class="mask">
														<h2>冯诺尔曼结构</h2>
														<p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</p>
														<a href="" class="info">查看更多</a>
													</div>
												</div>
                                                <div class="caption">
                                                    <h3>冯诺尔曼结构</h3>
                                                    <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">详情</button>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="col-md-4">
                                            <div class="thumbnail">
                                                <div class="view view-tenth">
													<img src="Images/3.jpg" />
													<div class="mask">
														<h2>冯诺尔曼结构</h2>
														<p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</p>
														<a href="" class="info">查看更多</a>
													</div>
												</div>
                                                <div class="caption">
                                                    <h3>冯诺尔曼结构</h3>
                                                    <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">详情</button>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="panel-2">
                            <div class="main-content">
							    <div class="image-list">
							        <div class="cover"><img src="Images/1.jpg" alt=""></div>
							        <div class="cover"><img src="Images/1.jpg" alt=""></div>
							        <div class="cover"><img src="Images/1.jpg" alt=""></div>
							        <div class="cover"><img src="Images/1.jpg" alt=""></div>
							        <div class="cover"><img src="Images/1.jpg" alt=""></div>
							        <div class="cover"><img src="Images/1.jpg" alt=""></div>
							    </div>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<div class="footer" style="height: 100px"></div>
    
    <!-- 推荐课题模态框 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel">冯诺尔曼结构</h4>
	            </div>
	            <div class="modal-body">冯·诺依曼结构也称普林斯顿结构，是一种将程序指令存储器和数据存储器合并在一起的存储器结构。程序指令存储地址和数据存储地址指向同一个存储器的不同物理位置，因此程序指令和数据的宽度相同，如英特尔公司的8086中央处理器的程序指令和数据都是16位宽。</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-success" data-dismiss="modal">关闭</button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>  
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel">冯诺尔曼结构</h4>
	            </div>
	            <div class="modal-body">冯·诺依曼结构也称普林斯顿结构，是一种将程序指令存储器和数据存储器合并在一起的存储器结构。程序指令存储地址和数据存储地址指向同一个存储器的不同物理位置，因此程序指令和数据的宽度相同，如英特尔公司的8086中央处理器的程序指令和数据都是16位宽。</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-success" data-dismiss="modal">关闭</button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>  
	
	<div class="modal fade" id="myModal01" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel">test</h4>
	            </div>
	            <div class="modal-body">冯·诺依曼结构也称普林斯顿结构，是一种将程序指令存储器和数据存储器合并在一起的存储器结构。程序指令存储地址和数据存储地址指向同一个存储器的不同物理位置，因此程序指令和数据的宽度相同，如英特尔公司的8086中央处理器的程序指令和数据都是16位宽。</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-success" data-dismiss="modal">关闭</button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>
	
	<div class="modal fade" id="myModal02" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel">基于移动平台的轻博客系统开发</h4>
	            </div>
	            <div class="modal-body">在掌握Android技术和JavaEE的基础上，熟悉轻博客系统的原理，设计和实现包含移动端和服务器端的轻博客系统。移动端包括：用户注册，博文发布，博文分享，博文搜索等功能。服务器端包括：存储用户信息，博文审阅，博文的增删改查，JPush推送等功能。完成一套基于移动端的轻博客系统。</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-success" data-dismiss="modal">关闭</button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div>  <!-- /.modal -->
	</div>
</body>
</html>