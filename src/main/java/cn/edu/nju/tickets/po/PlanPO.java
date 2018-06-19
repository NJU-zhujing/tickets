package cn.edu.nju.tickets.po;

import cn.edu.nju.tickets.type.PlanType;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.TreeMap;


@Entity
public class PlanPO implements Serializable{
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    int id;

    private String name;

    private Date startTime;

    private Date endTime;

    @ManyToOne
    private VenuePO venuePO;

    @OneToMany(cascade = CascadeType.PERSIST,mappedBy="planPO")
    private List<TicketPO> ticketPOList;

    @OneToMany(fetch = FetchType.LAZY,cascade = CascadeType.PERSIST,mappedBy="planPO")
    private List<OrderPO> orderPOList;

    @Enumerated(EnumType.STRING)
    private PlanType planType;

    private String introduction;

    public PlanPO() {
    }

    public PlanPO(String name, Date startTime, Date endTime, VenuePO venuePO, List<TicketPO> ticketPOList, PlanType planType, String introduction) {
        this.name = name;
        this.startTime = startTime;
        this.endTime = endTime;
        this.venuePO = venuePO;
        this.ticketPOList = ticketPOList;
        this.planType = planType;
        this.introduction = introduction;
        Iterator iterator = ticketPOList.iterator();
        while (iterator.hasNext()){
            TicketPO ticketPO = (TicketPO) iterator.next();
            ticketPO.setPlanPO(this);
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public VenuePO getVenuePO() {
        return venuePO;
    }

    public void setVenuePO(VenuePO venuePO) {
        this.venuePO = venuePO;
    }

    public List<TicketPO> getTicketPOList() {
        return ticketPOList;
    }

    public void setTicketPOList(List<TicketPO> ticketPOList) {
        this.ticketPOList = ticketPOList;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public PlanType getPlanType() {
        return planType;
    }

    public void setPlanType(PlanType planType) {
        this.planType = planType;
    }

    public List<OrderPO> getOrderPOList() {
        return orderPOList;
    }

    public void setOrderPOList(List<OrderPO> orderPOList) {
        this.orderPOList = orderPOList;
    }
}
