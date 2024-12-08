package com.example.coffeeproject.service;

import com.example.coffeeproject.domain.Cart;
import com.example.coffeeproject.domain.Coffee;
import com.example.coffeeproject.domain.Order;
import com.example.coffeeproject.domain.User;
import com.example.coffeeproject.mapper.CoffeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CartService {
    @Autowired
    private CoffeeMapper coffeeMapper;

    public CartService(CoffeeMapper coffeeMapper) {
        this.coffeeMapper = coffeeMapper;
    }

    public ArrayList<Coffee> select_all_coffee(){
        System.out.println(coffeeMapper.select_all_coffee());
        return coffeeMapper.select_all_coffee();
    }


    /**
     * 주문 데이터를 처리하는 서비스 메서드
     */
    public boolean processOrder(
            String email,
            String address,
            String zipcode,
            String[] coffeeNames,
            int[] coffeeQuantities,
            int totalPrice) {

        try {
            // user
            User user = new User();
            user.setEmail(email);
            user.setAddress(address);
            user.setZipcode(zipcode);
            coffeeMapper.insert_user(user);

            // order
            Order order = new Order();
            order.setEmail(email);
            order.setTotalPrice(totalPrice);
            coffeeMapper.insert_order(order);

            int orderId = order.getCustomerOrderNumber(); // @GeneratedKey 설정 필요

            // cart
            for (int i = 0; i < coffeeNames.length; i++) {
                Cart cart = new Cart();
                cart.setCoffee_id(getCoffeeIdByName(coffeeNames[i])); // 커피 ID를 매핑 (추가 메서드 필요)
                cart.setCustomer_order_number(orderId);
                cart.setQuantity(coffeeQuantities[i]);
                cart.setEmail(email);
                coffeeMapper.insert_cart(cart);
            }

            return true; // 모든 작업 성공
        } catch (Exception e) {
            e.printStackTrace();
            return false; // 작업 중 오류 발생
        }
    }


    private int getCoffeeIdByName(String coffeeName) {
        List<Coffee> coffees = coffeeMapper.select_all_coffee();
        for (Coffee coffee : coffees) {
            if (coffee.getCoffee_name().equalsIgnoreCase(coffeeName)) {
                return coffee.getCoffee_id();
            }
        }
        throw new IllegalArgumentException("유효하지 않은 커피 이름: " + coffeeName);
    }

}
