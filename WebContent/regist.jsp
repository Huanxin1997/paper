<%@ page contentType="text/html; charset=utf-8" language="java"%>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>新增学生信息</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.js" type="text/javascript"></script>
	<script type="text/javascript" href="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("form :input.required").each(function(){
				var $required = $("<strong class='high'> *</strong>");
				$(this).parents().append($required);
			})
		})
	</script>
</head>
<body>
<jsp:include page="jsp/common/super_header.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-4">

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
                <input type="text" name="address" id="address" class="form-control" placeholder="输入地址" required maxLength="40"><br>
                <input type="submit" class="btn btn-primary" id="btn-reg" value="提交">
                <a href="index.jsp" class="btn btn-default" id="btn-reg">返回登录</a>
            </form>
        </div>
        <div class="col-md-4">
        </div>
    </div>
</body>
</html>