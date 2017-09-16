<%--
  Created by IntelliJ IDEA.
  User: hjh
  Date: 16-12-18
  Time: 下午3:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Calendar" %>
<%@ page import="com.web.entity.Lostmess" %>
<%@ page import="java.util.List" %>
<%@ page import="com.web.entity.Gaminmess" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>寻亲网——寻人库</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/home.css" rel="stylesheet">
    <link href="/css/xunqin.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="/js/html5shiv.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->

    <style>

        .navbar-collapse > ul>li>a:hover,
        .navbar-collapse > ul>li>a:focus
        {
            background: #113f67;
            color:#fff;
        }

        .container
        {
            margin:0px auto;
            padding:0px;
            width:100%;
        }

        .beforeground
        {
            width:100%;
            position:absolute;
            height:380px;
            opacity: 0.4;
            background:#004a7c;
            z-index:9
        }

        .containers {
            text-align: center;
            margin-top: 80px;
            width:100%;
        }

        .containers ul {
            width: 100%;
            margin: 0 auto;
        }
        .containers ul li{
            display: inline-block;
            padding: 15px;
            border: 1px solid #ccc;
            text-align: center;
            border-radius: 5px;
        }

        .containers ul li a{
            text-decoration: none;
        }

        .dispare{

            border-radius: 0.2rem;
            color: #7d7d7d;
            text-decoration: none;
            text-transform: uppercase;
            display: inline-block;
            text-align: center;
            font-weight: bold;

        }

        .div-container{
            z-index: 9999;margin-left:71%;width:25%; height:300px;position:fixed;
            background: #FFF;text-align: center;
            font-size: 14px;
            display: none;
            transition: 1s linear;
            margin-top: 70px;
        }

        .div-container{
            z-index: 9999;margin-left:71%;width:25%; height:300px;position:fixed;
            background: #FFF;text-align: center;
            font-size: 14px;
            display: none;
            transition: 1s linear;
            margin-top: 70px;
        }

        .div-row{
            display:flex; flex-direction: row; margin-top:40px;margin-left:25px;
        }

        .a-choice, .quit{
            text-decoration: none; color: #000;font-size:14px;
        }

        .a-choice:hover{
            text-decoration: none;
            color: #000;
        }
        .quit:hover{
            text-decoration: none;
            color: red;
        }

        .div-choice{
            width:40%; margin: 10px; padding: 10px;background: #F6F6F6
        }

        .div-choice:hover{
            background: #CCCCCC;
        }

        .nav-container{
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            height:70px;
            align-items: center;
            width: 100%;
            position: fixed;
            transition: 1s ease-in-out;
            z-index:9999;
            box-sizing: border-box;
        }

        .nav-left{
            width:70%;
            display: flex;
            justify-content:flex-start;
            align-items: center;
        }

        .nav-title{
            width:35%;
            text-align: center;
        }

        .nav-list{
            display: flex;
            justify-content:space-around;
            flex-direction: row;
            width: 40%;
            align-items: center;
        }
        .nav-right{
            width: 30%;
            display: flex;
            justify-content:flex-start;
            align-items: center;
        }

        .login{
            margin-left:40%;
        }

        .register{
            margin-left:10%;
        }
        .nav-user-picture{
            width:30%;
            margin-left: 40%;
        }

        .top-nav{
            background: #1b435d;
            color:#1f6cb0;
        }

        .nav-item{
            width:100%;
        }

        .nav-item-a{
            text-decoration: none;color:#fff;
        }
        .nav-item-a:hover{
            text-decoration: none;color:#fff;
        }
        .nav-list-a{
            color: #1f6cb0;
        }

    </style>

</head>

<body>
<!-- 顶部导航 -->
<div class="nav-container" id="menu-nav">
    <div class="nav-left">
        <div class="nav-title"><a href="/home/" style="font-size:2.5em" class="nav-item-a">寻亲网</a></div>
        <div class="nav-list">
            <div class="nav-item"><a href="/lostmess/list" class="nav-item-a">寻亲库</a></div>
            <div class="nav-item"><a href="/gaminmess/list" class="nav-item-a">资料库</a></div>
            <div class="nav-item"><a href="/blog" class="nav-item-a">论坛</a></div>
            <div class="nav-item"><a href="#" class="nav-item-a">关于</a></div>
        </div>
    </div>
    <%
        Integer n_userid = (Integer) session.getAttribute("userid");
        if(n_userid != null){
    %>
    <div class="nav-right">
        <div class="nav-user-picture">
            <a href="/${UserMess.username}">
                <img src="/images/${UserMess.picture}" onmouseover="showlist()"style="width:50px; height:50px;border-radius: 25px;"/>
            </a>
        </div>
    </div>
    <%
    }
    else
    {
    %>
    <div class="nav-right">
        <div class="login"><a href="/goto/login" class="nav-item-a">登录</a></div>
        <div class="register"><a href="/goto/register" class="nav-item-a">注册</a></div>
    </div>
    <%
        }
    %>
