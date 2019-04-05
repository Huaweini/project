package com.service.impl;

import com.dao.UserDao;
import com.pojo.Page;
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
    public List<User> selectList(User param) {
        return userDao.selectByParam(param);
    }

    @Override
    public int insert(User param) {
        return userDao.insertSelective(param);
    }

    @Override
    public Page<User> getPageByParam(Page<User> page, User param) {
        List<User> list = userDao.pageList(page.getOffset(), page.getSize(), param);
        page.setRes(list);
        int total = userDao.pageTotal(param);
        page.setTotal(total);
        return page;
    }

}
