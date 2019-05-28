package com.service.impl;


import com.dao.DicDataDao;
import com.service.DicDataService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DicDataServiceImpl implements DicDataService {
    @Resource
    private DicDataDao dicDataDao;
    @Override
    public List<Object> getClassList() {
        return dicDataDao.getClassList();
    }
}
