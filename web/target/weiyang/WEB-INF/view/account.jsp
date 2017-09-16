<%--
Created by IntelliJ IDEA.
User: shiyi
Date: 2016/12/20
Time: 下午4:15
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>寻亲网——个人信息</title>
    <link href="/css/usermess.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="/js/html5shiv.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->

    <style>
        .error
        {
            background:#F73F52;
            border-radius:5px;
            color:#FFEA85;
            display:none;
        }
       
    </style>

</head>

<body>
<!-- 顶部导航 -->
<%@include file="normal_nav.jsp"%>

<!-- 移动设备导航栏 -->
<%@include file="mobile_nav.jsp"%>

<!--窗口阴影-->
<div class="window-shadow"></div>

<!--密码修改框-->
<div class="modify-pass">
    <div style="font-size:20px;font-weight:bold;display: flex;flex-direction: row;
			justify-content: space-between;padding:30px 30px 0px 30px;">
        <span>修改密码</span>
        <span style="cursor: pointer" onClick="colseDialog('.window-shadow','.modify-pass')">X</span>
    </div>
    <hr>
    <form class="form-horizontal" role="form" action="/user/changepass" method="post"
          onsubmit="return checkReNewPass()" style="padding-bottom:30px;width:90%">
        <div class="form-group">
            <label for="useroldpass" class="col-sm-3 control-label">旧密码:</label>
            <div class="col-sm-9">
                <input type="password" class="form-control mess" id="useroldpass" name="useroldpass" autofocus placeholder="旧密码" onBlur="checkOldPass()"/>
                <span class="error" id="oldpass"></span>
            </div>
        </div>

        <div class="form-group">
            <label for="userpass" class="col-sm-3 control-label">新密码:</label>
            <div class="col-sm-9">
                <input type="password" class="form-control mess" id="userpass" name="userpass" placeholder="新密码" onBlur="checkPass()"/>
                <span class="error" id="passspan"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="userrepass" class="col-sm-3 control-label">确认密码:</label>
            <div class="col-sm-9">
                <input type="password" class="form-control mess" id="userrepass" name="userrepass" placeholder="确认密码" onBlur="checkRepass()"/>
                <span class="error" id="repassspan"></span>
            </div>
        </div>
        <br>
        <div class="form-group">
            <div class="col-sm-9">
                <button type="submit" class="btn btn-primary btn-margin-left">提交</button>
                <button type="reset" class="btn btn-default" style="">重置</button>
            </div>
        </div>
        <div id="error" style="text-align: center;color: red;padding-left:12%">

        </div>
    </form>
</div>
<!--主要内容-->
<div class="main-container">
    <div class="header-container">
        <div class="row">
            <div class="col-md-2" style="padding:5%"><img src="/images/${UserMess.picture}" style="width:100px; height:100px;"></div>
            <div class="col-md-5" style="padding:5%">
                <div><h1>${UserMess.nickname}</h1></div>
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
            <a href="leaveword" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;">我的留言</a>
            <a href="systemmess" disabled="true" title="待完善" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;">系统消息</a>
            <a href="showmess" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;">基本信息</a>
            <a href="account" title="待完善" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;" id="self">账户信息</a>
            <a href="realmess" title="待完善" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;">实名认证</a>

        </div>
        <div class="row" style="margin-top:20px">
            <div class="col-md-3" >
                <font class="third-title">邮箱</font>
                <font class="binding">&nbsp;未绑定</font><br>
                <font class="description">可用邮箱加密码登录寻亲网</font>
            </div>
            <div class="col-md-2  col-md-offset-7">
                <div class="btn btn-primary">立即绑定</div>
            </div>
        </div>
        <hr>
        <div class="row"  style="color:#000;font-weight:900">
            <div class="col-md-3">
                <font class="third-title">手机</font>
                <font class="binding">&nbsp;未绑定</font><br>
                <font class="description">可用手机加密码登录寻亲网</font>
            </div>
            <div class="col-md-2 col-md-offset-7">
                <div class="btn btn-primary">立即绑定</div>
            </div>
        </div>
        <hr>
        <div class="row"  style="color:#000;font-weight:900">
            <div class="col-md-3">
                <font class="third-title">密码</font>
                <font class="binding">&nbsp;已设置</font></div>
            <div class="col-md-2  col-md-offset-7">
                <div class="btn btn-primary" onclick="showMessdialog('.window-shadow','.modify-pass')">修改</div>
            </div>
        </div>
        <hr>
        <div class="row"  style="color:#000;font-weight:900">
            <div class="col-md-3">
                <font class="third-title">社交帐号</font><br>
                <font class="description">第三方可直接登录</font>
            </div>
        </div>
        <br>
        <div class="row" align="center">
            <div class="col-md-4">
                <div class="third-col">
                    <img src="/images/qq.png">
                    <a class="btn btn-primary" style="margin:20%">立即绑定</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="third-col">
                    <img src="/images/weixin.png">
                    <a class="btn btn-primary" style="margin:20%">立即绑定</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="third-col">
                    <img src="/images/weibo.png">
                    <a class="btn btn-primary" style="margin:20%">立即绑定</a>
                </div>
            </div>
            
        </div>
        
     </div>
            
