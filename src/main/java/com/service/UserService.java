package com.service;

import com.pojo.User;

import java.util.List;

public interface UserService {

    int insert(User param);


    int update(User param);

    User selectById(Long id);

    int del (Long id);

    List<User>  searchUser(String keyword);

}
