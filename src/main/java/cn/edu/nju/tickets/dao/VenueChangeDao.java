package cn.edu.nju.tickets.dao;

import cn.edu.nju.tickets.po.VenueChangePO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VenueChangeDao extends JpaRepository<VenueChangePO,Integer> {

    /**
     *
     * @param code
     * @return
     */
    VenueChangePO findByCode(String code);

    /**
     *
     * @param id
     * @return
     */
    VenueChangePO findById(int id);

    /**
     *
     * @param name
     * @return
     */
    VenueChangePO findByName(String name);

    /**
     *
     * @param id
     */
    void deleteById(int id);

}
