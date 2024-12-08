package com.example.coffeeproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
    @RequestMapping("/manager_view.do")
    public String manager_view() {
        return "manager_view";
    }
}
