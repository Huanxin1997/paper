<%@ page contentType="text/html; charset=utf-8" language="java"%>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>新增课题信息</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
	<link href="My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="jsp/common/teacher_header.jsp"></jsp:include>
<%request.setCharacterEncoding("utf-8"); %>
<div class="container">
    <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-4">
			<h2>发布课题</h2>
			<h3 style="color: red;font-weight: bold">${success}</h3>
            <form class="form-signin" action="AddSubjectServlet?method=teacher&teacher=${name}" method="post" onsubmit="return check(this)" style="margin-top:50px">
                
                <label for="">课题名称</label>
                <input type="text" name="subject" id="subject" class="form-control" placeholder="请输入名称" required maxLength="28"><br>
                <label for="">截止日期</label>
                <input type="text" name="time" id="time" class="form-control Wdate" onclick="WdatePicker()" required maxLength="30"><br>
                <label for="">指导老师</label>
                <label for="" name="teacher" id="teacher" class="form-control" >${name}</label><br>
                <input type="submit" class="btn btn-primary" id="btn-reg" value="提交">
                <a href="index.jsp" class="btn btn-default" id="btn-reg">返回</a>
            </form>
        </div>
    </div>
</body>
</html>