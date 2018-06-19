package cn.edu.nju.tickets.service;

import cn.edu.nju.tickets.vo.UserVO;

public interface UserService {


    /**
     * 注册
     * @param email
     * @param password
     * @param account
     * @return
     */
    boolean signUp(String email,String password,String account);

    /**
     * 登陆
     * @param email
     * @param password
     * @return
     */
    boolean signIn(String email,String password);

    /**
     * 验证邮箱
     * @param token
     * @param email
     * @return
     */
    boolean activateEmail(String token,String email);


    /**
     * 修改个人信息
     * @param
     * @param password
     * @return
     */
    boolean modifyInformation(String email, String password);


    /**
     * 取消会员资格
     * @param
     * @return
     */
    boolean cancelMembership(String email);


    /**
     * 展示个人信息
     * @param
     * @return
     */
    UserVO showInformation(String email) ;



}
