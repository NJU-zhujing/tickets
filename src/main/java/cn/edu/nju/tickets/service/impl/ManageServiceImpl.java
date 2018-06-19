package cn.edu.nju.tickets.service.impl;

import cn.edu.nju.tickets.dao.*;
import cn.edu.nju.tickets.po.*;
import cn.edu.nju.tickets.service.ManageService;
import cn.edu.nju.tickets.type.OrderStatus;
import cn.edu.nju.tickets.util.ManagerUtil;
import cn.edu.nju.tickets.vo.ManagerStatisticsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Iterator;
import java.util.List;

@Service
public class ManageServiceImpl implements ManageService {

    @Autowired
    private VenueChangeDao venueChangeDao;

    @Autowired
    private VenueDao venueDao;

    @Autowired
    private ManagerDao managerDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private AccountDao accountDao;

    @Autowired
    private OrderDao orderDao;

    @Override
    public boolean signIn(String password) {

        if (managerDao.findByPassword(password)!=null){
            return true;
        }
        return false;
    }

    @Override
    public List<VenueChangePO> showSignUpAndModifyVenueList() {
        return venueChangeDao.findAll();
    }

    @Override
    public boolean approve(int venueChangeId) {
        VenueChangePO venueChangePO = venueChangeDao.findById(venueChangeId);
        if (venueChangePO==null){
            return false;
        }
        VenuePO venuePO = null;
        switch (venueChangePO.getChangeType()){
            case Change:
                venuePO = venueDao.findByCode(venueChangePO.getCode());
                venuePO.setName(venueChangePO.getName());
                venuePO.setLocation(venueChangePO.getLocation());
                venuePO.setIntroduction(venueChangePO.getIntroduction());
                venuePO.setSeatNum(venueChangePO.getSeatNum());
                venuePO.setAccountPO(venueChangePO.getAccountPO());
                break;
            case SignUp:
                venuePO = new VenuePO(venueChangePO.getCode(),venueChangePO.getName(),venueChangePO.getIntroduction(),venueChangePO.getLocation(),venueChangePO.getSeatNum(),venueChangePO.getAccountPO());
                break;
        }
        venueDao.save(venuePO);
        venueChangeDao.delete(venueChangePO);
        return true;
    }

    @Override
    public boolean disapprove(int venueChangeId) {
        VenueChangePO venueChangePO = venueChangeDao.findById(venueChangeId);
        if (venueChangePO==null){
            return false;
        }
        venueChangeDao.delete(venueChangePO);
        return true;
    }

    @Override
    public ManagerStatisticsVO showStatistics() {
        ManagerStatisticsVO managerStatisticsVO = new ManagerStatisticsVO();
        managerStatisticsVO.setVenuePOList(venueDao.findAll());
        List mlist = managerDao.findAll();
        Iterator mIterator = mlist.iterator();
        while (mIterator.hasNext()){
            ManagerPO managerPO = (ManagerPO) mIterator.next();
            managerStatisticsVO.addIncome(managerPO.getIncome());
        }

        managerStatisticsVO.setMemberNum((int) userDao.count());
        return managerStatisticsVO;
    }


    @Transactional
    @Override
    public boolean accounts() {

        ManagerPO managerPO = managerDao.findByPassword(ManagerUtil.password);
        AccountPO managerAccountPO = managerPO.getAccountPO();
        Iterator iterator = orderDao.findByStatus(OrderStatus.Finished).iterator();
        while (iterator.hasNext()){
            OrderPO orderPO = (OrderPO) iterator.next();

            //
            VenuePO venuePO = orderPO.getPlanPO().getVenuePO();
            venuePO.addIncome(orderPO.getCost());
            venueDao.save(venuePO);

            //
            AccountPO venueAccountPO = venuePO.getAccountPO();
            venueAccountPO.addMoney(orderPO.getCost());
            accountDao.save(venueAccountPO);
            managerAccountPO.minusMoney(orderPO.getCost());

            //
            orderPO.setStatus(OrderStatus.Account);
            orderDao.save(orderPO);

        }
        accountDao.save(managerAccountPO);
        return true;


    }
}
