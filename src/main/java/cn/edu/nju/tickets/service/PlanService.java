package cn.edu.nju.tickets.service;

import cn.edu.nju.tickets.po.PlanPO;
import cn.edu.nju.tickets.po.TicketPO;
import cn.edu.nju.tickets.po.VenuePO;
import cn.edu.nju.tickets.type.PlanType;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface PlanService {

    List<PlanPO> showPlanList();

    boolean createPlan(String venueName,String planName, Date startTime, Date endTime, List<TicketPO> ticketPOList, PlanType planType, String introduction);
}
