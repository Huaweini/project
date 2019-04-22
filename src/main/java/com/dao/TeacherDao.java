package com.dao;

import com.pojo.Teacher;

public interface TeacherDao extends BaseDataDao<Teacher> {
    Teacher selectById(Long id);
}
