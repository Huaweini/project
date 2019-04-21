package com.service;

import com.pojo.Page;
import com.pojo.User;

import java.util.List;

public interface UserService {
    List<User> selectList(User param);

    int insert(User param);

    Page<User> getPageByParam(Page<User> page, User param);

    int update(User param);

    User selectById(Long id);

}
