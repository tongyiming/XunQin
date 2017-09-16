package com.web.service;

import com.web.entity.Gaminmess;
import com.web.entity.Gaminrecord;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.util.List;

/**
 * Created by shiyi on 2016/12/25.
 */
public interface GaminActionService {

    //获取寻人启事数
    public int getGaminMessCount();

    //获取寻人信息
    public List getGaminMess(int start, int num);

    public Gaminmess getGaminMessById(int id);

    public List<Gaminrecord> getGaminrecordByUserId(int id, int start, int size);

    public ServletFileUpload getFileData();

    public String uploadGaminMess(List<FileItem> uploaditems, String path);

    public boolean addGaminMess(String find_time, int age, int sex, int height, String find_place,
                                String feature, String picture_list, String other_message, int user_id);

    public boolean updateGaminMess(int id, String find_time, int age, int sex, int height,
                                   String find_place, String feature, String picture_list, String other_message);

    public int getUseridFromGaminid(int id);

    public int getGaminrecordMaxPage(int userid);

    public int deletegaminfromid(int gaminrecordid,int gaminmessid);
}