</div>

<%
    if(n_userid != null){
%>
<div class="div-container" onmouseover="showlist()" onmouseout="hiddenlist()">
    <div style="display:flex; flex-direction: row; width:80%;margin-top:30px;">
        <div style="width:30%;margin-left:30px;" >
            <a href="#">
                <img src="/images/${UserMess.picture}" style="width: 70px;height: 70px;"
                     class="img-circle"/>
            </a>
        </div>
        <div style="width:70%; margin-top:15px;margin-left:-50px;font-size: 14px;">
            <a href="#" style="text-decoration: none; color: #000">${UserMess.nickname}</a><br>
            <span>爱心值：</span><span>${UserMess.love_count}</span>
        </div>
    </div>
    <div class="div-row">
        <div class="div-choice">
            <a href="/${UserMess.username}/lostrecord" class="a-choice">
                <div>我的发布</div>
            </a>
        </div>
        <div class="div-choice">
            <a href="/${UserMess.username}/leaveword" class="a-choice">
                <div>我的留言</div>
            </a>
        </div>
    </div>
    <div style="display:flex; flex-direction: row;margin-left:25px;">
        <div class="div-choice">
            <a href="/${UserMess.username}/systemmess" class="a-choice" style="text-decoration: none;">
                <div>系统消息</div>
            </a>
        </div>
        <div class="div-choice">
            <a href="/${UserMess.username}/showmess" class="a-choice">
                <div>个人设置</div>
            </a>
        </div>
    </div>
    <div>
        <a href="/goto/quit" class="quit" style="margin-left:60%;">安全退出</a>
    </div>
</div>
<%
    }
%>


