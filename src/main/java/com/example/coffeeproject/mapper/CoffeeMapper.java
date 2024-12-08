package com.example.coffeeproject.mapper;

import com.example.coffeeproject.domain.Cart;
import com.example.coffeeproject.domain.Coffee;
import com.example.coffeeproject.domain.Order;
import com.example.coffeeproject.domain.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface CoffeeMapper {
    int insert_user(User user);
    ArrayList<Coffee> select_all_coffee();
    int insert_order(Order order);
    int insert_cart(Cart cart);
}
