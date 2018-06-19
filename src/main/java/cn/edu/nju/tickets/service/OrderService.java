package cn.edu.nju.tickets.service;

import cn.edu.nju.tickets.po.OrderPO;

import java.util.List;

public interface OrderService {


    /**
     *
     * @param ticketIdArray
     * @param email
     * @param planId
     * @return
     */
    boolean createOrder(int[] ticketIdArray,String email,int planId);

    /**
     * 用户支付订单
     * @return
     */
    boolean pay(int orderId,String password);


    /**
     * 用户取消订单
     * @param orderId
     * @return
     */
    boolean cancelOrder(int orderId);

    /**
     *
     * @param ticketIdArray
     * @return
     */
    boolean createOrderOffline(int[] ticketIdArray);






}
