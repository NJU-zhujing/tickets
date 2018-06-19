package cn.edu.nju.tickets.controller;

import cn.edu.nju.tickets.dao.OrderDao;
import cn.edu.nju.tickets.dao.PlanDao;
import cn.edu.nju.tickets.po.OrderPO;
import cn.edu.nju.tickets.po.PlanPO;
import cn.edu.nju.tickets.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderDao orderDao;

    @Autowired
    private PlanDao planDao;

    @RequestMapping("/cancel")
    public String cancelOrder(@RequestParam("orderId") int orderId, RedirectAttributes redirectAttributes) {

        if(orderService.cancelOrder(orderId)){
            redirectAttributes.addAttribute("cancelResult","true");
            return "redirect:/userOrderList";
        }

        redirectAttributes.addAttribute("cancelResult","false");
        return "redirect:/userOrderList";

    }


    @RequestMapping("/payInfo")
    public String getOrderPayInfo(@RequestParam("orderId") int orderId ,Model model,@ModelAttribute("payResult") String payResult) {

        OrderPO orderPO = orderDao.findById(orderId);
        double cost = orderPO.getCost();
        String name = orderPO.getUserPO().getAccountPO().getName();

        model.addAttribute("orderId",orderId);
        model.addAttribute("account",name);
        model.addAttribute("orderCost",cost);

        return "OrderPay";

    }

    @RequestMapping("/pay")
    public String payOrder(HttpServletRequest request,RedirectAttributes redirectAttributes) {

        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String password = request.getParameter("password");

        if(orderService.pay(orderId,password)){
            return "redirect:/userOrderList";
        }
        redirectAttributes.addAttribute("payResult","false");
        return "redirect:/order/payInfo?orderId="+orderId;

    }


    @RequestMapping("/createInfo")
    public String getOrderCreateInfo(@RequestParam("planId") int planId ,Model model,@ModelAttribute("createResult") String createResult) {
        PlanPO planPO = planDao.findById(planId);
        model.addAttribute("planPO",planPO);
        return "OrderCreate";

    }


    @RequestMapping("/create")
    public String createOrder(HttpServletRequest request,RedirectAttributes redirectAttributes) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("user");

        String ticketIdStr = request.getParameter("ticketIdStr");
        int planId = Integer.parseInt(request.getParameter("planId"));


        String []strArray = ticketIdStr.split(";");
        int ticketIdArray[] = new int[strArray.length];
        for (int i = 0; i <strArray.length ; i++) {
            ticketIdArray[i] = Integer.parseInt(strArray[i]);
        }

        if (orderService.createOrder(ticketIdArray,email,planId)){

            redirectAttributes.addAttribute("createResult","true");
            return "redirect:/userOrderList";
        }

        redirectAttributes.addAttribute("createResult","false");
        return "redirect:/order/createInfo";

    }

    @RequestMapping("/createOfflineInfo")
    public String getOrderCreateOfflineInfo(@RequestParam("planId") int planId ,Model model,@ModelAttribute("createResult") String createResult) {
        PlanPO planPO = planDao.findById(planId);
        List list = planPO.getTicketPOList();
        model.addAttribute("planPO",planPO);
        return "OrderCreateOffline";

    }

    @RequestMapping("/createOffline")
    public String createOrderOffline(HttpServletRequest request,RedirectAttributes redirectAttributes) {

        String ticketIdStr = request.getParameter("ticketIdStr");
        int planId = Integer.parseInt(request.getParameter("planId"));
        System.out.println(ticketIdStr);
        String []strArray = ticketIdStr.split(";");
        int ticketIdArray[] = new int[strArray.length];
        for (int i = 0; i <strArray.length ; i++) {
            ticketIdArray[i] = Integer.parseInt(strArray[i]);
        }

        if (orderService.createOrderOffline(ticketIdArray)){

            redirectAttributes.addAttribute("createResult","true");
            return "redirect:/order/createOfflineInfo?planId="+planId;

        }

        redirectAttributes.addAttribute("createResult","false");
        return "redirect:/order/createOfflineInfo?planId="+planId;



    }



}
