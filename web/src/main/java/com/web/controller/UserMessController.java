package com.web.controller;

import com.web.entity.*;
import com.web.service.*;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by shiyi on 2016/12/16.
 * 用户个人主页
 */

@Controller("UserMessController")
@RequestMapping("/{username}")
public class UserMessController {

    @Autowired
    private GaminActionService gaminActionService;

    @Autowired
    private LostActionService lostActionService;

    @Autowired
    private UserService userService;

    @Autowired
    private LeavewordService leavewordService;

    @RequestMapping("")
    public ModelAndView getMess(@PathVariable("username")String username)
    {
        ModelAndView mav=null;
        try {
            if (userService.isUsernameExist(username)) {
                username = new String(username.getBytes("iso-8859-1"), "utf-8");
                mav = new ModelAndView("redirect:/" + username + "/lostrecord");
            }else{
                mav = new ModelAndView("errorpage");
                mav.addObject("error","该用户不存在!");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return mav;
    }

    //更新数据
    @RequestMapping("updatelost")
    public ModelAndView updatelost(HttpServletRequest request,@PathVariable("username")String username)
    {
        ModelAndView mav=null;
        if(request.getParameter("lostmessid")!=null && request.getParameter("lostmessid")!=null) {
            mav=new ModelAndView("updatelost");
            int id=Integer.parseInt(request.getParameter("lostmessid"));
            Lostmess lostmess=lostActionService.getLostmessFromId(id);
            mav.addObject("lostmess",lostmess);
        }else{
            mav = new ModelAndView("errorpage");
            mav.addObject("error","更新失败!");
        }
        return mav;
    }

    //删除记录
    @RequestMapping("delete")
    public ModelAndView delete(HttpServletRequest request,@PathVariable("username")String username)
    {
        int lostrecordid=0;
        int lostmessid=0;
        int flag=-1;
        ModelAndView mav=null;
        if(request.getParameter("lostrecordid")!=null && request.getParameter("lostmessid")!=null){
            lostrecordid=Integer.parseInt(request.getParameter("lostrecordid"));
            lostmessid=Integer.parseInt(request.getParameter("lostmessid"));
            flag=lostActionService.deletelostfromid(lostrecordid,lostmessid);
        }
        if(flag!=-1){
            try{
                username = new String(username.getBytes("iso-8859-1"), "utf-8");
                mav = new ModelAndView("redirect:/" + username + "/lostrecord");
            }catch (Exception e){
                e.printStackTrace();
            }
        }else{
            mav = new ModelAndView("errorpage");
            mav.addObject("error","删除失败!");
        }
        return mav;
    }

    //已发布的寻亲记录
    @RequestMapping("lostrecord")
    public ModelAndView lostrecord(HttpServletRequest request,@PathVariable("username")String username)
    {
        int size=3;
        int MaxPage=0;
        int nowPage=1;
        ModelAndView mav=new ModelAndView("myrecord");
        Usermess usermess=userService.getUserMessByUserName(username);
        mav.addObject("User",usermess);
        List<Lostrecord> lostrecordList=null;
        List<Lostmess> lostmessList=new ArrayList<Lostmess>();
        if(request.getParameter("nowpage")!=null && request.getParameter("nowpage")!=""){
            nowPage=Integer.parseInt(request.getParameter("nowpage"));
        }
        int id = userService.getidbyusername(username);

        if(id > 0) {
            lostrecordList=lostActionService.getLostrecordById(id,(nowPage-1)*size,size);
            if(lostrecordList.size()!=0) {
                for(Lostrecord lost:lostrecordList)
                {
                    Lostmess lostmess=new Lostmess();
                    lostmess=lostActionService.getLostmessFromId(lost.getLost_id());
                    lostmessList.add(lostmess);
                }
            }
            int max=lostActionService.getLostrecordMaxPage(id);
            MaxPage=max%size==0 ? max/size : max/size+1;

            Usermess user=userService.getUserMessByUserName(username);
            Usermess nowuser=null;
            if(request.getSession().getAttribute("userid")!=null){
                int uid = (Integer) request.getSession().getAttribute("userid");
                nowuser=userService.getUserMessByUserId(uid);
            }
            mav.addObject("nowUser",nowuser);
            mav.addObject("checkUser",user);
            mav.addObject("NowPage",nowPage);
            mav.addObject("Lostrecord",lostrecordList);
            mav.addObject("Lostmess",lostmessList);
            mav.addObject("MaxPage",MaxPage);
        }else {
            mav = new ModelAndView("errorpage");
            mav.addObject("error","该用户不存在!");
        }
        return mav;
    }

    //收到的留言
    @RequestMapping("leaveword")
    public ModelAndView leaveword(HttpServletRequest request,@PathVariable("username")String username)
    {
        int size=3;
        int MaxPage=0;
        int nowPage=1;
        ModelAndView mav=new ModelAndView("mynews");
        Usermess user=userService.getUserMessByUserName(username);
        mav.addObject("User",user);
        List<Leaveword> mainwords=null;
        List<Usermess> mainmess=new ArrayList<Usermess>();
        List leave=new ArrayList();
        List mess=new ArrayList();
        if(request.getParameter("nowpage")!=null && request.getParameter("nowpage")!=""){
            nowPage=Integer.parseInt(request.getParameter("nowpage"));
        }
        if(username!=null && username!="") {
            if(userService.getidbyusername(username)>0) {
                int id=userService.getidbyusername(username);
                mainwords = leavewordService.getLeavewordByToid(id, -1, (nowPage - 1) * size, size);
                if (mainwords.size() != 0) {
                    for (Leaveword leaveword : mainwords) {
                        List<Leaveword> leavewordList=new ArrayList<Leaveword>();
                        int num = leavewordService.getMaxPage(id,leaveword.getId());
                        if(num==0) {
                            leavewordList = null;
                        }else{
                            leavewordList = leavewordService.getLeavewordByToid(id, leaveword.getId(), 0, num);
                        }
                        leave.add(leavewordList);
                        if (leavewordList!=null && leavewordList.size() != 0) {
                            List<Usermess> usermesses=new ArrayList<Usermess>();
                            for (Leaveword l : leavewordList) {
                                Usermess users = new Usermess();
                                users = userService.getUserMessByUserId(l.getFromid());
                                usermesses.add(users);
                            }
                            mess.add(usermesses);
                        }else{
                            mess.add(null);
                        }
                        Usermess usermess = new Usermess();
                        usermess = userService.getUserMessByUserId(leaveword.getFromid());
                        mainmess.add(usermess);
                    }
                }
                int max = leavewordService.getMaxPage(id,-1);
                MaxPage = max % size == 0 ? max / size : max / size + 1;
            }
        }
        mav.addObject("NowPage",nowPage);
        mav.addObject("Word",leave);
        mav.addObject("Mess",mess);
        mav.addObject("Mainword",mainwords);
        mav.addObject("Mainmess",mainmess);
        mav.addObject("MaxPage",MaxPage);
        return mav;
    }

    //发布主留言信息
    @RequestMapping("addmainmess")
    public ModelAndView addmainmess(HttpServletRequest request,@PathVariable("username")String username)
    {
        ModelAndView mav=null;
        boolean flag=false;
        String mess=request.getParameter("write-mess");
        if(mess!=null && mess!=""){
            if(request.getSession().getAttribute("userid")!=null) {
                int id = (Integer) request.getSession().getAttribute("userid");
                int toid = userService.getidbyusername(username);
                flag = leavewordService.addLeaveword(mess,id,toid,-1);
            }
        }
        if(flag){
            try {
                username = new String(username.getBytes("iso-8859-1"), "utf-8");
                mav=new ModelAndView("redirect:/" + username + "/leaveword");
            }catch (Exception e){
                e.printStackTrace();
            }
        }else {
            mav = new ModelAndView("errorpage");
            mav.addObject("error","添加信息失败!");
        }
        return mav;
    }

    //对留言进行回复
    @RequestMapping(value="addLeaveword",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String addLeaveword(HttpServletRequest request,@PathVariable("username")String username)
    {
        String result=null;
        if(request.getSession().getAttribute("userid")==null){
            result="你尚未登陆,不能进行评论";
        }else {
            if(request.getParameter("data") != null && request.getParameter("data") != "") {
                int id = (Integer) request.getSession().getAttribute("userid");
                int toid = userService.getidbyusername(username);
                String mess = request.getParameter("data");
                JSONObject jsonObject=new JSONObject(mess);
                boolean flag=leavewordService.addLeaveword(jsonObject.getString("text"),id,toid,jsonObject.getInt("num"));
                if(flag){
                    result="评论成功";
                }else{
                    result="评论失败";
                }
            }
        }
        return result;
    }

    //系统消息
    @RequestMapping("systemmess")
    public ModelAndView systemmess(@PathVariable("username")String username)
    {
        ModelAndView mav = new ModelAndView("systemmess");
        Usermess usermess=userService.getUserMessByUserName(username);
        mav.addObject("User",usermess);
        return mav;
    }

    //用户信息
    @RequestMapping("showmess")
    public ModelAndView showmess(HttpServletRequest request,@PathVariable("username")String username)
    {
        ModelAndView mav = new ModelAndView("usermess");
        Usermess usermess=userService.getUserMessByUserName(username);
        Usermess nowuser=null;
        if(request.getSession().getAttribute("userid")!=null){
            int id = (Integer) request.getSession().getAttribute("userid");
            nowuser=userService.getUserMessByUserId(id);
        }
        mav.addObject("nowUser",nowuser);
        mav.addObject("checkUser",usermess);
        return mav;
    }

    //账户信息
    @RequestMapping("account")
    public ModelAndView account(HttpServletRequest request,@PathVariable("username")String username)
    {
        ModelAndView mav = new ModelAndView("account");
        return mav;
    }

    //实名认证
    @RequestMapping("realmess")
    public ModelAndView realmess(HttpServletRequest request,@PathVariable("username")String username)
    {
        ModelAndView mav = new ModelAndView("realmess");
        return mav;
    }

    //资料2库
    @RequestMapping("finddata")
    public void findData()
    {

    }

    //个人留言
    @RequestMapping("messboard")
    public void messBoard()
    {

    }

    //通知
    @RequestMapping("notices")
    public void notices()
    {

    }

    //寻亲启事
    @RequestMapping("actionlostmess")
    public void actionLostMess()
    {

    }

    //资料库
    @RequestMapping("actiondata")
    public void actionFindData()
    {

    }

    //通知
    @RequestMapping("actionnotices")
    public void actionNotices()
    {

    }

    //私信
    @RequestMapping("actionletter")
    public void actionletter()
    {

    }

    //通知设置
    @RequestMapping("setnotices")
    public void setnotices()
    {

    }

    //私信设置
    @RequestMapping("setletter")
    public void setLetter()
    {

    }

}
