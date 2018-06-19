package cn.edu.nju.tickets.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class IndexController {

    @RequestMapping("/index")
    public String getIndex(@ModelAttribute("type") String type,
                           @ModelAttribute("user") String user,
                           @ModelAttribute("venue") String venue,
                           @ModelAttribute("code") String code,
                           @ModelAttribute("manager") String manager,
                           @ModelAttribute("venueInfo") String venueInfo){
        return "Index";
    }

}
