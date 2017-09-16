<%@ page import="com.web.entity.Usermess" %><%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2017/2/8
  Time: 17:30
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

<!--窗口阴影-->
<div class="window-shadow"></div>

<!--主要内容-->
<div class="main-container">

    <%
        Usermess nowUser = (Usermess)request.getAttribute("nowUser");
        Usermess checkUser = (Usermess)request.getAttribute("checkUser");
    %>
    <div class="header-container">
        <div class="row">
            <%
                if(nowUser!=null && checkUser!=null){
                    if(nowUser.getId()==checkUser.getId()){
            %>
                <div class="col-md-2" style="padding:5%;">
                    <img src="/images/${checkUser.picture}" style="width:100px; height:100px;cursor:pointer"
                         id="myicon" onmouseover="showbtn()" onmouseout="hiddenbtn()">
                    <div class="onload-img-btn" onmouseover="showbtn()" onmouseout="hiddenbtn()" onClick="showMessdialog('.window-shadow','.modify-usericon')">更换图像</div>
                </div>
            <%
                }else{
            %>
                <div class="col-md-2" style="padding:5%"><img src="/images/${checkUser.picture}" style="width:100px; height:100px;"></div>
            <%
                }
                }else{
            %>
                <div class="col-md-2" style="padding:5%"><img src="/images/${checkUser.picture}" style="width:100px; height:100px;"></div>
            <%
                }
            %>
            <div class="col-md-5" style="padding:5%;">
                <div><h1>${checkUser.nickname}</h1></div>
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
            <a href="showmess" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;" id="self">基本信息</a>
            <a href="account" title="待完善" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;">账户信息</a>
            <a href="realmess" title="待完善" class="btn btn-link btn-link-move" style="text-decoration:none;font-size: 16px;">实名认证</a>

        </div>
        <!--信息查看框-->
        <div class="container-mess">
            <%
                if(nowUser!=null && checkUser!=null){
                    if(nowUser.getId()==checkUser.getId()){
            %>
                        <div class="img-update">
                            <a href="###" onClick="showMessdialog('.window-shadow','.modify-mess')"><img src="/images/edit.png" style="width:33%; height:100%">编辑</a>
                        </div>
            <%
                    }
                }
            %>
            <div class="row-mess">
                <div class="col-2-mess">昵称</div>
                <div class="col-10-mess">${checkUser.nickname}</div>
            </div>
            <div class="row-mess">
                <div class="col-2-mess">性别</div>
                <%
                    if(checkUser.getSex()==1){
                %>
                    <div class="col-10-mess">男</div>
                <%
                    }else if(checkUser.getSex()==0){
                %>
                    <div class="col-10-mess">女</div>
                <%
                    }else{
                %>
                    <div class="col-10-mess">不详</div>
                <%
                    }
                %>
            </div>
            <div class="row-mess">
                <div class="col-2-mess">年龄</div>
                <%
                    if(checkUser.getAge()!=0){
                %>
                        <div class="col-10-mess">${checkUser.age}</div>
                <%
                    }else{
                %>
                        <div class="col-10-mess">主人未进行填写</div>
                <%
                    }
                %>
            </div>
            <div class="row-mess">
                <div class="col-2-mess">电话</div>
                <%
                    if(checkUser.getTelephone()!=null){
                %>
                    <div class="col-10-mess">${checkUser.telephone}</div>
                <%
                }else{
                %>
                    <div class="col-10-mess">主人未进行填写</div>
                <%
                    }
                %>
            </div>
        </div>

        <!--信息修改框-->
        <div class="modify-mess">
            <div style="font-size:20px;font-weight:bold;display: flex;flex-direction: row;
			justify-content: space-between;padding:30px 30px 0px 30px;">
                <span>编辑个人信息</span>
                <span style="cursor: pointer" onClick="colseDialog('.window-shadow','.modify-mess')">X</span>
            </div>
            <hr>
            <form class="form-horizontal" role="form" action="/user/setprofile" method="post" style="padding-bottom:30px;width:90%">
                <div class="form-group" id="input-name">
                    <label for="nickname" class="col-sm-3 control-label">昵称:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" value="${nowUser.nickname}" id="nickname" name="nickname" autofocus placeholder="请输入你的昵称">
                    </div>
                </div>
                <div class="form-group" id="input-sex">
                    <label class="col-sm-3 control-label">性别:</label>
                    <%
                        if (nowUser.getSex() == 0)
                        {
                    %>
                    <label class="radio-inline">
                        <input type="radio"  value="1" name="usersex" style="margin-left:10px">男
                    </label>
                    <label class="radio-inline">
                        <input type="radio"  value="0" name="usersex"  checked>女
                    </label>
                    <%
                    }
                    else if (nowUser.getSex() == 1)
                    {
                    %>
                    <label class="radio-inline">
                        <input type="radio"  value="1" name="usersex" style="margin-left:10px" checked>男
                    </label>
                    <label class="radio-inline">
                        <input type="radio"  value="0" name="usersex">女
                    </label>
                    <%
                        }else{
                    %>
                    <label class="radio-inline">
                        <input type="radio"  value="1" name="usersex" style="margin-left:10px">男
                    </label>
                    <label class="radio-inline">
                        <input type="radio"  value="0" name="usersex">女
                    </label>
                    <%
                        }
                    %>
                </div>
                <div class="form-group" id="input-birthday">
                    <label for="userage" class="col-sm-3 control-label">年龄:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" value="${nowUser.age}" id="userage" name="userage" placeholder="输入你的年龄">
                    </div>
                </div>
                <div class="form-group" id="input-place">
                    <label  class="col-sm-3 control-label">籍贯:</label>
                    <div class="col-sm-9">
                        <div class="col-sm-3 address-padding">
                            <select class="form-control" id="s_province" name="s_province"></select>
                        </div>
                        <div class="col-sm-3 address-padding" id="city">
                            <select class="form-control" id="s_city" name="s_city"></select> 
                        </div>
                        <div class="col-sm-3 address-padding">
                            <select class="form-control" id="s_county" name="s_county" onChange="showArea()">
                            </select>
                        </div>
                        <div id="show"></div>
                    </div>
                </div>
                <div class="form-group" id="input-address">
                    <label for="useraddress" class="col-sm-3 control-label">详细地址:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="useraddress" name="useraddress" placeholder="输入你的详细地址">
                    </div>
                </div>
                <div class="form-group" id="input-phonenum">
                    <label for="userphonenum" class="col-sm-3 control-label">电话:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" value="${nowUser.telephone}" id="userphonenum" name="userphonenum" placeholder="输入你的联系电话">
                    </div>
                </div>
                <br><br>
                <div class="form-group">
                    <div class="col-sm-9">
                        <button type="submit" class="btn btn-primary btn-margin-left">提交</button>
                        <button type="reset" class="btn btn-default" style="margin-left:10%">重置</button>
                    </div>
                </div>

            </form>
        </div>

        <!--修改图像-->
        <div class="modify-usericon">
            <form action="/user/setpic" method="post">
                <div style="font-size:20px;font-weight:bold;display: flex;flex-direction: row;
			justify-content: space-between;padding: 20px;">
                    <span>更换图像</span>
                    <span style="cursor: pointer" onClick="colseDialog('.window-shadow','.modify-usericon')">X</span>
                </div>
                <img src="/images/${nowUser.picture}" id="picture" class="user-icon">
                <div class="choice-btn-group">
                    <div class="choice-btn">换一换</div>
                    <div class="choice-btn">上传图像
                        <input type="file" id="idfrontpic" name="idfrontpic" onChange="onloadImg(this.files)" class="icon-file"/>
                    </div>
                </div>
                <div style="display: flex; flex-direction: row; justify-content: space-around;margin:0 28%">
                    <button type="submit" class="btn btn-primary" onclick="upload()">提交</button>
                    <button type="reset" class="btn btn-default" onClick="colseDialog('.window-shadow','.modify-usericon')">取消</button>
                </div>
            </form>
        </div>

    </div>

