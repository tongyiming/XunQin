package com.web.service;


import com.web.entity.Blogleave;
import com.web.entity.Blogmain;

import java.util.List;

/**
 * Created by Administrator on 2016/12/31 0031.
 */
public interface BlogService {
    public List<Blogmain> getBlogmain(int start, int size);
    public int getMaxPage();
    public int addBlogmain(int userid,String title,String content);
    public int addBlogleave(int leave_id,int receive_id,int main_id,String leave_content);
    public Blogmain getBlogmainById(int id);
    public List<Blogleave> getBlogleave(int receive_id,int main_id,int start, int size);
    public List<Blogleave> getBlogleave(int receive_id,int main_id);
    public int getMaxByBlogleave(int receive_id,int main_id);
}
