package com.dao;

import com.pojo.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeacherDao extends BaseDataDao<Teacher> {
    Teacher selectById(Long id);

    int del(Long id);

    List<Teacher> searchTeacher(@Param("keyword") String keyword);

    List<Teacher> myTeacher(@Param("classNum") Integer classNum);

    List<Teacher> myLeader(String unit);
}
