package cn.edu.nju.tickets.service.impl;

import cn.edu.nju.tickets.dao.PlanDao;
import cn.edu.nju.tickets.dao.TicketDao;
import cn.edu.nju.tickets.dao.VenueDao;
import cn.edu.nju.tickets.po.PlanPO;
import cn.edu.nju.tickets.po.TicketPO;
import cn.edu.nju.tickets.po.VenuePO;
import cn.edu.nju.tickets.service.PlanService;
import cn.edu.nju.tickets.type.PlanType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


@Service
public class PlanServiceImpl implements PlanService {
    @Autowired
    private PlanDao planDao;

    @Autowired
    private VenueDao venueDao;

    @Override
    public List<PlanPO> showPlanList() {
        return planDao.findAll();
    }

    @Override
    public boolean createPlan(String venueName, String planName, Date startTime, Date endTime, List<TicketPO> ticketPOList, PlanType planType, String introduction) {
        try {
            VenuePO venuePO = venueDao.findByName(venueName);
            PlanPO planPO = new PlanPO(planName, startTime, endTime, venuePO, ticketPOList, planType, introduction);
            planDao.save(planPO);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }


}
