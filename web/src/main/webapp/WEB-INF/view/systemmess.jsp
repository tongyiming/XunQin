<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2017/2/7
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>寻亲网——个人主页</title>
    <link href="/css/usermess.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="/js/html5shiv.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->

    <style>


    </style>

</head>

<body>
<!-- 顶部导航 -->
<%@include file="normal_nav.jsp"%>

<!-- 移动设备导航栏 -->
<%@include file="mobile_nav.jsp"%>

<!--主要内容-->
<div class="main-container">
    <div class="header-container">
        <div class="row">
            <div class="col-md-2" style="padding:5%"><img src="/images/${User.picture}" style="width:100px; height:100px;"></div>
            <div class="col-md-5" style="padding:5%">
                <div><h1>${User.nickname}</h1></div>
                <div>爱心值：
                    <span>
                        <img src="/images/love.jpg" style="width:20px; height:20px; ">
                        <img src="/images/love.jpg" style="width:20px; height:20px; ">
                        <img src="/images/love.jpg" style="width:20px; height:20px; ">
                    </span>
                </div>
            </div>
        </div>
    </div>
    <div class="second-container">
        <div class="row row-plus" style="border-bottom:1px #ccc solid;">
            <a href="lostrecord" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;">我的发布</a>
            <a href="leaveword" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;">我的留言</a>
            <a href="systemmess" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;" id="self">系统消息<span class="badge">3</span></a>
            <a href="showmess" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;">基本信息</a>
            <a href="account" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;">账户信息</a>
            <a href="realmess" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;">实名认证</a>
        </div>
        <ul class="media-list" style="margin-top:40px;">
            
            <li class="media">
                <a class="pull-left" href="#">
                    <img class="media-object" style="width:50px; height:50px" src="images/33.jpg">
                </a>
                <div class="media-body">
                    <div  id="002body">
                        <h4 class="media-heading"><a href="#" style="text-decoration:none">管理员</a></h4>
                        <div>我们发现一个失踪者信息，和你要找的人很相似！</span><a href="###">查看详情</a></div>
                        <div style="margin-top:40px;font-size:14px"><span>2017-1-20&nbsp;&nbsp;21:30:34</span></div>
                    </div>
                </div>
            </li>
            <hr>
        </ul>
        <div class="text-center">
            <nav>
                <ul class="pagination">
                    <li><a href="/u/1/letter?nowpage=0">首页</a></li>
                    <li><a href="/u/1/letter?nowpage=${NowPage-1>=0?NowPage-1:0}">上一页</a></li>
                    <li><a href="/u/1/letter?nowpage=${NowPage+1<=MaxPage?NowPage+1:MaxPage}">
                        下一页</a></li>
                    <li><a href="/u/1/letter?nowpage=${MaxPage}">末页</a></li>
                </ul>
            </nav>
        </div>

    </div>

</div>

<hr>
<%@include file="footer.jsp"%>



<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>

<script>

</script>

</body>
</html>

