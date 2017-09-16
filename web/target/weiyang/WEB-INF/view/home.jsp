<%--
  Created by IntelliJ IDEA.
  User: shiyi
  Date: 2016/12/19
  Time: 下午6:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Calendar" %>
<%@ page import="com.web.entity.Lostmess" %>
<%@ page import="java.util.List" %>
<%@ page import="com.web.entity.Usermess" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>寻亲网</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/xunqin.css" rel="stylesheet">
    <link href="/css/home.css" rel="stylesheet">

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

        .num-size
        {
            font-size:36px;
            color:#70a3c4;
        }
        .beforeground
        {
            width:100%;
            position:absolute;
            height:500px;
            opacity: 0.4;
            background:#004a7c;
            z-index:9;
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
                    <li><a href="/lostmess/list" style="font-size:16px;" target="_blank">寻亲库</a></li>
                    <li><a href="/gaminmess/list" style="font-size:16px;" target="_blank">资料库</a></li>
                    <li><a href="/blog" style="font-size:16px;" target="_blank">论坛</a></li>
                    <li><a href="#" style="font-size:16px;" target="_blank">关于</a></li>
                    <%
                        Integer userid = (Integer) session.getAttribute("userid");
                        if(userid != null){
                    %>
                    <li><a href="/${Usermess.username}" target="_blank"><img src="/images/${Usermess.picture}" class="img-circle" style="height:50px;width:50px"></a></li>
                    <%
                    }
                    else{
                    %>
                    <li><a href="/goto/login" style="font-size:16px;">登录</a></li>
                    <li><a href="/goto/register" style="font-size:16px;">注册</a></li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- 广告轮播 -->
<div id="ad-carousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#ad-carousel" data-slide-to="0" class="active"></li>
        <li data-target="#ad-carousel" data-slide-to="1"></li>
        <li data-target="#ad-carousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="item active">
            <div class="beforeground"></div>
            <img src="/images/66.jpg" alt="1 slide">
            <div>
                <div class="carousel-caption" style="z-index:999">
                    <p style="margin-top:-250px;font-size:36px">基于云技术的公益寻人平台</p>
                    <%
                        if(userid != null){
                    %>
                        <a href="/lostmess/uploads" target="_blank" class="btn btn-primary">发布寻人信息</a>
                    <%
                    }else{
                    %>
                        <a href="javascript:void(0);" onclick="showmess()" class="btn btn-primary">发布寻人信息</a>
                    <%
                        }
                    %>
                    <a href="/lostmess/list" target="_blank" class="btn btn-primary">查看寻人信息库</a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="beforeground"></div>
            <img src="/images/55.jpg" alt="2 slide">

            <div>
                <div class="carousel-caption" style="z-index:999">
                    <p style="margin-top:-250px;font-size:36px">动动手指就有可能，帮一个流浪小孩找到妈妈</p>
                    <%
                        if(userid != null){
                    %>
                        <a class="btn btn-primary" href="/gaminmess/uploads" target="_blank">添加流浪人群信息</a>
                    <%
                        }else{
                    %>
                        <a class="btn btn-primary" href="javascript:void(0);" onclick="showmess()">添加流浪人群信息</a>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="beforeground"></div>
            <img src="/images/44.jpg" alt="3 slide">

            <div>
                <div class="carousel-caption" style="z-index:999">
                    <p style="margin-top:-250px;font-size:36px">如果你正在找人，进来就会多一份希望</p>
                    <a href="/lostmess/list" class="btn btn-primary">我要找人</a>
                </div>
            </div>
        </div>

    </div>
    <a class="left carousel-control" href="#ad-carousel" data-slide="prev" style="z-index:999"><span
            class="glyphicon glyphicon-chevron-left"></span></a>
    <a class="right carousel-control" href="#ad-carousel" data-slide="next" style="z-index:999"><span
            class="glyphicon glyphicon-chevron-right"></span></a>
</div>


<%
    int lostNum = (Integer) request.getAttribute("lostMessCount");
    int dataNum = (Integer)request.getAttribute("gaminMessCount");
    int pageViewNum = (Integer)request.getAttribute("pageViewCount");
    List<Lostmess> lostmesses=(ArrayList<Lostmess>)request.getAttribute("lost");
%>

<div class="row" style="text-align:center;margin: 0" >
    <div class="col-md-4">
        <div><span class="num-size"><%=pageViewNum%></span></div>
        <div class="word-color">累计访问量</div>
    </div>

    <div class="col-md-4">
        <div><span class="num-size"><%=lostNum%></span></div>
        <div class="word-color">寻人启事数量</div>
    </div>

    <div class="col-md-4">
        <div><span class="num-size"><%=dataNum%></span></div>
        <div class="word-color">资料库数量</div>
    </div>
</div>

<hr>
<div style="width:90%;margin:0 auto">
    <div class="row" style="margin-bottom:40px;">
        <%
            Calendar cal = Calendar.getInstance();
            int year = cal.get(Calendar.YEAR);
            if(lostmesses!=null){
                for(Lostmess lostmess:lostmesses){
                    String sex;
                    if(lostmess.getSex() == 0)
                        sex = "男";
                    else if(lostmess.getSex() == 1)
                        sex = "女";
                    else
                        sex = "未知";

                    String[] pictureList = lostmess.getPicture_list().split(";");
                    String firstPicture = "/images/4.jpg";
                    if(pictureList.length > 0)
                        firstPicture = pictureList[0];

                    String years = lostmess.getBirthday().substring(0,4);
                    int birthyear = Integer.parseInt(years);
                    int age = year - birthyear;
        %>
        <div class="col-md-3 sx">
            <div class="card">
                <a href="/lostmess/<%=lostmess.getId()%>" target="_blank" class="before"></a>
                <img src="<%=firstPicture%>">
                <div class="message">
                    <div>姓名：<span><%=lostmess.getName()%></span></div>
                    <div>年龄：<span><%=age%></span>&nbsp;&nbsp;性别：<span><%=sex%></span></div>
                    <%--<div>籍贯：<span><%=lostmess.getNative_place()%></span></div>--%>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>
    </div>
</div>


<div style="background:#1f6cb0;height:200px;padding-top:50px" align="center">
    <h1>我们每时每刻都在寻找，上传你的资料吧</h1>
    <a class="btn btn-primary">发布寻人信息</a>
</div>



<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script>

    function showmess() {
        alert("您尚未登录!");
    }

    $(function () {
        $('#ad-carousel').carousel();

    });

    function showlist() {

        var list = document.querySelector('.div-container')
        list.style.display = 'block';

    }

    function hiddenlist(){
        var list = document.querySelector('.div-container')
        list.style.display = 'none';

    }

    $(window).scroll(function () {
        if ($(".nav-container").offset().top > 200)
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
