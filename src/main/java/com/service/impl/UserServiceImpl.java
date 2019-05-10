package com.service.impl;

import com.dao.UserDao;

import com.github.pagehelper.Page;
import com.pojo.User;
import com.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    protected UserDao userDao;

    @Override
    public int insert(User param) {
        return userDao.insertSelective(param);
    }



    @Override
    public int update(User param) {
        return userDao.updateSelective(param);
    }

    @Override
    public User selectById(Long id) {
        return userDao.selectById(id);
    }

    @Override
    public int del(Long id) {
        return userDao.del(id);
    }

    @Override
    public List<User>  searchUser(String keyword) {
        return userDao.searchUser(keyword);
    }

}
