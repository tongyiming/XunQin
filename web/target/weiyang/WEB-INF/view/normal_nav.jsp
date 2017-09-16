<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2017/1/11
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>寻亲网——寻人信息</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="/js/html5shiv.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->

    <style>

        article, body, figure,  input, li, p, select, table, tbody, td, textarea, tfoot, thead, tr, ul
        {
            font-family: "PingFang SC","Helvetica Neue",Helvetica,"Hiragino Sans GB",Arial,"Microsoft YaHei","微软雅黑",sans-serif,"Segoe UI Emoji","Segoe UI Symbol";
        }
        .div-container{
            z-index: 999;margin-left:72%;width:25%; height:300px;position:fixed;
            background: #FFF;text-align: center;
            font-size: 14px;
            display: none;
            transition: 1s linear;
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
            width:40%; margin: 10px;background: #F6F6F6
        }

        .div-choice div{
            padding: 10px;
        }

        .div-choice:hover{
            background: #CCCCCC;
        }

        .nav-container{
            background: #1b435d;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            height:70px;
            align-items: center;
            width: 100%;
            position: fixed;
            margin-top:-50px;
            z-index:9999;
        }

        .nav-left{
            width:70%;
            display: flex;
            justify-content:flex-start;

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

        .nav-item-a{
            text-decoration: none;
        }

        .nav-item-a:hover{
            text-decoration: none;color:#fff;
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
                <div style="width:70%; margin-top:15px;margin-left:-50px;font-size:14px;">
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

</body>

<script>

    function showlist() {

        var list = document.querySelector('.div-container')
        list.style.display = 'block';

    }

    function hiddenlist(){
        var list = document.querySelector('.div-container')
        list.style.display = 'none';

    }

</script>

</html>
