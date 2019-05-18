package com.service;

import com.pojo.Teacher;

import java.util.List;

public interface TeacherService {
    List<Teacher> selectList();

    int insert(Teacher param);

    Teacher selectById(Long id);

    int del(Long id);

    int update(Teacher teacher);

    List<Teacher> searchTeacher(String keyword);

    List<Teacher> myTeacher(String grade, Integer classNum);

    List<Teacher> showLeader(String unit);
}
