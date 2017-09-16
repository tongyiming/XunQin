package com.web.controller;


import com.web.entity.Gaminmess;
import com.web.entity.Usermess;
import com.web.service.GaminActionService;
import com.web.service.UserService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by hjh on 16-12-26.
 */
@Controller("GaminmessController")
@RequestMapping("/gaminmess")
public class GaminmessController {

    @Autowired
    private GaminActionService gaminActionService;

    @Autowired
    private UserService userService;

    @RequestMapping("list")
    public ModelAndView showMoreLostMess(HttpServletRequest request)
    {
        int thenstart=1;
        int num=12;
        ModelAndView mdv = new ModelAndView("gaminlist");

        if(request.getParameter("thenstart")!=null
                && request.getParameter("thenstart")!="")
        {
            thenstart = Integer.parseInt(request.getParameter("thenstart"));
        }

        List<Gaminmess> gaminmessList = gaminActionService.getGaminMess((thenstart-1)*num, num);
        mdv.addObject("GaminList", gaminmessList);

        int gaminNum = gaminActionService.getGaminMessCount();
        int pageNum = gaminNum%num==0?gaminNum/num:gaminNum/num+1;
        mdv.addObject("GaminMessCount", gaminNum);
        mdv.addObject("pagemax", pageNum);
        mdv.addObject("pagenow", thenstart);

        return mdv;
    }

    //信息详情页
    @RequestMapping("{gaminId}")
    public ModelAndView showOneLostMess(@PathVariable int gaminId)
    {

        ModelAndView mdv = new ModelAndView("gaminmess");
        Gaminmess gaminmess = gaminActionService.getGaminMessById(gaminId);
        int userid=gaminActionService.getUseridFromGaminid(gaminId);
        Usermess usermess=null;
        if(userid!=-1){
            usermess=userService.getUserMessByUserId(userid);
        }

        mdv.addObject("user",usermess);
        mdv.addObject("gaminmess", gaminmess);

        return mdv;
    }

    @RequestMapping("/upload")
    public ModelAndView uploadGaminMess(HttpServletRequest request, HttpServletResponse response) throws Exception {

        ServletFileUpload sfu = gaminActionService.getFileData();
        List<FileItem> list = sfu.parseRequest(request);

        String path = request.getServletContext().getRealPath("/");
        path += "WEB-INF/static/picture";
        String load = gaminActionService.uploadGaminMess(list, path);

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println(load);


        return null;

    }

    @RequestMapping("/add")
    public ModelAndView addGaminMess(HttpServletRequest request) throws IOException {

        int user_id = 0;
        String data = request.getParameter("data");
        JSONObject object = new JSONObject(data);
        String find_time = object.getString("find_time");
        int age = object.getInt("age");
        int sex = object.getInt("sex");
        int height = object.getInt("height");
        String find_place = object.getString("find_place");
        String feature = object.getString("feature");
        String picture_list = object.getString("picture_list");
        String other_message = object.getString("other_message");

        if(request.getSession().getAttribute("userid")!=null){
            user_id=(Integer)request.getSession().getAttribute("userid");
        }

        boolean result = gaminActionService.addGaminMess(find_time, age, sex, height,
                find_place, feature, picture_list, other_message, user_id);

        return null;
    }


    @RequestMapping("/uploads")
    public String uploads(HttpServletRequest request){

        return "uploadgamin";
    }


    @RequestMapping("/searchone")
    public ModelAndView searchoneLostMess(HttpServletRequest request){

        String num = request.getParameter("id");
        int id = Integer.parseInt(num);
        Gaminmess gaminmess = gaminActionService.getGaminMessById(id);
        request.setAttribute("gaminmess", gaminmess);

        return new ModelAndView("updategamin");


    }

    @RequestMapping("/update")
    public ModelAndView updateLostMess(HttpServletRequest request){

        String data = request.getParameter("data");
        JSONObject object = new JSONObject(data);
        int id = object.getInt("id");
        String find_time = object.getString("find_time");
        int age = object.getInt("age");
        int sex = object.getInt("sex");
        int height = object.getInt("height");
        String find_place = object.getString("find_place");
        String feature = object.getString("feature");
        String picture_list = object.getString("picture_list");
        String other_message = object.getString("other_message");

        boolean result = gaminActionService.updateGaminMess(id,find_time, age, sex, height,
                find_place, feature, picture_list, other_message);

        return null;
    }
}
