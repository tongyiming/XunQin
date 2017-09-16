package com.web.service;

import com.web.entity.Leaveword;
import com.web.entity.Letter;

import java.util.List;

/**
 * Created by Administrator on 2017/1/19 0019.
 */
public interface LeavewordService {
    public boolean addLeaveword(String mess, int fromid, int toid, int isreply);
    public int getMaxPage(int id, int isreply);
    public List<Leaveword> getLeavewordByToid(int id, int isreply, int start, int size);
}
