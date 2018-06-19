package cn.edu.nju.tickets.po;

import cn.edu.nju.tickets.type.ChangeType;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class VenueChangePO implements Serializable {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int id;

    @Column(unique = true)
    private String code;

    @Column(unique = true)
    private String name;

    private String introduction;

    private String location;

    private int seatNum;

    @OneToOne
    private AccountPO accountPO;

    @Enumerated(EnumType.STRING)
    private ChangeType changeType;

    public VenueChangePO() {
    }

    public VenueChangePO(String code, String name, String introduction, String location, int seatNum, ChangeType changeType,AccountPO accountPO) {
        this.code = code;
        this.name = name;
        this.introduction = introduction;
        this.location = location;
        this.seatNum = seatNum;
        this.changeType = changeType;
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

    public ChangeType getChangeType() {
        return changeType;
    }

    public void setChangeType(ChangeType changeType) {
        this.changeType = changeType;
    }

    public AccountPO getAccountPO() {
        return accountPO;
    }

    public void setAccountPO(AccountPO accountPO) {
        this.accountPO = accountPO;
    }
}
