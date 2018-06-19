package cn.edu.nju.tickets.dao;

import cn.edu.nju.tickets.po.PlanPO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PlanDao extends JpaRepository<PlanPO,Integer>{

    /**
     *
     * @param id
     * @return
     */
    PlanPO findById(int id);
}
