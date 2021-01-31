package com.kgc.dao;

import com.github.pagehelper.PageInfo;
import com.kgc.entity.Good;
import com.kgc.entity.GoodExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodMapper {
    long countByExample(GoodExample example);

    int deleteByExample(GoodExample goodExample);

    int deleteByPrimaryKey(Integer goodId);

    int insert(Good record);

    int insertSelective(Good record);

    List<Good> selectByExample(GoodExample example);

    Good selectByPrimaryKey(Integer goodId);

    int updateByExampleSelective(@Param("record") Good record, @Param("example") GoodExample example);

    int updateByExample(@Param("record") Good record, @Param("example") GoodExample example);

    int updateByPrimaryKeySelective(Good record);

    int updateByPrimaryKey(Good record);

    List<Good> findAll(Good good);
}