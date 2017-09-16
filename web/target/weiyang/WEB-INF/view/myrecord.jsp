<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2017/1/19
  Time: 20:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.web.entity.*" %>
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
        .btn-update{
            display: flex; flex-direction: row; justify-content: flex-end
        }

        .btn-update div{
            margin:0 10px;
        }

        .btn-update div a{
            text-decoration: none;
        }

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
        <div class="row row-plu" style="border-bottom:1px #ccc solid;">
            <a href="lostrecord" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;" id="self">我的发布</a>
            <a href="leaveword" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;">我的留言</a>
            <a href="systemmess" disabled="true" title="待完善" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;">系统消息</a>
            <a href="showmess" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;">基本信息</a>
            <a href="account" title="待完善" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;">账户信息</a>
            <a href="realmess" title="待完善" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;">实名认证</a>
        </div>
        <ul class="media-list" style="margin-top:40px;">
            <%
                Usermess nowUser = (Usermess)request.getAttribute("nowUser");
                Usermess checkUser = (Usermess)request.getAttribute("checkUser");
                List<Lostrecord> lostrecords = (ArrayList<Lostrecord>)request.getAttribute("Lostrecord");
                List<Lostmess> lostmesses = (ArrayList<Lostmess>)request.getAttribute("Lostmess");
                if(lostrecords!=null && lostmesses!=null){
                    for (int i = 0; i < lostrecords.size(); i++)
                    {
            %>
            <li class="media">
                <a class="pull-left" href="#">
                    <img class="media-object lost-img" src="<%=lostmesses.get(i).getPicture_list()%>">
                </a>
                <div class="media-body">
                    <div style="padding:30px;">
                        <h4 class="media-heading"><a href="#"><%=lostmesses.get(i).getName()%></a>
                            &nbsp;&nbsp;&nbsp;<span><%=lostmesses.get(i).getBirthday()%></span>
                        </h4>
                        <div>失踪地址：<span><%=lostmesses.get(i).getLost_place()%></span></div>
                        <div style="margin-top:40px;">发布日期：<span><%=lostrecords.get(i).getPubdate()%></span></div>
                    </div>
                    <%
                        if(nowUser!=null && checkUser!=null){
                            if(nowUser.getId()==checkUser.getId()){
                    %>
                        <div class="btn-update">
                            <div>
                                <a href="delete?lostrecordid=<%=lostrecords.get(i).getId()%>&lostmessid=<%=lostmesses.get(i).getId()%>">删除</a>
                            </div>
                            <div>
                                <a href="updatelost?lostmessid=<%=lostmesses.get(i).getId()%>">修改</a>
                            </div>
                        </div>
                    <%
                            }
                        }
                    %>
                </div>
            </li>
            <hr>
            <%
                    }
                }
            %>
        </ul>
        <div class="text-center">
            <nav>
                <ul class="pagination">
                    <li><a href="lostrecord?nowpage=1">首页</a></li>
                    <li><a href="lostrecord?nowpage=${NowPage-1>=1?NowPage-1:1}">上一页</a></li>
                    <li><a href="lostrecord?nowpage=${NowPage+1<=MaxPage?NowPage+1:MaxPage}">
                        下一页</a></li>
                    <li><a href="lostrecord?nowpage=${MaxPage}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>

</div>

<hr>
<%@include file="footer.jsp"%>



<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/usermess.js"></script>

<script>

</script>

</body>
</html>