</div>

<hr>
<%@include file="footer.jsp"%>



<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/register.js"></script>

<script type="text/javascript">
    var oldflag = 0;
    var newflag = 0;
    var renewflag = 0;

    function checkOldPass()
    {
        var userpass = document.getElementById("useroldpass");
        var passspan = document.getElementById("oldpass");
        var reg = /^\w{6,16}$/;
        if (userpass.value == "")
        {
            userpass.style.borderColor = "#F73F52";
            passspan.innerHTML = "密码不能为空";
            passspan.style.display = "block";
            return false;
        }
        else if(!reg.test(userpass.value))
        {
            userpass.style.borderColor = "#F73F52";
            passspan.innerHTML = "密码格式为字母数字下划线，长度6-16位";
            passspan.style.display = "block";
            return false;
        }
        else
        {
            userpass.style.borderColor = "#ccc";
            passspan.style.display = "none";
            oldflag = 1;
            return true;
        }
    }

    function checkNewPass()
    {
        var userpass = document.getElementById("userpass");
        var passspan = document.getElementById("passspan");
        var reg = /^\w{6,16}$/;
        if (userpass.value == "")
        {
            userpass.style.borderColor = "#F73F52";
            passspan.innerHTML = "密码不能为空";
            passspan.style.display = "block";
            return false;
        }
        else if(!reg.test(userpass.value))
        {
            userpass.style.borderColor = "#F73F52";
            passspan.innerHTML = "密码格式为字母数字下划线，长度6-16位";
            passspan.style.display = "block";
            return false;
        }
        else
        {
            userpass.style.borderColor = "#ccc";
            passspan.style.display = "none";
            newflag = 1;
            return true;
        }
    }

    function checkReNewPass()
    {
        var repass = document.getElementById("userrepass");
        var passspan = document.getElementById("repassspan");
        var pass = document.getElementById("userpass");
        var reg = /^\w{6,16}$/;
        if (repass.value == "")
        {
            repass.style.borderColor = "#F73F52";
            passspan.innerHTML = "密码不能为空";
            passspan.style.display = "block";
            return false;
        }
        else if(!reg.test(repass.value))
        {
            repass.style.borderColor = "#F73F52";
            passspan.innerHTML = "密码格式为字母数字下划线，长度6-16位";
            passspan.style.display = "block";
            return false;
        }
        else if (repass.value !== pass.value){
            repass.style.borderColor = "#F73F52";
            passspan.innerHTML = "两次密码不相等";
            passspan.style.display = "block";
            return false;
        }
        else
        {
            repass.style.borderColor = "#ccc";
            passspan.style.display = "none";
            renewflag = 1;
            return true;
        }
    }

    function checkAll(){
        if (oldflag == 1 && newflag == 1 && renewflag == 1) {
            return true;
        }
        else {
            return false;
        }
    }


    function showMessdialog(shadow, modify)
    {
        var shadow_div = document.querySelector(shadow);
        var modify_div = document.querySelector(modify);
        shadow_div.style.display = "block";
        modify_div.style.display = "block";
    }

    function colseDialog(shadow, modify)
    {
        var shadow_div = document.querySelector(shadow);
        var modify_div = document.querySelector(modify);
        shadow_div.style.display = "none";
        modify_div.style.display = "none";
    }

    <%
        String mess=request.getParameter("error");
        if (mess != null)
        {
            mess=new String(mess.getBytes("iso-8859-1"), "utf-8");
    %>
            document.getElementById("error").innerHTML = <%=mess%>;
            showMessdialog('.window-shadow','.modify-pass');
    <%
        }
    %>

</script>

</body>
</html>
