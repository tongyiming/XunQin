package com.web.service;

import com.web.entity.Lostrecord;
import com.web.entity.User;
import com.web.entity.Usermess;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.util.List;

/**
 * Created by Administrator on 2016/12/31 0031.
 */
public interface UserService {
    public boolean isEmailExist(String email);
    public boolean isUsernameExist(String username);
    public int insertuser(String email,String username,String userpass);
    public int login(String email, String password, String number, String code);
    public int getidbyemail(String email);
    public int getidbyusername(String username);
    public String upload(List<FileItem> uploaditems, String path);
    public ServletFileUpload getFileData();
    public Usermess addUserMess(int userid,String username,String nickname,String sex,String tel,String age);
    public int updateUserMess(Usermess usermess);
    public Usermess getUserMessByUserId(int userid);
    public User getUserById(int id);
    public int changeUserPass(User user);
    public Usermess getUserMessByUserName(String username);
}
