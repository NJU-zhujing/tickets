package cn.edu.nju.tickets.po;

import cn.edu.nju.tickets.util.MemberUtil;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
public class UserPO implements Serializable{

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int id;

    @Column(unique=true)
    private String email;

    private String password;

    private boolean isActivated=false;

    private long activateTime;

    private String token;

    private boolean isCanceled = false;

    private double cost=0;

    private int memberPoints=0;

    @OneToOne
    private AccountPO accountPO;

    @OneToMany(fetch = FetchType.LAZY,mappedBy="userPO")
    private List<OrderPO> orderPOList;

    public UserPO() {
    }

    public UserPO(String email, String password, long activateTime, String token,AccountPO accountPO) {
        this.email = email;
        this.password = password;
        this.activateTime = activateTime;
        this.token = token;
        this.accountPO = accountPO;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean getIsActivated() {
        return isActivated;
    }

    public void setIsActivated(boolean activated) {
        isActivated = activated;
    }

    public long getActivateTime() {
        return activateTime;
    }

    public void setActivateTime(long activateTime) {
        this.activateTime = activateTime;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public boolean getIsCanceled() {
        return isCanceled;
    }

    public void setIsCanceled(boolean canceled) {
        isCanceled = canceled;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public void addCostAndMemberpoints(double cost) {
        this.cost += cost;
        this.memberPoints += MemberUtil.costToMemberpoints(cost);
    }

    public void minusCostAndMemberpoints(double cost) {
        this.cost = cost;
        this.memberPoints -= MemberUtil.costToMemberpoints(cost);
    }

    public int getMemberPoints() {
        return memberPoints;
    }

    public void setMemberPoints(int memberPoints) {
        this.memberPoints = memberPoints;
    }


    public List<OrderPO> getOrderPOList() {
        return orderPOList;
    }

    public void setOrderPOList(List<OrderPO> orderPOList) {
        this.orderPOList = orderPOList;
    }


    public AccountPO getAccountPO() {
        return accountPO;
    }

    public void setAccountPO(AccountPO accountPO) {
        this.accountPO = accountPO;
    }
}
