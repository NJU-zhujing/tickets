package cn.edu.nju.tickets.dao;

import cn.edu.nju.tickets.po.TicketPO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface TicketDao extends JpaRepository<TicketPO, String> {

    /**
     *
     * @param
     * @return
     */
    TicketPO findById(int id);

    /**
     *
     * @param code
     * @return
     */
    TicketPO findByCode(String code);

}
