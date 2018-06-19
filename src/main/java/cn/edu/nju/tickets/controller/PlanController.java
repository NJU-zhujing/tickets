package cn.edu.nju.tickets.controller;

import cn.edu.nju.tickets.dao.PlanDao;
import cn.edu.nju.tickets.po.PlanPO;
import cn.edu.nju.tickets.po.TicketPO;
import cn.edu.nju.tickets.service.PlanService;
import cn.edu.nju.tickets.type.PlanType;
import cn.edu.nju.tickets.util.DateUtil;
import cn.edu.nju.tickets.util.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/plan")
public class PlanController {

    @Autowired
    private PlanService planService;

    @RequestMapping("/list")
    public String getPlanList(HttpServletRequest request, Model model) {

        List<PlanPO> planList = planService.showPlanList();
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

        return "PlanList";

    }

    @RequestMapping("/createInfo")
    public String getPlanCreateInfo(@ModelAttribute("createResullt") String createResullt){
        return "PlanCreate";
    }

    @RequestMapping("/create")
    public String createPlan(HttpServletRequest request,RedirectAttributes redirectAttributes){

        HttpSession session = request.getSession(false);
        String venueName = (String) session.getAttribute("venue");
        String planName = request.getParameter("plan_name");
        String introduction = request.getParameter("plan_introduction");
        Date startTime = DateUtil.datetimeLocalToDate(request.getParameter("start_time"));
        Date endTime = DateUtil.datetimeLocalToDate(request.getParameter("end_time"));
        String seatList = request.getParameter("seat_list_str");
        String planType = request.getParameter("plan_type");
        PlanType type = null;
        switch (planType){
            case "1":
                type = PlanType.Sport;
                break;
            case "2":
                type = PlanType.Dance;
                break;
            case "3":
                type = PlanType.Drama;
                break;
            case "4":
                type = PlanType.Music;
                break;
            case "5":
                type = PlanType.GAME;
                break;
        }

        List <TicketPO> list = new ArrayList<>();
        System.out.println(seatList);
        String [] seatArray = seatList.split(";");

        for (String seat:seatArray) {
            TicketPO ticketPO = new TicketPO(Integer.parseInt(seat.split("-")[0]),Integer.parseInt(seat.split("-")[1]), UuidUtil.getUuidString32());
            list.add(ticketPO);
        }

        if (planService.createPlan(venueName,planName,startTime,endTime,list,type,introduction)){
            redirectAttributes.addAttribute("createResullt","true");
            return "redirect:/plan/createInfo";
        }

        redirectAttributes.addAttribute("createResullt","false");
        return "redirect:/plan/createInfo";
    }

}
