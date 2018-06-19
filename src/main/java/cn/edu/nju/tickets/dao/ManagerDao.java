package cn.edu.nju.tickets.dao;

import cn.edu.nju.tickets.po.ManagerPO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ManagerDao extends JpaRepository<ManagerPO,Integer>{

    /**
     *
     * @param password
     * @return
     */
    ManagerPO findByPassword(String password);
}
