package com.service;

import com.pojo.Teacher;

import java.util.List;

public interface TeacherService {
    List<Teacher> selectList();

    int insert(Teacher param);

    Teacher selectById(Long id);

}
