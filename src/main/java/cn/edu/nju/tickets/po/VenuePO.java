package cn.edu.nju.tickets.po;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
public class VenuePO implements Serializable {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int id;

    @Column(unique=true)
    private String code;

    @Column(unique=true)
    private String name;

    private String introduction;

    private String location;

    private int seatNum;

    private double income = 0;

    @OneToOne
    private AccountPO accountPO;

    @OneToMany(fetch = FetchType.LAZY,mappedBy="venuePO")
    private List<PlanPO> planPOList;

    public VenuePO() {
    }

    public VenuePO(String code, String name, String introduction, String location, int seatNum, AccountPO accountPO) {
        this.code = code;
        this.name = name;
        this.introduction = introduction;
        this.location = location;
        this.seatNum = seatNum;
        this.accountPO = accountPO;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getSeatNum() {
        return seatNum;
    }

    public void setSeatNum(int seatNum) {
        this.seatNum = seatNum;
    }


    public List<PlanPO> getPlanPOList() {
        return planPOList;
    }

    public void setPlanPOList(List<PlanPO> planPOList) {
        this.planPOList = planPOList;
    }

    public double getIncome() {
        return income;
    }

    public void setIncome(double income) {
        this.income = income;
    }

    public void addIncome(double income) {
        this.income += income;
    }

    public void minusIncome(double income) {
        this.income -= income;
    }

    public AccountPO getAccountPO() {
        return accountPO;
    }

    public void setAccountPO(AccountPO accountPO) {
        this.accountPO = accountPO;
    }
}
