package com.dao;

import com.pojo.User;

import java.util.List;


public interface UserDao extends BaseDataDao<User> {
    User selectById(Long id);

    User update(User param);
}
