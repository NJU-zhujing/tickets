package cn.edu.nju.tickets.controller;

import cn.edu.nju.tickets.service.UserService;
import cn.edu.nju.tickets.service.VenueService;
import cn.edu.nju.tickets.util.SecurityUtil;
import cn.edu.nju.tickets.util.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class SignUpController {

    @Autowired
    private UserService userService;

    @Autowired
    private VenueService venueService;

    @RequestMapping("/signUp")
    public String getSignUp(
            @ModelAttribute("userSignUpResult") String userSignUpResult,
            @ModelAttribute("venueSignUpResult") String venueSignUpResult,
            @ModelAttribute("activateResult") String activateResult){
        return "SignUp";
    }

    @RequestMapping("/signUp/user")
    public String signUpByUser(HttpServletRequest request,RedirectAttributes redirectAttributes){

        String email = request.getParameter("user_sign_up_email");
        String password = request.getParameter("user_sign_up_password");
        String name = request.getParameter("user_sign_up_account");

        if (userService.signUp(email,password,name)==true){
            HttpSession session = request.getSession(true);
            session.setAttribute("user",email);
            redirectAttributes.addAttribute("user",email);
            redirectAttributes.addAttribute("type","userUnchecked");
            return "redirect:/index";

        }

        redirectAttributes.addAttribute("userSignUpResult","false");
        return "redirect:/signUp";
    }


    @RequestMapping("/signUp/venue")
    public String signUpByVenue(HttpServletRequest request,RedirectAttributes redirectAttributes){

        String name = request.getParameter("venue_name");
        String location = request.getParameter("venue_location");
        String account = request.getParameter("venue_pay_account");
        int seatNum = Integer.parseInt(request.getParameter("venue_seat_num"));
        String introduction = request.getParameter("venue_introduction");

        String code = UuidUtil.getUuidString7();
        if (venueService.signUp(name,introduction,location,seatNum,account,code)){
            HttpSession session = request.getSession(true);
            session.setAttribute("venue",name);

            System.out.println(code);
            redirectAttributes.addAttribute("venue",name);
            redirectAttributes.addAttribute("type","venueUnchecked");
            redirectAttributes.addAttribute("code",code);
            return "redirect:/index";

        }

        redirectAttributes.addAttribute("venueSignUpResult","false");
        return "redirect:/signUp";
    }


    @RequestMapping("/activatemail")
    public String activatEmail(HttpServletRequest request,@RequestParam("token")String token, @RequestParam("email")String email, RedirectAttributes redirectAttributes){
        System.out.println("!"+token);
        System.out.println("!"+email);
        if (userService.activateEmail(token,email)==true){

            redirectAttributes.addAttribute("activateResult","true");
            redirectAttributes.addAttribute("user",email);

            HttpSession session = request.getSession(false);
            if (session==null){
                session = request.getSession(true);
                session.setAttribute("user",email);
            }

            return "redirect:/index";
        }

        redirectAttributes.addAttribute("activateResult","false");
        return "redirect:/signUp";

    }

}
