<%@ page contentType="text/html; charset=utf-8" language="java"%>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>新增学生信息</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="index.jsp">主页</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-4">
			<h4>上传论文，请仔细填写信息！</h4>
			<span style="color: red">${message}</span>
            <form class="form-signin" action="AddPaperServlet?idnum=${idnum}&author=${name}&teacher=${param.teacher}&subject=${param.subject}" method="post" onsubmit="return check(this)" style="margin-top:50px">
                <label for="" style="font-weight:bold">学号</label>
                <label name="idnum" id="idnum" class="form-control">${idnum }</label><br>
                <label for="">姓名</label>
                <label name="author" id="author" class="form-control">${name }</label><br>
                <label for="">选择文件</label>
                <input type="text" name="file" id="file" class="form-control" placeholder="选择文件" required ><br>
                <label for="">论文题目</label>
                <input type="text" name="title" id="title" class="form-control" placeholder="请输入论文题目" required maxLength="30"><br>
                <label for="">指导老师</label>
                <label for="" name="teacher" id="teacher" class="form-control" >${param.teacher}</label><br>
                <label for="">所属课题</label>
                <label for="" name="subject" id="subject" class="form-control" >${param.subject}</label><br>
                <input type="submit" class="btn btn-primary" id="btn-reg" value="提交">
                <a href="index.jsp" class="btn btn-default" id="btn-reg">返回</a>
            </form>
        </div>
    </div>
</body>
</html>