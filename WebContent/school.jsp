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
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <style type="text/css">
        #mouseHover{
            width: 300px;
            height: 300px;
            padding: 8px;
            background: #ffffe8;
            border-radius: 5px;
            border: 1px solid #eee;
            position: absolute;
            display: none;
        }
        .content{
            height: 200px;
            border: 2px solid #abab9f;
            padding: 30px;
            border-radius: 10px;
            display: none;
        }
        .head{
            background: #666;
            color: white;
            height: 50px;
            padding: 10px;
            border-bottom: 1px solid #666
        }
    </style>
    <script type="text/javascript">
        $(function () {
            var x = 10;
            var y = 15;
            $("#schoolCard").mouseover(function (e) {
                //当鼠标指针从元素上移入时 
                $("#mouseHover").css({"top": (e.pageY + y) + "px", "left": (e.pageX + x) + "px" }).show("fast");
            }).mouseout(function(){ //当鼠标指针从元素上移开时 
                $("#mouseHover").hide();
            }).mousemove(function (e) { //当鼠标指针从元素上移动时 
                $("#mouseHover").css({ "top": (e.pageY + y) + "px", "left": (e.pageX + x) + "px" });
            });
            
            $("h3.head").bind("click",function(){
                if($(this).next("div.content").is(":visible")){
                    $(this).text("北京师范大学珠海分校【点击查看】");
                    $(this).next("div.content").hide();
                }else{
                    $(this).text("北京师范大学珠海分校");
                    $(this).next("div.content").show();
                }

            })
        });

    </script>
    <body>
        <jsp:include page="jsp/common/login_header.jsp"></jsp:include>
        <div class="container">
            <div class="row">
                <div class="span12">
                    <div class="row">
                        <div class="span12">
                            <h3 class="head" id="head">北京师范大学珠海分校【点击查看】</h3>
                            <div class="content" id="BNUZ">
                                 <a href="#" class="pull-left"><img src="Images/bnuz.jpg" class="media-object" alt='' width="200px" id="schoolCard" /></a>
                                <div class="media-body">
                                    <h3 class="media-heading" style="font-weight: bold;">
                                        北京师范大学珠海分校
                                    </h3> 
                                    <h4>北京师范大学珠海校区（Beijing Normal University, Zhuhai）坐落在海滨城市珠海，是教育部批准设立、由北京师范大学和珠海市人民政府合作举办、进行本科层次教育的全日制普通本科高校。</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="mouseHover">
                        <h3>北京师范大学珠海分校</h3>
                        <ul>
                            <img src="Images/bnuz.jpg" class="media-object" alt='' width="200px" />
                            <li>老师人数：100</li>
                            <li>学生人数：1000</li>
                            <li>课题数：100</li>
                        </ul>
                    </div>
                </div>
            </div>     
        </div>
    </body>
</html>