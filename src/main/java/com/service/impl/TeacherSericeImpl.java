package com.service.impl;

import com.dao.TeacherDao;
import com.pojo.Teacher;
import com.service.TeacherService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TeacherSericeImpl implements TeacherService {
    @Resource
    protected TeacherDao teacherDao;

    @Override
    public List<Teacher> selectList() {
        return teacherDao.selectByParam(null);
    }

    @Override
    public int insert(Teacher param) {
        return teacherDao.insertSelective(param);
    }

    @Override
    public Teacher selectById(Long id) {
        return teacherDao.selectById(id);
    }

    @Override
    public int del(Long id) {
        return teacherDao.del(id);
    }

    @Override
    public int update(Teacher teacher) {
        return teacherDao.updateSelective(teacher);
    }

    @Override
    public List<Teacher> searchTeacher(String keyword) {
        return teacherDao.searchTeacher(keyword);
    }

    @Override
    public List<Teacher> myTeacher(String grade, Integer classNum) {
        return teacherDao.myTeacher(grade,classNum);
    }
}

