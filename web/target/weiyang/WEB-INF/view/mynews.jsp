<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2017/1/19
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.web.entity.Usermess" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.web.entity.Leaveword" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>寻亲网——个人主页</title>
    <link href="/css/reset.css" rel="stylesheet">
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
        <div class="row row-plu" style="border-bottom:1px #ccc solid;">

            <a href="lostrecord" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;">我的发布</a>
            <a href="leaveword" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;" id="self">我的留言</a>
            <a href="systemmess" disabled="true" title="待完善" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;">系统消息</a>
            <a href="showmess" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;">基本信息</a>
            <a href="account" title="待完善" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;">账户信息</a>
            <a href="realmess" title="待完善" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;">实名认证</a>

        </div>


        <div class="write-letter">
            <form class="form-horizontal" role="form" action="addmainmess" method="post">
                <div class="write-letter-border"><img src="/images/101.gif" class="emotion" style="cursor:pointer"></div>
                <textarea  rows="4" type="text" id="write-mess" name="write-mess"
                           autofocus placeholder="写下你的留言吧……" style="width:100%;outline:none;font-size:16px;">
                </textarea>
                <input type="submit" class="btn btn-sm btn-primary" value="发表">
            </form>
        </div>
        <hr>

        <ul class="media-list" style="margin-top:40px;" id="list">
            <% List<Usermess> usermesses = (ArrayList<Usermess>)request.getAttribute("Mainmess");
                List<Leaveword> leavewords = (ArrayList<Leaveword>)request.getAttribute("Mainword");
                List leave = (ArrayList)request.getAttribute("Word");
                List mess = (ArrayList)request.getAttribute("Mess");
                for (int i = 0; i < leavewords.size(); i++)
                {
                    List<Leaveword> leavewordList=null;
                    List<Usermess> usermessList=null;
                    if(leave.get(i)!=null) {
                        leavewordList = (ArrayList<Leaveword>) leave.get(i);
                    }
                    if(mess.get(i)!=null) {
                        usermessList = (ArrayList<Usermess>) mess.get(i);
                    }
            %>
            <li class="media">
                <a class="pull-left" href="#">
                    <img class="media-object" src="/images/<%=usermesses.get(i).getPicture()%>" style="width:50px; height:50px">
                </a>
                <div class="media-body">
                    <div  id="001body">
                        <h4 class="media-heading">
                            <a href="###" style="text-decoration:none;font-size:16px;">
                                <%=usermesses.get(i).getNickname()%>
                            </a>
                        </h4>
                        <div name="mingming" class="ming-content">
                            <%=leavewords.get(i).getContent()%>
                        </div>
                        <div style="margin-top:40px;font-size:14px">
                            <span><%=leavewords.get(i).getCreatedate()%></span>&nbsp;&nbsp;&nbsp;
                            <!--把所有001变成用户id-->
                            <a href="#me<%=i%>" onclick="reply(<%=i%>, 'me<%=i%>', 'emotion<%=i%>')" style="text-decoration:none;font-size: 16px;">回复</a>
                        </div>
                        <%
                            if(usermessList!=null && leavewordList!=null){
                        %>
                            <!--评论大于三条要隐藏-->
                        <%
                                if(usermessList.size()>3){
                        %>
                                    <a href="###" style="text-decoration:none" onClick="showreply(<%=i%>,<%=usermessList.size()%>)">查看全部</a>
                        <%
                                    for (int j = 0; j < usermessList.size()-3; j++)
                                    {
                        %>
                                    <div id="reply<%=i%><%=j%>" style='display:none'>
                                        <ul class='media-list'>
                                            <li class='media'>
                                                <a class='pull-left' href='#'>
                                                    <img class='media-object' src='/images/<%=usermessList.get(j).getPicture()%>' style='width:30px; heigth:30px'>
                                                </a>
                                                <div class='media-body'><a href='#' style='text-decoration:none'><%=usermessList.get(j).getNickname()%></a>
                                                    <div name="ming" class="ming-content"><%=leavewordList.get(j).getContent()%></div>
                                                    <div style='font-size:14px;margin-top:20px;'><%=leavewordList.get(j).getCreatedate()%></div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                        <%
                                }
                                for (int j = usermessList.size()-3; j < usermessList.size(); j++)
                                {
                        %>
                                    <div id="reply<%=i%><%=j%>" style="display:block">
                                        <ul class='media-list' style='margin:20px 0'>
                                            <li class='media'>
                                                <a class='pull-left' href='#'>
                                                    <img class='media-object' src='/images/<%=usermessList.get(j).getPicture()%>' style='width:30px; heigth:30px'>
                                                </a>
                                                <div class='media-body'><a href='#' style='text-decoration:none'><%=usermessList.get(j).getNickname()%></a>
                                                    <div name="ming" class="ming-content"><%=leavewordList.get(j).getContent()%></div>
                                                    <div style='font-size:14px;margin-top:20px;'><%=leavewordList.get(j).getCreatedate()%></div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                        <%
                                }
                            }else{
                                for (int j = 0; j < usermessList.size(); j++)
                                {
                        %>
                                    <div id="reply<%=i%><%=j%>" style='display:block'>
                                        <ul class='media-list' style='margin:20px 0'>
                                            <li class='media'>
                                                <a class='pull-left' href='#'>
                                                    <img class='media-object' src='/images/<%=usermessList.get(j).getPicture()%>' style='width:30px; heigth:30px'>
                                                </a>
                                                <div class='media-body'>
                                                    <a href='#' style='text-decoration:none'><%=usermessList.get(j).getNickname()%></a>
                                                    <div name="ming" class="ming-content"><%=leavewordList.get(j).getContent()%></div>
                                                    <div style='font-size:14px;margin-top:20px;'><%=leavewordList.get(j).getCreatedate()%></div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                        <%
                                }
                            }
                            }
                        %>
                    </div>
                    <!--评论框-->
                    <div style="display:none" id="<%=i%>">
                        <%--<div class="write-letter-border"><img src="/images/101.gif" class="emotion" style="cursor:pointer"></div>--%>
                        <div><img src="/images/101.gif" class="emotion<%=i%>" style="cursor:pointer"></div>
                        <textarea rows="3" type="text" class="form-control mess" id="me<%=i%>" name="me">

                        </textarea>
                        <input type="button" class="btn btn-sm btn-primary" value="提交" onclick="send(<%=leavewords.get(i).getId()%>,<%=i%>)">
                        <input type="button" class="btn btn-sm btn-default" value="取消" onclick="cancel(<%=i%>)">
                    </div>
                </div>
            </li>
            <hr>
            <%
                }
            %>
        </ul>
        <div class="text-center">
            <nav>
                <ul class="pagination">
                    <li><a href="leaveword?nowpage=1">首页</a></li>
                    <li><a href="leaveword?nowpage=${NowPage-1>=1?NowPage-1:1}">上一页</a></li>
                    <li><a href="leaveword?nowpage=${NowPage+1<=MaxPage?NowPage+1:MaxPage}">
                        下一页</a></li>
                    <li><a href="leaveword?nowpage=${MaxPage}">末页</a></li>
                </ul>
            </nav>
        </div>

    </div>

