package com.example.coffeeproject.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import java.util.ArrayList;
import java.util.List;

@Alias(value = "cart")
@Getter
@Setter
public class Cart {
    private int cart_id;
    private int coffee_id;
    private int customer_order_number;
    private int quantity;
    private String email;
}