package cn.edu.nju.tickets.interceptor;

import cn.edu.nju.tickets.dao.VenueChangeDao;
import cn.edu.nju.tickets.dao.VenueDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class VenueInterceptor implements HandlerInterceptor {

    @Autowired
    private VenueDao venueDao;

    @Autowired
    private VenueChangeDao venueChangeDao;

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        HttpSession session = httpServletRequest.getSession(false);

        if (session == null||session.getAttribute("venue")==null){
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/signIn");
            return false;
        }

        String name = (String) session.getAttribute("venue");
        if (venueDao.findByName(name)==null&&venueChangeDao.findByName(name)!=null){
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/index?venue=1"+"&venueInfo=false");
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