</div>
<hr>
<%@include file="footer.jsp"%>

<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.qqFace.js"></script>

<script>
    function send(leavewordid,i)
    {
        var req=null;
        if (window.XMLHttpRequest){
            req = new XMLHttpRequest();
        }else{
            req = new ActiveXObject("Microsoft.XMLHTTP");
        }
        if(req!=null){
            req.open('post','/${User.username}/addLeaveword',true);
            req.setRequestHeader("Content-Type",
                    "application/x-www-form-urlencoded");
            req.onreadystatechange = function () {
                if(req.readyState==4){
                    var result = req.responseText;
                    alert(result);
                    location.reload();
                }
            }
            var mess=document.getElementById("me"+i).value;
            var data={"num":leavewordid,"text":mess};
            req.send('data='+JSON.stringify(data));
        }
    }

    function showreply(i,replyid)
    {
        for(var j = 0; j < replyid-3; j++) {
            var reply = document.getElementById('reply'+i+j);
            if (reply.style.display == 'none')
                reply.style.display = 'block';
            else
                reply.style.display = 'none';
        }

    }

    function reply(userid, textid, emotion)
    {
        document.getElementById(userid).style.display = "block";
        //alert(textid);
        $('.'+emotion).qqFace({

            id : 'facebox',

            assign:textid,

            path:'/images/'	//表情存放的路径

        });
    }

    function cancel(userid)
    {
        document.getElementById(userid).style.display = "none";
    }

    /*引入qq表情包*/
    $(function(){

        $('.emotion').qqFace({

            id : 'facebox',

            assign:'write-mess',

            path:'/images/'	//表情存放的路径

        });
    });

    //查看结果
    replace_em("mingming");
    replace_em("ming");
    function replace_em(str) {
        var str = document.getElementsByName(str);
        for (var i = 0; i < str.length; i++) {
            var sts=replace_ems(str[i].innerHTML);
            str[i].innerHTML=sts;
        }
    }

    function replace_ems(str){
        var str = str.replace(/\[em_([0-9]*)\]/g, '<img src="/images/$1.gif" border="0" />');
        return str;
    }



</script>

</body>
</html>

