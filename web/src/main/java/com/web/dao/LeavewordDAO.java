package com.web.dao;

import com.web.entity.Leaveword;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * Created by shiyi on 16/9/23.
 */

@Repository("LeavewordDAO")
public interface LeavewordDAO {

    public Leaveword selectLeavewordFromId(int id);

    public int selectCountFromId(int id, int isreply);

    public List<Leaveword> selectLeaveword(Leaveword leaveword, int start, int size);

    public int insertLeaveword(Leaveword leaveword);

    public int deleteLeaveword(int id);

    public int updateLeaveword(Leaveword leaveword);

}
