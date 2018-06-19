package cn.edu.nju.tickets.util;

import cn.edu.nju.tickets.po.OrderPO;

public class StrategyUtil {


    public static double getCanceledMoney(OrderPO orderPO){

        return orderPO.getCost()*0.5;
    }


    public static double getFinishedMoney(OrderPO orderPO){

        return orderPO.getCost()*0.95;
    }



}