<!--备选导航栏，移动设备显示-->
<div class="container" id="navmenu">
    <div class="navbar navbar-fixed-top" role="navigation" style="background:#1b435d">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">切换导航</span>
                    <span class="icon-bar" style="background:#fff"></span>
                    <span class="icon-bar" style="background:#fff"></span>
                    <span class="icon-bar" style="background:#fff"></span>
                </button>
                <a class="navbar-brand" href="/home/"><font style="font-size:36px">寻亲网</font></a>
            </div>

            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="/lostmess/list">寻亲库</a></li>
                    <li><a href="/gaminmess/list">资料库</a></li>
                    <li><a href="/blog">论坛</a></li>
                    <li><a href="#">关于</a></li>
                    <%
                        Integer userid = (Integer) session.getAttribute("userid");
                        if(userid != null){
                    %>
                    <li><a href="/${UserMess.username}"><img src="/images/${UserMess.picture}" class="img-circle" style="height:50px;width:50px"></a></li>
                    <%
                    }
                    else{
                    %>
                    <li><a href="/goto/login">登录</a></li>
                    <li><a href="/goto/register">注册</a></li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </div>
    </div>
</div>

<!--背景-->
<div class="carousel slide" style="height:380px">
    <div class="carousel-inner">
        <div class="item active" style="height:380px">
            <div class="beforeground"></div>
            <img src="/images/66.jpg" alt="背景">
            <div class="container">
                <div class="carousel-caption" style="z-index:999">
                    <div class="container">
                        <div class="row row-plus">
                            <div class="col-md-8 ad">
                                <div class="row" style="display: flex; flex-direction: row">
                                    <div class="col-ms-3" style="margin-top:50px;width:20%;padding-left:2%">
                                        <span class="help-word">已上传资料信息</span>
                                    </div>
                                    <div class="col-ms-9" style="width: 80%;padding-top:3%">
                                        <%
                                            int gaminNum = (Integer) request.getAttribute("GaminMessCount");
                                        %>

                                        <span class="font-num"><%=gaminNum/10000%10%></span>
                                        <span class="font-num"><%=gaminNum/1000%10%></span>
                                        <span class="font-num"><%=gaminNum/100%10%></span>
                                        <span class="font-num"><%=gaminNum/10%10%></span>
                                        <span class="font-num"><%=gaminNum%10%></span>
                                    </div>
                                </div>
                            </div>
                            <%
                                if(userid != null){
                            %>
                                <div class="col-md-4 num">
                                    <div class="row sure">
                                        <span>添加流浪人群信息</span>
                                        <a href="/gaminmess/uploads" class="btn btn-primary">添加信息</a>
                                    </div>
                                    <div class="row sure" style="margin-top:20px">
                                        <span>信息还不全？</span>
                                        <a href="/${UserMess.username}/showmess" class="btn btn-primary">完善信息</a>
                                    </div>
                                </div>
                            <%
                            }
                            else{
                            %>
                                <div class="col-md-4 num">
                                    <div class="row sure">
                                        <font>添加流浪人群信息</font>
                                        <a href="javascript:void(0);" onclick="showmess()" class="btn btn-primary">添加信息</a>
                                    </div>
                                    <div class="row sure" style="margin-top:20px">
                                        <font>信息还不全？</font>
                                        <a href="javascript:void(0);" onclick="showmess()" class="btn btn-primary">完善信息</a>
                                    </div>
                                </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--主要内容-->
<div class="container" style="background:#F7F7F7;;margin-top:20px">
    <div class="row" style="margin:30px 10%">
        <%
            Calendar cal = Calendar.getInstance();
            int year = cal.get(Calendar.YEAR);
            List<Gaminmess> lists = (List<Gaminmess>)request.getAttribute("GaminList");
            for(Gaminmess list : lists)
            {
                int id = list.getId();
                String picture = "/images/4.jpg";
                if(list.getPicture_list()!=null) {
                    String[] temp = list.getPicture_list().split(";");
                    if (temp.length != 0)
                        picture = temp[0];
                }

                String sex;
                if(list.getSex() == 0)
                    sex = "男";
                else if(list.getSex() == 1)
                    sex = "女";
                else
                    sex = "未知";
        %>
        <div class="col-md-3" style="padding-bottom: 15px;padding-top: 15px">
            <div class="card">
                <a href="/gaminmess/<%=id%>" class="before" target="_blank">                </a>
                <img src="<%=picture%>">
                <div class="message">
                    <div>年龄：<span><%=list.getAge()%></span>&nbsp;&nbsp;性别：<span><%=sex%></span></div>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>

</div>
<%
    int pagemax = (Integer) request.getAttribute("pagemax");
    int pagenow = (Integer) request.getAttribute("pagenow");
%>

<div class="containers large">
    <ul>
        <%--first--%>
        <% if(pagemax > 1){ %>
        <li><a href="/gaminmess/list?thenstart=<%=pagenow - 1%>&type=0">PREVIOUS</a></li>
        <% } %>

        <%--less 10--%>
        <%
            if(pagemax <= 10){
                for(int i = 1; i < pagenow; i++){
        %>
        <li><a href="/gaminmess/list?thenstart=<%=i%>&type=0"><%=i%></a></li>
        <%
            }
        }
        else {
            if(pagenow <= 8){
                for(int i = 1; i <= 8; i++){
                    if(pagenow == i) {
        %>
        <li class="active"><a href="/gaminmess/list?thenstart=<%=i%>&type=0"><%=i%></a></li>
        <%
        }
        else{
        %>
        <li><a href="/gaminmess/list?thenstart=<%=i%>&type=0"><%=i%></a></li>
        <%
                }
            }
        %>
        <li><span class="dispare">...</span></li>
        <li><a href="/gaminmess/list?thenstart=<%=pagemax%>&type=0"><%=pagemax%></a></li>
        <%
        }
        else if(pagenow >= pagemax-7){
        %>
        <li><a href="/gaminmess/list?thenstart=1&type=0">1</a></li>
        <li><span class="dispare">...</span></li>
        <%
            for(int i = pagemax-7; i <= pagemax; i++){
                if(pagenow == i) {
        %>
        <li class="active"><a href="/gaminmess/list?thenstart=<%=i%>&type=0"><%=i%></a></li>
        <%
        }
        else{
        %>
        <li><a href="/gaminmess/list?thenstart=<%=i%>&type=0"><%=i%></a></li>
        <%
                }
            }
        }
        else {
        %>
        <li><a href="/gaminmess/list?thenstart=1&type=0">1</a></li>
        <li><span class="dispare">...</span></li>
        <%
            for(int i=pagenow-2; i<=pagenow+3; i++)
            {
                if(pagenow == i) {
        %>
        <li class="active"><a href="/gaminmess/list?thenstart=<%=i%>&type=0"><%=i%></a></li>
        <%
        }
        else{
        %>
        <li><a href="/gaminmess/list?thenstart=<%=i%>&type=0"><%=i%></a></li>
        <%
                }
            }
        %>
        <li><span class="dispare">...</span></li>
        <li><a href="/gaminmess/list?thenstart=<%=pagemax%>&type=0"><%=pagemax%></a></li>

        <%
                }
            }
        %>


        <%--end--%>
        <%
            if(pagenow < pagemax){
        %>
        <li><a href="/gaminmess/list?thenstart=<%=pagenow+1%>&type=0">NEXT</a></li>
        <% } %>

    </ul>
</div>

<hr>
<%@include file="footer.jsp"%>

<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>

<script>
    function showmess() {
        alert("您尚未登录!");
    }

    function showlist() {

        var list = document.querySelector('.div-container')
        list.style.display = 'block';

    }

    function hiddenlist(){
        var list = document.querySelector('.div-container')
        list.style.display = 'none';

    }

    $(window).scroll(function () {
        if ($(".nav-container").offset().top > 50)
        {
            $(".nav-container").addClass("top-nav");
            $(".nav-item-a").addClass("nav-list-a");
        }
        else
        {
            $(".nav-container").removeClass("top-nav");
            $(".nav-item-a").removeClass("nav-list-a");
        }
    });
</script>
</body>
</html>
