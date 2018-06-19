package cn.edu.nju.tickets.dao;

import cn.edu.nju.tickets.po.VenuePO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VenueDao extends JpaRepository<VenuePO,Integer>{

    /**
     *
     * @param code
     * @return
     */
    VenuePO findByCode(String code);


    /**
     *
     * @param id
     * @return
     */
    VenuePO findById(int id);


    /**
     *
     * @param name
     * @return
     */
    VenuePO findByName(String name);






}
