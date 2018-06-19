package cn.edu.nju.tickets.po;

import cn.edu.nju.tickets.type.TicketStatus;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class TicketPO implements Serializable{
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int id;

    private String code;

    @ManyToOne
    private OrderPO orderPO;

    @ManyToOne
    private PlanPO planPO;

    private int seatNum;

    private double price;

    @Enumerated(EnumType.STRING)
    private TicketStatus ticketStatus = TicketStatus.OnSale;


    public TicketPO() {
    }


    public TicketPO(int seatNum, double price,String code) {
        this.seatNum = seatNum;
        this.price = price;
        this.code = code;
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

    public OrderPO getOrderPO() {
        return orderPO;
    }

    public void setOrderPO(OrderPO orderPO) {
        this.orderPO = orderPO;
    }

    public PlanPO getPlanPO() {
        return planPO;
    }

    public void setPlanPO(PlanPO planPO) {
        this.planPO = planPO;
    }

    public int getSeatNum() {
        return seatNum;
    }

    public void setSeatNum(int seatNum) {
        this.seatNum = seatNum;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public TicketStatus getTicketStatus() {
        return ticketStatus;
    }

    public void setTicketStatus(TicketStatus ticketStatus) {
        this.ticketStatus = ticketStatus;
    }
}
