package com.service.impl;

import com.dao.TeacherDao;
import com.pojo.Teacher;
import com.service.TeacherService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


public class TeacherSericeImpl {
    @Service
    public class TeacherServiceImpl implements TeacherService{
        @Resource
        protected TeacherDao teacherDao;

        @Override
        public List<Teacher> selectList() {
            return teacherDao.selectByParam(null);
        }
    }
}
