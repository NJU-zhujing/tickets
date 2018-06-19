package cn.edu.nju.tickets.po;

import cn.edu.nju.tickets.type.OrderStatus;

import javax.persistence.*;
import javax.persistence.criteria.Order;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@Entity
public class OrderPO {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int id;

    @ManyToOne
    private UserPO userPO;

    @ManyToOne
    private PlanPO planPO;

    @OneToMany(cascade = CascadeType.PERSIST,mappedBy="orderPO")
    private List<TicketPO> ticketPOList;

    private Date createTime;

    @Enumerated(EnumType.STRING)
    private OrderStatus status = OrderStatus.Created;

    private double cost = 0;

    public OrderPO() {

    }

    public OrderPO(UserPO userPO,PlanPO planPO,List<TicketPO> ticketPOList, Date createTime) {
        this.userPO = userPO;
        this.planPO = planPO;
        this.ticketPOList = ticketPOList;
        this.createTime = createTime;

        Iterator iterator = ticketPOList.iterator();
        while (iterator.hasNext()){
            TicketPO ticketPO = (TicketPO) iterator.next();
            ticketPO.setOrderPO(this);
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public UserPO getUserPO() {
        return userPO;
    }

    public void setUserPO(UserPO userPO) {
        this.userPO = userPO;
    }

    public PlanPO getPlanPO() {
        return planPO;
    }

    public void setPlanPO(PlanPO planPO) {
        this.planPO = planPO;
    }

    public List<TicketPO> getTicketPOList() {
        return ticketPOList;
    }

    public void setTicketPOList(List<TicketPO> ticketPOList) {
        this.ticketPOList = ticketPOList;
    }

    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }


}
