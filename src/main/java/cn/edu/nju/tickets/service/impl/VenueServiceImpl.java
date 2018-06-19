package cn.edu.nju.tickets.service.impl;

import cn.edu.nju.tickets.dao.*;
import cn.edu.nju.tickets.po.*;
import cn.edu.nju.tickets.type.ChangeType;
import cn.edu.nju.tickets.service.VenueService;
import cn.edu.nju.tickets.type.TicketStatus;
import cn.edu.nju.tickets.util.UuidUtil;
import cn.edu.nju.tickets.vo.VenueStatisticsVO;
import cn.edu.nju.tickets.vo.VenueVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Iterator;
import java.util.List;

@Service
public class VenueServiceImpl implements VenueService{

    @Autowired
    private AccountDao accountDao;

    @Autowired
    private VenueChangeDao venueChangeDao;

    @Autowired
    private VenueDao venueDao;

    @Autowired
    private TicketDao ticketDao;

    @Override
    public boolean signUp(String name, String introduction, String location, int seatNum,String account,String code) {

        if (venueDao.findByName(name)!=null||venueChangeDao.findByName(name)!=null||accountDao.findByName(account)==null){
            return false;
        }

        try {
            VenueChangePO venueChangePO = new VenueChangePO(code,name,introduction,location,seatNum,ChangeType.SignUp,accountDao.findByName(account));
            venueChangeDao.save(venueChangePO);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }

        return true;
    }

    @Override
    public boolean signIn(String code) {

        VenueChangePO venueChangePO = venueChangeDao.findByCode(code);
        if (venueChangePO!=null){
            return true;
        }

        VenuePO venuePO = venueDao.findByCode(code);
        if (venuePO!=null){
            return true;

        }
        return false;
    }

//    @Transactional
    @Override
    public boolean checkTicket(String name,String code) {

        TicketPO ticketPO = ticketDao.findByCode(code);
        if (!ticketPO.getPlanPO().getVenuePO().getName().equals(name)){
            return false;
        }
        ticketPO.setTicketStatus(TicketStatus.Used);
        ticketDao.save(ticketPO);
        return true;
    }

    @Override
    public boolean modifyInformation(String code, String name, String introduction, String location, int seatNum) {

        VenuePO venuePO = venueDao.findByCode(code);
        try {
            venuePO.setName(name);
            venuePO.setIntroduction(introduction);
            venuePO.setLocation(location);
            venuePO.setSeatNum(seatNum);
            venueDao.save(venuePO);

        }catch (Exception e){
            e.printStackTrace();
            return false;
        }

        return true;
    }

    @Transactional
    @Override
    public VenueVO showInformation(String name)  {

        if (venueDao.findByName(name)==null){
            return null;
        }

        VenuePO venuePO = venueDao.findByName(name);
        int created = 0, hasArranged = 0, hasPaied = 0, finished = 0, pastDue = 0;
        Iterator iterator = venuePO.getPlanPOList().iterator();
        while (iterator.hasNext()) {
            PlanPO planPO = (PlanPO) iterator.next();

            Iterator it = planPO.getOrderPOList().iterator();

            while (it.hasNext()) {
                OrderPO orderPO = (OrderPO) it.next();
                switch (orderPO.getStatus()) {
                    case Created:
                        created++;
                        break;
                    case Arranged:
                        hasArranged++;
                        break;
                    case Paied:
                        hasPaied++;
                        break;
                    case Finished:
                        finished++;
                        break;
                    case PastDue:
                        pastDue++;
                        break;
                }
            }
        }

        VenueStatisticsVO venueStatisticsVO = new VenueStatisticsVO(created,hasArranged,hasPaied,finished,pastDue);
        VenueVO venueVO = new VenueVO(venuePO,venueStatisticsVO);
        return venueVO;
    }
}
