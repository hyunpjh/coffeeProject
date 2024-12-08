package com.example.coffeeproject.service;

import com.example.coffeeproject.mapper.CoffeeMapper;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
    private CoffeeMapper coffeeMapper;
    public OrderService(CoffeeMapper coffeeMapper) {
        this.coffeeMapper = coffeeMapper;
    }
}
