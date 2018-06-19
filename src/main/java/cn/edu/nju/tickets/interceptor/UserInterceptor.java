package cn.edu.nju.tickets.interceptor;

import cn.edu.nju.tickets.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserInterceptor implements HandlerInterceptor {

    @Autowired
    private UserDao userDao;


    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        HttpSession session = httpServletRequest.getSession(false);

        if (session == null||session.getAttribute("user")==null){
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/signIn");
            return false;
        }

        String email = (String) session.getAttribute("user");
        if (userDao.findByEmail(email).getIsActivated()==false){
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/index?user="+email+"&userInfo=false");
            return false;
        }

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
