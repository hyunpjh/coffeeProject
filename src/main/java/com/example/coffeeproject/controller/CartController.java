package com.example.coffeeproject.controller;

import com.example.coffeeproject.domain.Coffee;
import com.example.coffeeproject.service.CartService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class CartController {
    private CartService cartService;

    public CartController(CartService cartService) {
        this.cartService = cartService;
    }

    @GetMapping("/user_view.do")
    public String user_view(Model model) {
        ArrayList<Coffee> coffees = cartService.select_all_coffee();
        model.addAttribute("coffees", coffees);
        return "user_view";
    }

    @PostMapping("/user_view_ok.do")
    public String user_view_ok(
            @RequestParam("email") String email,
            @RequestParam("address") String address,
            @RequestParam("zipcode") String zipcode,
            @RequestParam("coffee_names") String[] coffeeNames,
            @RequestParam("coffee_quantities") int[] coffeeQuantities,
            @RequestParam("total_price") int totalPrice,
            Model model) {

        boolean isOrderProcessed = cartService.processOrder(email, address, zipcode, coffeeNames, coffeeQuantities, totalPrice);

        if (isOrderProcessed) {
            model.addAttribute("message", "주문이 성공적으로 처리되었습니다.");
        } else {
            model.addAttribute("message", "주문 처리에 실패했습니다. 다시 시도해 주세요.");
        }

        return "user_view_ok";
    }

}
