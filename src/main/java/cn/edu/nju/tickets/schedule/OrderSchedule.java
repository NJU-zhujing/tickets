package cn.edu.nju.tickets.schedule;

import cn.edu.nju.tickets.dao.OrderDao;
import cn.edu.nju.tickets.dao.TicketDao;
import cn.edu.nju.tickets.po.OrderPO;
import cn.edu.nju.tickets.po.TicketPO;
import cn.edu.nju.tickets.type.OrderStatus;
import cn.edu.nju.tickets.type.TicketStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Iterator;
import java.util.List;

@Component
public class OrderSchedule {

    public final static long ONE_Minute =  1 * 60 * 1000;
    public final static long FIFTEEN_Minute =  15 * 60 * 1000;
    public final static long THREE_Minute =  3 * 60 * 1000;
    public final static long TWO_Minute =  2 * 60 * 1000;
    public final static long ONE_Day =  24 * 60 * 60 * 1000;
    public final static long TWO_Day =  2 * 24 * 60 * 60 * 1000;
    public final static long TWO_Week =  14 * 24 * 60 * 60 * 1000;

    @Autowired
    private OrderDao orderDao;

    @Autowired
    private TicketDao ticketDao;


//    每天
    @Transactional
    @Scheduled(fixedDelay = TWO_Minute)
    public void arrangeAndFinishOrder(){
        System.out.println("开始");
        List<OrderPO> orderList = orderDao.findAll();
        Iterator oIt = orderList.iterator();
        while (oIt.hasNext()){
            OrderPO orderPO = (OrderPO) oIt.next();

            List<TicketPO> ticketList = orderPO.getTicketPOList();

            //订单已支付且开始时间两周前
//            if (orderPO.getStatus()== OrderStatus.Paied
//
//                    && ticketList.get(0).getPlanPO().getStartTime().getTime()-System.currentTimeMillis()>=TWO_Week){
            if (orderPO.getStatus()== OrderStatus.Paied
//                    && ticketList.get(0).getPlanPO().getStartTime().getTime()-System.currentTimeMillis()>=ONE_Day
                    && ticketList.get(0).getPlanPO().getStartTime().getTime()-System.currentTimeMillis()<=TWO_Day){
                System.out.println("订单出票");
                //改变订单和票的状态
                Iterator tIt = ticketList.iterator();
                while (tIt.hasNext()){
                    TicketPO ticketPO = (TicketPO) tIt.next();
                    ticketPO.setTicketStatus(TicketStatus.Arranged);
                    ticketDao.save(ticketPO);
                }

                orderPO.setStatus(OrderStatus.Arranged);
                orderDao.save(orderPO);


            //订单已分配且结束时间已过
//            }else if (orderPO.getStatus()== OrderStatus.Arranged
//                    &&  ticketList.get(0).getPlanPO().getEndTime().getTime()-System.currentTimeMillis()<=0){
            }else if (orderPO.getStatus()== OrderStatus.Arranged
                    &&  ticketList.get(0).getPlanPO().getEndTime().getTime()-System.currentTimeMillis()>=TWO_Week){
                System.out.println("订单结束");
                //改变订单和票的状态
                Iterator tIt = ticketList.iterator();
                while (tIt.hasNext()){
                    TicketPO ticketPO = (TicketPO) tIt.next();
                    ticketPO.setTicketStatus(TicketStatus.Used);
                    ticketDao.save(ticketPO);
                }

                orderPO.setStatus(OrderStatus.Finished);
                orderDao.save(orderPO);

            }

        }
    }

//    每一分钟
    @Transactional
    @Scheduled(fixedDelay = ONE_Minute)
    public void checkPastDueOrder(){

        List<OrderPO> orderList = orderDao.findAll();
        Iterator oIt = orderList.iterator();
        while (oIt.hasNext()) {
            OrderPO orderPO = (OrderPO) oIt.next();
//            if (orderPO.getStatus()==OrderStatus.Created&&System.currentTimeMillis()-orderPO.getCreateTime().getTime()> FIFTEEN_Minute){
            if (orderPO.getStatus()==OrderStatus.Created&&System.currentTimeMillis()-orderPO.getCreateTime().getTime()> ONE_Minute){

                //改变订单状态
                orderPO.setStatus(OrderStatus.PastDue);

                //改变票的状态
                List ticketList = orderPO.getTicketPOList();
                Iterator tIt = ticketList.iterator();
                while (tIt.hasNext()){
                    TicketPO ticketPO = (TicketPO) tIt.next();
                    ticketPO.setTicketStatus(TicketStatus.OnSale);
                    ticketDao.save(ticketPO);
                }
            }
            orderDao.save(orderPO);
        }

    }
}
