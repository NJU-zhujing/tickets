package cn.edu.nju.tickets.service;

import cn.edu.nju.tickets.vo.VenueVO;

public interface VenueService {

    /**
     * 注册
     * @param name
     * @param introduction
     * @param location
     * @param seatNum
     * @param account
     * @param code 使用函数副作用
     * @return
     */
    boolean signUp(String name,String introduction,String location,int seatNum,String account,String code);

    /**
     * 登陆
     * @param code
     * @return
     */
    boolean signIn(String code);

    /**
     * 检票
     * @param name
     * @param code
     * @return
     */
    boolean checkTicket(String name,String code);

    /**
     * 修改信息
     * @param code
     * @param name
     * @param introduction
     * @param location
     * @param seatNum
     * @return
     */
    boolean modifyInformation(String code, String name, String introduction, String location, int seatNum);


    /**
     * 展示信息
     * @return
     */
    VenueVO showInformation(String name) ;


}
