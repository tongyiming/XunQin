package com.web.serviceImpl;

import com.web.dao.LeavewordDAO;
import com.web.dao.LetterDAO;
import com.web.dao.UsermessDAO;
import com.web.entity.Leaveword;
import com.web.entity.Letter;
import com.web.entity.Usermess;
import com.web.service.LeavewordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

/**
 * Created by shiyi on 2016/12/19.
 */
@Service("LeavewordService")
public class LeavewordServiceImpl implements LeavewordService {

    @Autowired
    private LeavewordDAO leavewordDAO;

    public boolean addLeaveword(String mess, int fromid, int toid, int isreply){
        boolean flag=false;
        if(mess!=null && fromid>0 && toid>0){
            Leaveword leaveword=new Leaveword();
            leaveword.setFromid(fromid);
            leaveword.setToid(toid);
            leaveword.setContent(mess);
            leaveword.setIsreply(isreply);
            Calendar cal = Calendar.getInstance();
            SimpleDateFormat formats = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String pubdate = formats.format(cal.getTime());
            leaveword.setCreatedate(pubdate);
            int result=leavewordDAO.insertLeaveword(leaveword);
            if(result==1){
                flag=true;
            }
        }
        return flag;
    }

    public List<Leaveword> getLeavewordByToid(int id, int isreply, int start, int size)
    {
        List<Leaveword> leavewordList=null;
        if(id>0 && start>=0 && size>0){
            Leaveword leaveword=new Leaveword();
            leaveword.setToid(id);
            leaveword.setIsreply(isreply);
            leavewordList=leavewordDAO.selectLeaveword(leaveword,start,size);
        }
        return leavewordList;
    }

    public int getMaxPage(int id, int isreply){
        return leavewordDAO.selectCountFromId(id,isreply);
    }
}
