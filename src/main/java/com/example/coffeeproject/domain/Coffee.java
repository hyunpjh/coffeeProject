package com.example.coffeeproject.domain;

import lombok.Getter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Alias(value = "coffee")
@Getter
@ToString
public class Coffee {
    private int coffee_id;
    private String coffee_name;
    private int coffee_price;

}
