package cn.edu.nju.tickets.dao;


import cn.edu.nju.tickets.po.OrderPO;
import cn.edu.nju.tickets.type.OrderStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDao extends JpaRepository<OrderPO,Integer>{

    /**
     *
     * @param id
     * @return
     */
    OrderPO findById(int id);

    /**
     *
     * @param orderStatus
     * @return
     */
    List<OrderPO> findByStatus(OrderStatus orderStatus);
}
