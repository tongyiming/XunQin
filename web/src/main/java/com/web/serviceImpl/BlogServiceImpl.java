package com.web.serviceImpl;

import com.web.dao.BlogleaveDAO;
import com.web.dao.BlogmainDAO;
import com.web.dao.UsermessDAO;
import com.web.entity.Blogleave;
import com.web.entity.Blogmain;
import com.web.entity.Usermess;
import com.web.service.BlogService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;


/**
 * Created by shiyi on 2016/12/19.
 */
@Service("BlogService")
public class BlogServiceImpl implements BlogService {

    @Autowired
    private BlogmainDAO blogmainDAO;

    @Autowired
    private UsermessDAO usermessDAO;

    @Autowired
    private BlogleaveDAO blogleaveDAO;

    public int addBlogmain(int userid,String title,String content){
        int flag=-1;
        if(userid>0){
            Blogmain blogmain=new Blogmain();
            blogmain.setUser_id(userid);
            blogmain.setTitle(title);
            blogmain.setContent(content);
            Calendar cal = Calendar.getInstance();
            SimpleDateFormat formats = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String pubdate = formats.format(cal.getTime());
            blogmain.setCreatedate(pubdate);
            Usermess usermess=new Usermess();
            usermess.setUser_id(userid);
            List<Usermess> usermessList=usermessDAO.selectUsermess(usermess,0,1);
            int love_count=0;
            if(usermessList.size()!=0){
                love_count=usermessList.get(0).getLove_count();
            }
            blogmain.setHeart_num(love_count);
            flag=blogmainDAO.insertBlogmain(blogmain);
        }
        return flag;
    }

    public List<Blogmain> getBlogmain(int start, int size){
        List<Blogmain> blogmains=null;
        Blogmain blogmain=new Blogmain();
        blogmains=blogmainDAO.selectBlogmain(blogmain,start,size);
        return blogmains;
    }

    public int getMaxPage(){
        int count=0;
        count=blogmainDAO.selectCount();
        return count;
    }

    public int addBlogleave(int leave_id,int receive_id,int main_id,String leave_content){
        int flag=-1;
        if(leave_content!=null && leave_content!=""){
            Blogleave blogleave=new Blogleave();
            blogleave.setLeave_id(leave_id);
            blogleave.setReceive_id(receive_id);
            blogleave.setMain_id(main_id);
            blogleave.setLeave_content(leave_content);
            Calendar cal = Calendar.getInstance();
            SimpleDateFormat formats = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String pubdate = formats.format(cal.getTime());
            blogleave.setCreatedate(pubdate);
            Usermess usermess=new Usermess();
            usermess.setUser_id(leave_id);
            List<Usermess> usermessList=usermessDAO.selectUsermess(usermess,0,1);
            int love_count=0;
            if(usermessList.size()!=0){
                love_count=usermessList.get(0).getLove_count();
            }
            blogleave.setHeart_num(love_count);
            flag=blogleaveDAO.insertBlogleave(blogleave);
        }
        return flag;
    }

    public Blogmain getBlogmainById(int id){
        Blogmain blogmain=null;
        if(id>0){
            blogmain=blogmainDAO.selectBlogmainFromId(id);
        }
        return blogmain;
    }

    public List<Blogleave> getBlogleave(int receive_id,int main_id,int start, int size){
        List<Blogleave> blogleaveList=new ArrayList<Blogleave>();
        Blogleave blogleave=new Blogleave();
        if(main_id>0) {
            blogleave.setReceive_id(receive_id);
            blogleave.setMain_id(main_id);
            blogleaveList=blogleaveDAO.selectBlogleave(blogleave,start,size);
        }
        return blogleaveList;
    }

    public List<Blogleave> getBlogleave(int receive_id,int main_id){
        List<Blogleave> blogleaveList=new ArrayList<Blogleave>();
        Blogleave blogleave=new Blogleave();
        if(main_id>0) {
            int size=blogleaveDAO.getCountByBlogleave(blogleave);
            blogleave.setReceive_id(receive_id);
            blogleave.setMain_id(main_id);
            blogleaveList=blogleaveDAO.selectBlogleave(blogleave,0,size);
        }
        return blogleaveList;
    }

    public int getMaxByBlogleave(int receive_id,int main_id){
        int max=1;
        Blogleave blogleave=new Blogleave();
        if(main_id>0) {
            blogleave.setReceive_id(receive_id);
            blogleave.setMain_id(main_id);
            max=blogleaveDAO.getCountByBlogleave(blogleave);
        }
        return max;
    }
}
