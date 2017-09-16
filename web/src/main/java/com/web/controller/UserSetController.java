package com.web.controller;

import com.web.entity.User;
import com.web.entity.Usermess;
import com.web.service.UserService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by shiyi on 2016/12/16.
 * 个人设置类
 */
@Controller("UserSetController")
@RequestMapping("/user")
public class UserSetController {

    @Autowired
    private UserService userService;

    //修改密码
    @RequestMapping("changepass")
    public ModelAndView changepass(HttpServletRequest request)
    {
        ModelAndView mav=null;
        String useroldpass=null;
        String userpass=null;
        if(request.getParameter("useroldpass")!=null && request.getParameter("useroldpass")!="") {
            useroldpass = request.getParameter("useroldpass");
        }
        if(request.getParameter("userpass")!=null && request.getParameter("userpass")!="") {
            userpass = request.getParameter("userpass");
        }
        if(request.getSession().getAttribute("userid")!=null) {
            int id = (Integer) request.getSession().getAttribute("userid");
            User user=userService.getUserById(id);
            if(user!=null){
                if(useroldpass.equals(user.getPassword())){
                    user.setPassword(userpass);
                    int flag=userService.changeUserPass(user);
                    if(flag!=-1){
                        Usermess usermess=userService.getUserMessByUserId(id);
                        mav=new ModelAndView("redirect:/" + usermess.getUsername() + "/account");
                    }else{
                        mav = new ModelAndView("errorpage");
                        mav.addObject("error","修改失败!");
                    }
                }else{
                    Usermess usermess=userService.getUserMessByUserId(id);
                    mav=new ModelAndView("redirect:/" + usermess.getUsername() + "/account?error='输入密码错误'");
                }
            }
        }
        return mav;
    }

    @RequestMapping("upload")
    public void uploadLostMess(HttpServletRequest request, HttpServletResponse response) throws Exception {

        ServletFileUpload sfu = userService.getFileData();
        List<FileItem> list = sfu.parseRequest(request);

        String path = request.getServletContext().getRealPath("/");
        path += "WEB-INF/static/images";
        String load = userService.upload(list, path);

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println(load);
    }

    @RequestMapping("setpic")
    public ModelAndView setpic(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav=null;
        if(request.getSession().getAttribute("userid")!=null) {
            int id = (Integer) request.getSession().getAttribute("userid");
            Usermess usermess=userService.getUserMessByUserId(id);
            if(request.getParameter("idfrontpic")!=null && request.getParameter("idfrontpic")!="") {
                String pic=request.getParameter("idfrontpic");
                usermess.setPicture(pic);
                int flag = userService.updateUserMess(usermess);
                if(flag==1) {
                    request.getSession().setAttribute("UserMess", usermess);
                    mav = new ModelAndView("redirect:/" + usermess.getUsername() + "/showmess");
                }else{
                    mav = new ModelAndView("errorpage");
                    mav.addObject("error","添加信息失败!");
                }
            }
        }else{
            System.out.println("尚未登录");
        }
        return mav;
    }

    //基本信息
    @RequestMapping("setprofile")
    public ModelAndView viewSetprofile(HttpServletRequest request)
    {
        Usermess usermess=null;
        ModelAndView mav=null;
        if(request.getSession().getAttribute("userid")!=null) {
            int id = (Integer) request.getSession().getAttribute("userid");
            usermess=userService.getUserMessByUserId(id);
            if (request.getParameter("nickname") != null && request.getParameter("nickname") != "") {
                usermess.setNickname(request.getParameter("nickname"));
            }
            if (request.getParameter("usersex") != null && request.getParameter("usersex") != "") {
                usermess.setSex(Integer.parseInt(request.getParameter("usersex")));
            }
            if (request.getParameter("userphonenum") != null && request.getParameter("userphonenum") != "") {
                usermess.setTelephone(request.getParameter("userphonenum"));
            }
            if (request.getParameter("userage") != null && request.getParameter("userage") != "") {
                usermess.setAge(Integer.parseInt(request.getParameter("userage")));
            }
            int flag=userService.updateUserMess(usermess);
            if(flag==1) {
                request.getSession().setAttribute("UserMess", usermess);
                mav = new ModelAndView("redirect:/" + usermess.getUsername() + "/showmess");
            }else{
                mav = new ModelAndView("errorpage");
                mav.addObject("error","更新数据失败!");
            }
        }else{
            mav = new ModelAndView("errorpage");
            mav.addObject("error","未登陆!");
        }

        return mav;
    }

    //帐号绑定
    @RequestMapping("setbindsns")
    public void viewSetBindsns()
    {

    }

    //收货地址
    @RequestMapping("setaddress")
    public void viewSetAddress()
    {

    }

    //实名认证
    @RequestMapping("setrealmess")
    public void viewSetRealMess()
    {

    }

    //更改基本信息
    @RequestMapping("ajaxprofile")
    public void ajaxSetprofile()
    {

    }

    //更改帐号绑定
    @RequestMapping("ajaxbindsns")
    public void ajaxSetBindsns()
    {

    }

    //更改收货地址
    @RequestMapping("ajaxaddress")
    public void ajaxSetAddress()
    {

    }

    //更改实名认证
    @RequestMapping("ajaxrealmess")
    public void ajaxSetRealMess()
    {

    }

}
