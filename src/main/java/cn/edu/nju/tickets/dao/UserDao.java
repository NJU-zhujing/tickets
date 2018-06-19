package cn.edu.nju.tickets.dao;

import cn.edu.nju.tickets.po.UserPO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao extends JpaRepository<UserPO,Integer> {

    /**
     *
     * @param email
     * @return
     */
    UserPO findByEmail(String email);

    /**
     *
     * @param email
     * @param password
     * @return
     */
    UserPO findByEmailAndPassword(String email,String password);

}
