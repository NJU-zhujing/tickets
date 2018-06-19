package cn.edu.nju.tickets.vo;

import cn.edu.nju.tickets.po.VenuePO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ManagerStatisticsVO implements Serializable{

    private List<VenuePO> venuePOList;

    private int memberNum;

    private double income;


    public ManagerStatisticsVO() {
        venuePOList = new ArrayList<>();
    }

    public List<VenuePO> getVenuePOList() {
        return venuePOList;
    }

    public void setVenuePOList(List<VenuePO> venuePOList) {
        this.venuePOList = venuePOList;
    }

    public int getMemberNum() {
        return memberNum;
    }

    public void setMemberNum(int memberNum) {
        this.memberNum = memberNum;
    }

    public double getIncome() {
        return income;
    }

    public void addIncome(double income) {
        this.income += income;
    }
}
