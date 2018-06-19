package cn.edu.nju.tickets.controller;

import cn.edu.nju.tickets.service.ManageService;
import cn.edu.nju.tickets.vo.ManagerStatisticsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ManagerController {

    @Autowired
    private ManageService manageService;

    @RequestMapping("/managerInfo")
    public String getManagerInfo(@ModelAttribute("accountsResult") String accountsResult, Model model){
        ManagerStatisticsVO managerStatisticsVO = manageService.showStatistics();
        model.addAttribute("managerStatisticsVO",managerStatisticsVO);
        return "ManagerInfo";
    }

    @RequestMapping("/venueChange/list")
    public String getManagerList(@ModelAttribute("approveResult") String approveResult,@ModelAttribute("disapproveResult") String disapproveResult,HttpServletRequest request,Model model){

        List venueChangeList = manageService.showSignUpAndModifyVenueList();
        int page = 1;
        if (request.getParameter("page")!=null){
            page = Integer.parseInt(request.getParameter("page"));
        }

        int itemNum = 3;
        int totalPages = venueChangeList.size()%itemNum == 0 ? venueChangeList.size()/itemNum:venueChangeList.size()/itemNum+1;
        venueChangeList = venueChangeList.subList(itemNum*(page-1),page*itemNum<venueChangeList.size()?page*itemNum:venueChangeList.size());
        
        model.addAttribute("totalPages",totalPages);
        model.addAttribute("currentPage",page);
        model.addAttribute("venueChangeList",venueChangeList);

        return "VenueChangeList";
    }

    @RequestMapping("/venueChange/approve")
    public String approveVenueChange(@RequestParam("venueChangeId") int venueChangeId, RedirectAttributes redirectAttributes){


        if(manageService.approve(venueChangeId)){
            redirectAttributes.addAttribute("approveResult","true");
            return "redirect:/venueChange/list";
        }

        redirectAttributes.addAttribute("approveResult","false");
        return "redirect:/venueChange/list";
    }


    @RequestMapping("/venueChange/disapprove")
    public String disApproveVenueChange(@RequestParam("venueChangeId") int venueChangeId, RedirectAttributes redirectAttributes){

        if(manageService.disapprove(venueChangeId)){
            redirectAttributes.addAttribute("disapproveResult","true");
            return "redirect:/venueChange/list";
        }

        redirectAttributes.addAttribute("disapproveResult","false");
        return "redirect:/venueChange/list";
    }


    @RequestMapping("/manager/accounts")
    public String accounts(RedirectAttributes redirectAttributes){
        if (manageService.accounts()){
            redirectAttributes.addAttribute("accountsResult","true");
            return "redirect:/managerInfo";
        }
        redirectAttributes.addAttribute("accountsResult","false");
        return "redirect:/managerInfo";

    }






}
