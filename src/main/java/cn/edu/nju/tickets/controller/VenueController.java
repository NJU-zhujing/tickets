package cn.edu.nju.tickets.controller;

import cn.edu.nju.tickets.po.PlanPO;
import cn.edu.nju.tickets.service.VenueService;
import cn.edu.nju.tickets.vo.VenueVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class VenueController {

    @Autowired
    private VenueService venueService;

    @RequestMapping("/venueInfo")
    public String getVenueInfo(HttpServletRequest request, Model model,@ModelAttribute("modifyInfoResult") String modifyInfoResult){

        HttpSession session = request.getSession(false);
        VenueVO venueVO = venueService.showInformation((String) session.getAttribute("venue"));
        model.addAttribute("venueVO",venueVO);

        return "VenueInfo";

    }

    @RequestMapping("/venueInfo/save")
    public String modifyVenueInfo(HttpServletRequest request, RedirectAttributes redirectAttributes){
        String code = request.getParameter("venue_code");
        String name = request.getParameter("venue_name");
        String location = request.getParameter("venue_location");
        int seatNum = Integer.parseInt(request.getParameter("venue_seat_num"));
        String introduction = request.getParameter("venue_introduction");
        if(venueService.modifyInformation(code,name,introduction,location,seatNum)){
            redirectAttributes.addAttribute("modifyInfoResult","true");
            return "redirect:/venueInfo";

        }

        redirectAttributes.addAttribute("modifyInfoResult","false");
        return "redirect:/venueInfo";
    }

    @RequestMapping("/checkTicket")
    public String getTicketCheckInfo(@ModelAttribute("checkResult") String checkResult){

        return "CheckTicket";
    }

    @RequestMapping("/checkTicket/result")
    public String checkTicket(HttpServletRequest request, RedirectAttributes redirectAttributes){
        HttpSession session = request.getSession(false);
        if(venueService.checkTicket((String) session.getAttribute("venue"),request.getParameter("ticket_code"))){
            redirectAttributes.addAttribute("checkResult","true");
            return "redirect:/checkTicket";
        }

        redirectAttributes.addAttribute("checkResult","false");
        return "redirect:/checkTicket";
    }


//    @Transactional
    @RequestMapping("/venuePlanList")
    public String getPlanList(@ModelAttribute("createPlanResult") String createPlanResult,HttpServletRequest request,Model model){
        HttpSession session = request.getSession();
        List<PlanPO> planList = venueService.showInformation((String) session.getAttribute("venue")).getVenuePO().getPlanPOList();
        int page = 1;
        if (request.getParameter("page")!=null){
            page = Integer.parseInt(request.getParameter("page"));
        }

        int itemNum = 5;
        int totalPages = planList.size()%itemNum == 0 ? planList.size()/itemNum:planList.size()/itemNum+1;
        planList = planList.subList(itemNum*(page-1),page*itemNum<planList.size()?page*itemNum:planList.size());

        model.addAttribute("totalPages",totalPages);
        model.addAttribute("currentPage",page);
        model.addAttribute("planList",planList);

        return "VenuePlanList";


    }





}
