package cn.edu.nju.tickets.dao;

import cn.edu.nju.tickets.po.AccountPO;
import cn.edu.nju.tickets.po.ManagerPO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ManagerDaoTest {

    @Autowired
    private ManagerDao managerDao;

    @Autowired
    private AccountDao accountDao;

    @Test
    public void findByPassword() throws Exception {

        AccountPO accountPO = accountDao.findByName("2c9323f56289c900016289c90b360000");
        ManagerPO managerPO = new ManagerPO("ddd",accountPO);
        managerDao.save(managerPO);
    }

}