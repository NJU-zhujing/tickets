package cn.edu.nju.tickets.po;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class ManagerPO implements Serializable{
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int id;//

    private String password;//

    private double income = 0;//

    @OneToOne
    private AccountPO accountPO;

    public ManagerPO() {
    }

    public ManagerPO(String password,AccountPO accountPO) {
        this.password = password;
        this.accountPO = accountPO;
    }

    public double getIncome() {
        return income;
    }


    public void addIncome(double income) {
        this.income += income;
    }

    public void minusIncome(double income) {
        this.income -= income;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public void setIncome(double income) {
        this.income = income;
    }

    public AccountPO getAccountPO() {
        return accountPO;
    }

    public void setAccountPO(AccountPO accountPO) {
        this.accountPO = accountPO;
    }
}
