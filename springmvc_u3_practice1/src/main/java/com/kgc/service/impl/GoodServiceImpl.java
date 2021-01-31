package com.kgc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgc.dao.GoodMapper;
import com.kgc.entity.Good;
import com.kgc.service.GoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName GoodServiceImpl
 * @Author linkcc
 * @Date 2021/1/31 11:57
 * @Description :
 */
@Service
public class GoodServiceImpl implements GoodService {
    @Autowired
    private GoodMapper goodMapper;

    @Override
    public PageInfo<Good> findAll(Good good, int page, int limit) {
        PageHelper.startPage(page, limit);
        List<Good> list = goodMapper.findAll(good);
        PageInfo<Good> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public void saveGood(Good good) {
        goodMapper.insertSelective(good);
    }

    @Override
    public Good findOne(int id) {
        return goodMapper.selectByPrimaryKey(id);
    }

    @Override
    public void deleteOne(int id) {
        goodMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updOne(Good good) {
        goodMapper.updateByPrimaryKeySelective(good);
    }
}
