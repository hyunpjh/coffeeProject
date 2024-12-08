package com.example.coffeeproject.domain;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

@Alias(value = "order")
@Getter
@Setter
public class Order {
    private int customerOrderNumber;
    private String orderDate;
    private int totalPrice;
    private String email;
}
