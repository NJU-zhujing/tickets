package cn.edu.nju.tickets.vo;

import cn.edu.nju.tickets.po.UserPO;
import cn.edu.nju.tickets.util.MemberUtil;

import java.io.Serializable;

public class UserVO implements Serializable {

    private UserPO userPO;

    private UserStatisticsVO userStatisticsVO;

    private int memberLevel;


    public UserVO(UserPO userPO, UserStatisticsVO userStatisticsVO) {
        this.userPO = userPO;
        this.userStatisticsVO = userStatisticsVO;
        memberLevel = MemberUtil.getLevel(userPO.getMemberPoints());

    }

    public UserPO getUserPO() {
        return userPO;
    }

    public void setUserPO(UserPO userPO) {
        this.userPO = userPO;
    }

    public void setUserStatisticsVO(UserStatisticsVO userStatisticsVO) {
        this.userStatisticsVO = userStatisticsVO;
    }

    public UserStatisticsVO getUserStatisticsVO() {
        return userStatisticsVO;
    }

    public int getMemberLevel() {
        return memberLevel;
    }


}
