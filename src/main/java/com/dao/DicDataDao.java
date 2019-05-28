package com.dao;

import com.pojo.DicData;

import java.util.List;

public interface DicDataDao extends BaseDataDao {
    List<Object> getClassList();
}
