package cn.edu.nju.tickets.controller;

import cn.edu.nju.tickets.service.UserService;
import cn.edu.nju.tickets.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/userInfo")
    public String getUserInfo(HttpServletRequest request, Model model,@ModelAttribute("result") String result){

        HttpSession session = request.getSession(false);
        UserVO userVO = userService.showInformation((String) session.getAttribute("user"));
        model.addAttribute("userVO",userVO);
        return "UserInfo";
    }


    @RequestMapping("/userOrderList")
    public String getUserOrderList(HttpServletRequest request,Model model,@ModelAttribute("createResult") String createResult){

        HttpSession session = request.getSession(false);
        int page = 1;
        if (request.getParameter("page")!=null){
            page = Integer.parseInt(request.getParameter("page"));
        }


        UserVO userVO = userService.showInformation((String) session.getAttribute("user"));
        List orderList = userVO.getUserPO().getOrderPOList();

        int itemNum = 2;
        int totalPages = orderList.size()%itemNum == 0 ? orderList.size()/itemNum:orderList.size()/itemNum+1;
        orderList = orderList.subList(itemNum*(page-1),page*itemNum<orderList.size()?page*itemNum:orderList.size());

        model.addAttribute("totalPages",totalPages);
        model.addAttribute("currentPage",page);
        model.addAttribute("orderList",orderList);

        return "UserOrderList";

    }

    @RequestMapping("/userInfo/save")
    public String modifyUserInfo(HttpServletRequest request,RedirectAttributes redirectAttributes){
        HttpSession session = request.getSession(false);
        String password = request.getParameter("password");

        if (!userService.modifyInformation((String) session.getAttribute("user"),password)){
            redirectAttributes.addAttribute("result","modifyInfofailed");
            return "redirect:/userInfo";
        }

        if (request.getParameter("member").equals("false")){
            if(!userService.cancelMembership((String) session.getAttribute("user"))){
                redirectAttributes.addAttribute("result","cancelMemberfailed");
                return "redirect:/userInfo";
            }
        }

        redirectAttributes.addAttribute("result","modifyInfosucceed");
        return "redirect:/userInfo";
    }


}
