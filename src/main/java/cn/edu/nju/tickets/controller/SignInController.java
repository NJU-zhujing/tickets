package cn.edu.nju.tickets.controller;

import cn.edu.nju.tickets.dao.VenueChangeDao;
import cn.edu.nju.tickets.dao.VenueDao;
import cn.edu.nju.tickets.po.VenuePO;
import cn.edu.nju.tickets.service.ManageService;
import cn.edu.nju.tickets.service.UserService;
import cn.edu.nju.tickets.service.VenueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class SignInController {

    @Autowired
    private UserService userService;

    @Autowired
    private VenueService venueService;

    @Autowired
    private ManageService manageService;

    @Autowired
    private VenueChangeDao venueChangeDao;

    @Autowired
    private VenueDao venueDao;


    @RequestMapping("/signIn")
    public String getSinIn(@ModelAttribute("userSignInResult") String userSignInResult,
                           @ModelAttribute("venueSignInResult") String venueSignInResult,
                           @ModelAttribute("managerSignInResult") String managerSignInResult){
        return "SignIn";
    }

    @RequestMapping("/signIn/user")
    public String signInByUser(HttpServletRequest request, RedirectAttributes redirectAttributes){

        String email = request.getParameter("account");
        String password = request.getParameter("password");

        if (userService.signIn(email,password)==true){
            HttpSession session = request.getSession(true);
            session.setAttribute("user",email);
            redirectAttributes.addAttribute("user",email);
            return "redirect:/index";

        }
        redirectAttributes.addAttribute("userSignInResult","false");
        return "redirect:/signIn";

    }

    @RequestMapping("/signIn/venue")
    public String signInByVenue(HttpServletRequest request, RedirectAttributes redirectAttributes){
        String password = request.getParameter("account");
        if (venueService.signIn(password)==true){
            VenuePO venuePO = venueDao.findByCode(password);
            String name = venuePO!=null?venuePO.getName():venueChangeDao.findByCode(password).getName();
            HttpSession session = request.getSession(true);
            session.setAttribute("venue",name);
            redirectAttributes.addAttribute("venue",name);
            return "redirect:/index";

        }

        redirectAttributes.addAttribute("venueSignInResult","false");
        return "redirect:/signIn";
    }

    @RequestMapping("/signIn/manager")
    public String signInByManager(HttpServletRequest request,RedirectAttributes redirectAttributes){
        String password = request.getParameter("account");

        if (manageService.signIn(password)==true){
            HttpSession session = request.getSession(true);
            session.setAttribute("manager","manager");
            redirectAttributes.addAttribute("manager","manager");
            return "redirect:/index";

        }

        redirectAttributes.addAttribute("managerSignInResult","false");
        return "redirect:/signIn";

    }
}
