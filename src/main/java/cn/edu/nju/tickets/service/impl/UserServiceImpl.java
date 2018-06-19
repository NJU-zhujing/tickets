package cn.edu.nju.tickets.service.impl;

import cn.edu.nju.tickets.dao.AccountDao;
import cn.edu.nju.tickets.dao.UserDao;
import cn.edu.nju.tickets.po.OrderPO;
import cn.edu.nju.tickets.po.UserPO;
import cn.edu.nju.tickets.service.UserService;
import cn.edu.nju.tickets.util.EmailUtil;
import cn.edu.nju.tickets.util.SecurityUtil;
import cn.edu.nju.tickets.util.UuidUtil;
import cn.edu.nju.tickets.vo.UserStatisticsVO;
import cn.edu.nju.tickets.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.transaction.Transactional;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Iterator;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private AccountDao accountDao;

    @Override
    public boolean signUp(String email, String password,String account) {

        if (userDao.findByEmail(email)!=null||accountDao.findByName(account)==null){
            return false;
        }

        try {
            String token = SecurityUtil.EncodeByMd5(email+password);
//            String token = UuidUtil.getUuidString32();
            EmailUtil.sendMail(email,token);
            UserPO user = new UserPO(email,password,System.currentTimeMillis()+1000*60*60*24,token,accountDao.findByName(account));
            userDao.save(user);
        } catch (MessagingException e) {
            return false;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return true;
    }

    @Override
    public boolean signIn(String email, String password) {

        if (userDao.findByEmailAndPassword(email,password)==null){
            return false;
        }

        return true;
    }

    @Override
    public boolean activateEmail(String token,String email) {
        try{
            UserPO userPO = userDao.findByEmail(email);
            if (userPO.getActivateTime()<System.currentTimeMillis()||!userPO.getToken().equals(token)){
                return false;
            }
            userPO.setIsActivated(true);
            userDao.save(userPO);

        }catch (Exception e){
            return false;
        }

        return true;
    }

    @Override
    public boolean modifyInformation(String email, String password) {

        try{
            UserPO userPO = userDao.findByEmail(email);
            userPO.setPassword(password);
            userDao.save(userPO);

        }catch (Exception e){
            return false;
        }

        return true;
    }

    @Override
    public boolean cancelMembership(String email) {

        try {
            UserPO userPO = userDao.findByEmail(email);
            userPO.setIsCanceled(true);
            userDao.save(userPO);

        }catch (Exception e){
            return false;
        }
        return true;
    }

    @Transactional
    @Override
    public UserVO showInformation(String email) {

        UserVO userVO = null;
        try {
            UserPO userPO = userDao.findByEmail(email);
            List list = userPO.getOrderPOList();
            Iterator iterator = list.iterator();
            int created = 0, hasArranged = 0, hasPaied = 0, finished = 0, pastDue = 0,cancelNum=0;
            while (iterator.hasNext()) {
                OrderPO orderPO = (OrderPO) iterator.next();
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
                    case Canceled:
                        cancelNum++;
                    case Account:
                        finished++;
                }
            }
            UserStatisticsVO userStatisticsVO = new UserStatisticsVO(created, hasArranged, hasPaied, finished, pastDue,cancelNum);
            userVO = new UserVO(userPO, userStatisticsVO);
        }catch (Exception e){
            return null;
        }

        return userVO;
    }
}


