package cn.edu.nju.tickets.dao;

import cn.edu.nju.tickets.po.AccountPO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountDao extends JpaRepository<AccountPO,Integer>{


    /**
     *
     * @param name
     * @return
     */
    AccountPO findByName(String name);


}
