package com.kgc.dao;

import com.kgc.entity.Goodtype;
import com.kgc.entity.GoodtypeExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodtypeMapper {
    long countByExample(GoodtypeExample example);

    int deleteByExample(GoodtypeExample example);

    int deleteByPrimaryKey(Integer goodtypeId);

    int insert(Goodtype record);

    int insertSelective(Goodtype record);

    List<Goodtype> selectByExample(GoodtypeExample example);

    Goodtype selectByPrimaryKey(Integer goodtypeId);

    int updateByExampleSelective(@Param("record") Goodtype record, @Param("example") GoodtypeExample example);

    int updateByExample(@Param("record") Goodtype record, @Param("example") GoodtypeExample example);

    int updateByPrimaryKeySelective(Goodtype record);

    int updateByPrimaryKey(Goodtype record);
}