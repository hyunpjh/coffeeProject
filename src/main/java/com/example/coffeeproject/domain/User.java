package com.example.coffeeproject.domain;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

@Alias(value = "user")
@Getter
@Setter
public class User {
    private String email;
    private String address;
    private String zipcode;
}