</div>

<hr>
<%@include file="footer.jsp"%>

<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/area.js" type="text/javascript"></script>

<script type="text/javascript">
    _init_area();
    _init_place();

    function showbtn(){
        document.querySelector(".onload-img-btn").style.opacity = '0.5';
    }

    function hiddenbtn(){
        document.querySelector(".onload-img-btn").style.opacity = '0';
    }

    function showArea(){
        var province = document.getElementById("s_province").value;
        var city = document.getElementById("s_city").value;
        var country = "";
        var sel = document.getElementById("s_county");
        country = sel.options[sel.selectedIndex].value;
        document.getElementById("useraddress").value = province + city + country;
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

    var path;
    function upload(){

        var fileObj = document.getElementById("idfrontpic").files[0];
        var form = new FormData();
        form.append("picture_list", fileObj);
        var link = window.XMLHttpRequest?new XMLHttpRequest():new ActiveXObject("Microsoft.XMLHttp");
        link.open("post","/user/upload",true);
        link.onreadystatechange = function(){
            if(link.readyState == 4 && link.status == 200){

                alert("图片上传成功！");
                path = link.responseText;
            }
        };
        link.send(form);

    }

    var pic;
    function onloadImg(files)
    {
        if (files.length){
            var file = files[0];
            var reader = new FileReader();
            reader.onload = function(e) {
                pic = e.target.result;
                document.getElementById("picture").src = pic;
            }
            reader.readAsDataURL(file);
        }
    }
</script>

</body>
</html>
