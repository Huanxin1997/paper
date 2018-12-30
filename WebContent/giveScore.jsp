<%@ page contentType="text/html; charset=utf-8" language="java"%>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>教师-评分</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.js" type="text/javascript"></script>
	<script href="js/bootstrap.min.js" type="text/javascript" ></script>
    <script type="text/javascript">
    	var serial = ${param.serial};
    	var score = $("#score").val();
    	function update(){
    		$.ajax({
    			type: "POST",
    			url: "UpdateScoreServlet",
				data: {
					serial: serial,
					score: score
				},
				success:function(message){
					alert(message);
					window.location.reload();
				}
    		})
    		
    	}
    </script>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:include page="jsp/common/teacher_header.jsp" />
<div class="container">
    <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-4">
			<h2>论文信息</h2>
            <form class="form-signin" action="RepetitionServlet?idnum=${param.serial}" method="post" onsubmit="return check(this)" style="margin-top:80px;font-size: 20px">
                <label for="" style="font-weight:bold">流水号：${param.serial}</label><br>
                <label for="" style="font-weight:bold">题目：${param.title}</label><br>
                <label for="" style="font-weight:bold">作者：${param.author}</label><br>
                <label for="" style="font-weight:bold" name="idnum"> 学号：${param.idnum}</label><br>
                <br>
                <h4>给定分数</h4>
                <input type="number" class="form-control" oninput="if(value>100)value=100;if(value<0)value=0" id="score" required/><br>
                <input class="btn btn-primary" id="btn-reg" value="提交" onclick="update();">
            </form>
        </div>
    </div>
</body>
</html>