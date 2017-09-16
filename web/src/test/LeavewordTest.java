
import com.web.dao.LeavewordDAO;
import com.web.entity.Leaveword;
import com.web.entity.Letter;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;


/**
 * Created by shiyi on 16/9/24.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:config/spring-MVC.xml"
        ,"classpath:config/spring-mybatis.xml"})
public class LeavewordTest {

    @Autowired
    private LeavewordDAO leavewordDAO;

    @Test
    public void insertLeaveword()
    {
        Leaveword leaveword=new Leaveword();
        leaveword.setFromid(1);
        leaveword.setToid(2);
        leaveword.setIsreply(2);
        leaveword.setContent("aa");
        leaveword.setCreatedate("2000-02-20 20:20:20");
        int flag=leavewordDAO.insertLeaveword(leaveword);
        System.out.println(flag);
    }

    @Test
    public void selectLeavewordFromId()
    {
        Leaveword leaveword=leavewordDAO.selectLeavewordFromId(2);
        System.out.println(leaveword.getCreatedate()+" "+leaveword.getIsreply());
    }

    @Test
    public void updateLeaveword()
    {
        Leaveword leaveword=new Leaveword();
        leaveword.setId(2);
        leaveword.setFromid(2);
        leaveword.setToid(2);
        leaveword.setIsreply(2);
        leaveword.setContent("2");
        leaveword.setCreatedate("2000-02-20 20:20:20");
        int flag=leavewordDAO.updateLeaveword(leaveword);
        System.out.println(flag);
    }

    @Test
    public void deleteLeaveword()
    {
        int flag=leavewordDAO.deleteLeaveword(3);
        System.out.println(flag);
    }

    @Test
    public void selectLeaveword()
    {
        Leaveword leaveword=new Leaveword();
//        leaveword.setFromid(1);
        leaveword.setToid(2);
//        leaveword.setIsreply(2);
//        leaveword.setCreatedate("2000-02-20 20:20:20");
        List<Leaveword> list=leavewordDAO.selectLeaveword(leaveword,0,2);
        for(Leaveword l:list){
            System.out.println(l.getId());
        }
    }

    @Test
    public void selectCountFromId()
    {
        int result=leavewordDAO.selectCountFromId(2,11);
        System.out.println(result);
    }
}
