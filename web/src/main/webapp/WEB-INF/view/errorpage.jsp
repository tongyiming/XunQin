<%--
  Created by IntelliJ IDEA.
  User: jing
  Date: 2017/3/1
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>出错了</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="/js/html5shiv.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->

    <style>
        html,body
        {
            margin: 0;
            padding: 0;
        }

        .error-container{
            width:100%;
            height:680px;
            background-image: -webkit-radial-gradient(cover, #f47c7c, #a5def1);
            background-image: -moz-radial-gradient(cover, #f47c7c, #a5def1);
            background-image: -o-radial-gradient(cover, #f47c7c,#a5def1);
            position: fixed;
            text-align: center;
        }

        .box-error{
            width:50%;
            height: 50%;
            margin: 10% auto;
            background: #ffaf9b;
            text-align: center;
            border-radius: 5px;
            margin-bottom: 0%;
            z-index: 9999;
        }

        .error-mess{
            font-size: 98px;
            font-weight: bold;
            color: #fff;
        }

        .error-text{
            font-size: 50px;
        }

        .gohome{
            width:300px;
            margin:20px auto;
            z-index: 9999;
        }

        .demo
        {
            display: flex;
            flex-direction: row;
            justify-content: space-around;
            height: 670px;
        }

        .demo0
        {
            margin-top:40%;
            border-radius: 25px;
            width: 50px;
            height: 50px;
            position: relative;
        }

        .demo1
        {
            animation: mymove 4s linear infinite;
        }

        .demo2
        {
            animation: mymove 4s ease-in-out 2s infinite;
        }

        .demo3
        {
            animation: mymove 4s ease-in infinite;
        }

        .demo4
        {
            animation: mymove 4s ease-out 1s infinite;
        }

        .demo5
        {
            animation: mymove 5s step-start infinite;
        }

        .demo6
        {
            animation: mymove 4s ease 2s infinite;
        }

        .demo7
        {
            animation: mymove 4s linear infinite;
        }

        .demo8
        {
            animation: mymove 4s ease-in-out 1s infinite;
        }

        .demo9
        {
            animation: mymove 4s ease-in infinite;
        }

        .demo10
        {
            animation: mymove 4s ease-out 1s infinite;
        }

        .demo11
        {
            animation: mymove 5s step-start infinite;
        }

        .demo12
        {
            animation: mymove 4s ease 2s infinite;
        }

        @keyframes mymove
        {
            0%   {top:-50px;background:#ffd9e8;}
            10%  {top:-100px; background:#14ffec;}
            20%  {top:-150px; background:#f4f56e;}
            30%  {top:-200px; background:#8bc34a;}
            40% {top:-250px; background:#fd9191;}
            5%   {top:-300px;background:#8ea5eb;}
            60%  {top:-350px; background:blue;}
            70%  {top:-400px; background:yellow;}
            80%  {top:-450px; background:green;}
            90% {top:-500px; background:#ff8fe5;}
            90% {top:-550px; background:yellow;}
        }

    </style>

</head>

<body>

<!--错误信息框-->
<div class="error-container">

    <div class="box-error">
        <div class="error-mess">404</div>
        <div class="error-text">${error}</div>
    </div>

    <div class="gohome">
        <a  href="/" class="btn btn-primary btn-lg" style="background: #ffaf9b; border:#ffaf9b">回首页</a>
    </div>

</div>

<!--小圆圈-->
<div class="demo">
    <div class="demo0 demo1"></div>
    <div class="demo0 demo2"></div>
    <div class="demo0 demo3"></div>
    <div class="demo0 demo4"></div>
    <div class="demo0 demo5"></div>
    <div class="demo0 demo6"></div>
    <div class="demo0 demo7"></div>
    <div class="demo0 demo8"></div>
    <div class="demo0 demo9"></div>
    <div class="demo0 demo10"></div>
    <div class="demo0 demo11"></div>
    <div class="demo0 demo12"></div>
</div>





<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script>

</script>
</body>
</html>
