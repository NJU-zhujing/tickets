package cn.edu.nju.tickets.service;

import cn.edu.nju.tickets.po.VenueChangePO;
import cn.edu.nju.tickets.vo.ManagerStatisticsVO;

import java.util.List;

public interface ManageService {


    /**
     * 登陆
     * @param password
     * @return
     */
    boolean signIn(String password);

    /**
     * 展示审批列表
     * @return
     */
    List<VenueChangePO> showSignUpAndModifyVenueList();

    /**
     * 同意审批
     * @param
     * @return
     */
    boolean approve(int venueChangeId);

    /**
     * 不同意审批
     * @param
     * @return
     */
    boolean disapprove(int venueChangeId);

    /**
     * 展示统计信息
     * @return
     */
    ManagerStatisticsVO showStatistics();


    boolean accounts();

}
