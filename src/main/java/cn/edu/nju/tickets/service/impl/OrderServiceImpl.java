package cn.edu.nju.tickets.service.impl;

import cn.edu.nju.tickets.dao.*;
import cn.edu.nju.tickets.po.*;
import cn.edu.nju.tickets.service.OrderService;
import cn.edu.nju.tickets.type.OrderStatus;
import cn.edu.nju.tickets.type.TicketStatus;
import cn.edu.nju.tickets.util.ManagerUtil;
import cn.edu.nju.tickets.util.MemberUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    private OrderDao orderDao;

    @Autowired
    private AccountDao accountDao;

    @Autowired
    private PlanDao planDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private ManagerDao managerDao;

    @Autowired
    private TicketDao ticketDao;

    @Override
    public boolean createOrder(int[] ticketIdArray, String email, int planId) {

        UserPO userPO = userDao.findByEmail(email);
        PlanPO planPO = planDao.findById(planId);
        boolean isMember = !userPO.getIsCanceled();
        double cost = 0;
        List<TicketPO> list = new ArrayList<>();
        for (int i = 0; i < ticketIdArray.length; i++) {
            TicketPO ticketPO = ticketDao.findById(ticketIdArray[i]);
            cost += ticketPO.getPrice();
            ticketPO.setTicketStatus(TicketStatus.Created);
            list.add(ticketPO);
        }

        OrderPO orderPO = new OrderPO(userPO,planPO,list,new Date());

        if (isMember){
            cost = cost * MemberUtil.getDiscount(userPO.getMemberPoints());
        }

        orderPO.setCost(cost);
        orderDao.save(orderPO);
        return true;
    }


    @Transactional
    @Override
    public boolean pay(int orderId,String password) {

        OrderPO orderPO = orderDao.findById(orderId);
        AccountPO userAccountPO = orderPO.getUserPO().getAccountPO();

        if (!userAccountPO.getPassword().equals(password)||userAccountPO.getMoney()<orderPO.getCost()){
            return false;
        }

        //改订单状态
        orderPO.setStatus(OrderStatus.Paied);

        //改票的状态
        Iterator iterator = (Iterator) orderPO.getTicketPOList().iterator();
        while (iterator.hasNext()){
            TicketPO ticketPO = (TicketPO) iterator.next();
            ticketPO.setTicketStatus(TicketStatus.Paied);

        }
        orderDao.save(orderPO);

        //改用户信息
        UserPO userPO = orderPO.getUserPO();
        userPO.addCostAndMemberpoints(orderPO.getCost());
        userDao.save(userPO);

        //改管理信息
        ManagerPO managerPO = managerDao.findByPassword(ManagerUtil.password);
        managerPO.addIncome(orderPO.getCost());
        managerDao.save(managerPO);

        //改支付账号信息
        AccountPO managerAccountPO = managerPO.getAccountPO();
        userAccountPO.minusMoney(orderPO.getCost());
        managerAccountPO.addMoney(orderPO.getCost());
        accountDao.save(userAccountPO);
        accountDao.save(managerAccountPO);

        return true;
    }

    @Transactional
    @Override
    public boolean cancelOrder(int orderId) {

        OrderPO orderPO = orderDao.findById(orderId);
        ManagerPO managerPO = managerDao.findByPassword(ManagerUtil.password);
        AccountPO managerAccountPO = managerPO.getAccountPO();

        if (managerAccountPO.getMoney()<orderPO.getCost()){
            return false;
        }


        //改订单状态
        orderPO.setStatus(OrderStatus.Canceled);
        orderDao.save(orderPO);

        //改票状态
        Iterator iterator = orderPO.getTicketPOList().iterator();
        while (iterator.hasNext()){
            TicketPO ticketPO = ((TicketPO)iterator.next());
            ticketPO.setTicketStatus(TicketStatus.OnSale);
            ticketPO.setOrderPO(null);
            ticketDao.save(ticketPO);
        }

        //改用户信息
        UserPO userPO = orderPO.getUserPO();
        userPO.minusCostAndMemberpoints(orderPO.getCost());
        userDao.save(userPO);

        //改管理信息

        managerPO.minusIncome(orderPO.getCost());
        managerDao.save(managerPO);

        //改支付账号信息
        AccountPO userAccountPO = orderPO.getUserPO().getAccountPO();
        userAccountPO.setMoney(userAccountPO.getMoney()+orderPO.getCost());
        managerAccountPO.setMoney(managerAccountPO.getMoney()-orderPO.getCost());

        accountDao.save(userAccountPO);
        accountDao.save(managerAccountPO);
        return true;
    }

    @Override
    public boolean createOrderOffline(int[] ticketIdArray) {

        for (int i = 0; i < ticketIdArray.length; i++) {
            TicketPO ticketPO = ticketDao.findById(ticketIdArray[i]);
            ticketPO.setTicketStatus(TicketStatus.Arranged);
            ticketDao.save(ticketPO);

        }
        return true;
    }


}
