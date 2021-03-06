package com.bdyh.web.home.action;

import com.bdyh.common.APIResponse;
import com.bdyh.entity.*;
import com.bdyh.service.OrderService;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("order")
public class OrderAction<T> {


    @Autowired
    private OrderService orderService;

//    @RequestMapping("createOrder")
//    @Transactional
//    public String CreateOrder(@Param("courseId") Integer courseId, @Param("videosId") Integer[] videosId, HttpSession session, Model model) {
//        UserWechat userWechat = (UserWechat) session.getAttribute("user");
//        if (userWechat == null) {
//            throw new BdyhException(ResultEnum.USER_NOT_EXIST);
//        }
//        if (courseId == null || videosId == null) {
//            throw new BdyhException(ResultEnum.PROPERTY_ERROR);
//        }
//
//
//        OrderVo order = orderService.createOrder(courseId, videosId, userWechat);
//
//        model.addAttribute("order", order);
//        return "wechat/course/Pay";
//
//
//    }

    @RequestMapping("intoOrder")
    public String IntoOrder(String orderId, Model model) {

        OrderVo orderVo = orderService.findOne(orderId);
        model.addAttribute("order", orderVo);
        return "wechat/course/Pay";

    }


    @RequestMapping("cancelOrder")
    @ResponseBody
    public APIResponse cancelOrder(String orderId) {
        return orderService.cancel(orderId);
    }

    @RequestMapping("myOrder")
    public String findOrder() {
        return null;
    }




}
