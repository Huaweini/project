package com.service;

import com.pojo.Page;
import com.pojo.User;

import java.util.List;

public interface UserService {
    List<User> selectList(User param);

    int insert(User sqlName);

    Page<User> getPageByParam(Page<User> page, User param);

}
