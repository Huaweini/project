package com.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BaseDataDao<T> {

    /**
     * 根据传入的POJO类查询数据
     *
     * @param param
     * @return
     */
    List<T> selectByParam(T param);

    /**
     * 根据传入的POJO类有选择的插入数据
     *
     * @param param
     * @return
     */
    int insertSelective(T param);

    /**
     * 根据传入的POJO类有选择的更新数据
     *
     * @param param
     * @return
     */
    int updateSelective(T param);

    /**
     * 获取分页列表
     *
     * @param offset
     * @param size
     * @param param
     * @return
     */
    List<T> pageList(@Param("offset") int offset, @Param("size") int size, @Param("param") T param);

    /**
     * 获取分页总数据量
     *
     * @param param
     * @return
     */
    int pageTotal(@Param("param") T param);

    /**
     * 根据ID查询
     *
     * @param id
     * @return
     */
    T getById(Integer id);

    /**
     * 根据ID删除
     *
     * @param id
     * @return
     */
    T delById(Integer id);


}

