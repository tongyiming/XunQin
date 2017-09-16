<%--
  Created by IntelliJ IDEA.
  User: shiyi
  Date: 2016/12/19
  Time: 下午6:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Calendar" %>
<%@ page import="com.web.entity.Lostmess" %>
<%@ page import="com.web.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.web.entity.Usermess" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>寻亲网——寻人信息</title>
    <link href="/css/lostmess.css" rel="stylesheet">

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

<%
    Calendar cal = Calendar.getInstance();
    int year = cal.get(Calendar.YEAR);
    Lostmess lostmess = (Lostmess)request.getAttribute("lostmess");

    String find_type = lostmess.getFind_type() == 0 ? "家寻宝贝" : "宝贝寻家";

    String sex;
    if(lostmess.getSex() == 0)
        sex = "男";
    else if(lostmess.getSex() == 1)
        sex = "女";
    else
        sex = "未知";

    String years = lostmess.getBirthday().substring(0,4);
    int birthyear = Integer.parseInt(years);
    int age = year - birthyear;

    String bolld_type;
    switch(lostmess.getBlood_type())
    {
        case 0: bolld_type = "A"; break;
        case 1: bolld_type = "B"; break;
        case 2: bolld_type = "AB"; break;
        case 3: bolld_type = "O"; break;
        case 4: bolld_type = "其他"; break;
    }

    String[] pictureList = lostmess.getPicture_list().split(";");
    String firstPicture = "/images/4.jpg";
    if(pictureList.length > 0)
        firstPicture = pictureList[0];

    String data = lostmess.getLost_date();
    if(data == null)
        data = "";

    if(data.length() > 10)
        data.substring(0, 10);
%>


<div class="container-lostmess">
    <div class="all-mess">
        <div class="kuang">
            <div class="name"><span style="margin-left:10%;"><%=lostmess.getName()%></span></div>
            <div style="margin-top:10px;margin-left:5%;">
                <div>
                    <a class="btn btn-color-font">
                        类别：<span color="#fff"><%=find_type%></span>
                    </a>
                    <%
                        Usermess user = (Usermess)request.getAttribute("user");
                        if (user != null)
                        {
                    %>
                    <a href="/${user.username}" style="margin-left:45%">
                        <img class="img-circle" style="width:50px; height:50px;" src="/images/${user.picture}" title="发布者">
                    </a>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>

        <div class="container-lostmess-content">
            <div class="lostpicture">
                  <img src="<%=pictureList[0]%>" alt="图片">
            </div>
            <div class="lostmess-text">
                <div class="row-offset">
                    <div class="mess-font-color">姓名：</div>
                    <div class="mess-content"><%=lostmess.getName()%></div>
                </div>
                <div class="row-offset">
                    <div class="mess-font-color">性别：</div>
                    <div class="mess-content"><%=sex%></div>
                </div>
                <div class="row-offset">
                    <div class="mess-font-color">生日：</div>
                    <div class="mess-content"><%=lostmess.getBirthday().substring(0, 10)%>（现年<%=age%>岁）</div>
                </div>
                <div class="row-offset">
                    <div class="mess-font-color">籍贯：</div>
                    <div class="mess-content"><%=lostmess.getNative_place()%></div>
                </div>
                <div class="row-offset">
                    <div class="mess-font-color">身高：</div>
                    <div class="mess-content"><%=lostmess.getHeight()%>cm</div>
                </div>
                <div class="row-offset">
                    <div class="mess-font-color">失踪日期：</div>
                    <div class="mess-content"><%=data%></div>
                </div>
                <div class="row-offset">
                    <div class="mess-font-color">失踪地点：</div>
                    <div class="mess-content"><%=lostmess.getLost_place()%></div>
                </div>
                <div class="row-offset">
                    <div class="mess-font-color">特征：</div>
                    <div class="mess-content"><%=lostmess.getFeature()%></div>
                </div>
                <div class="row-offset">
                    <div class="mess-font-color">其他信息：</div>
                    <div class="mess-content"><%=lostmess.getOther_message()%></div>
                </div>
                <div class="row-offset">
                    <div class="mess-font-color">联系电话：</div>
                    <div class="mess-content"><%=lostmess.getPhone()%></div>
                </div>
                <div class="row-offset">
                    <div class="mess-font-color">联系邮箱：</div>
                    <div class="mess-content"><%=lostmess.getEmail()%></div>
                </div>
            </div>
        </div>
    </div>

</div>

<hr>
<%@include file="footer.jsp"%>

<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>

<script type="text/javascript">
    $(function () {
        $('#ad-carousel').carousel();

    });
</script>

</body>
</html>
