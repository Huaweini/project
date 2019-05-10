package com.dao;

import com.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface UserDao extends BaseDataDao<User> {
    User selectById(Long id);

    int del (Long id);

    List<User> searchUser(@Param("keyword")String keyword);
}
