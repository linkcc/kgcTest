package com.kgc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgc.dao.PostinfoMapper;
import com.kgc.entity.Postinfo;
import com.kgc.entity.PostinfoExample;
import com.kgc.service.PostinfoService;
import javafx.geometry.Pos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName PostServiceImpl
 * @Author linkcc
 * @Date 2021/1/24 14:29
 * @Description :
 */
@Service
public class PostinfoServiceImpl implements PostinfoService {
    @Autowired
    private PostinfoMapper postinfoMapper;


    @Override
    public PageInfo<Postinfo> findAll(Postinfo postinfo, int page, int pageSize) {
        PageHelper.startPage(page,pageSize);
        List<Postinfo> list = postinfoMapper.findAll(postinfo);
        PageInfo<Postinfo> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public Postinfo findOne(int id) {
        return postinfoMapper.findOne(id);
    }

    @Override
    public void save(Postinfo postinfo) {
        postinfoMapper.insertSelective(postinfo);
    }

    @Override
    public void del(int id) {
        postinfoMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Postinfo postinfo) {
        postinfoMapper.updateByPrimaryKeySelective(postinfo);
    }

    @Override
    public Postinfo detail(int id) {
        return postinfoMapper.findOne(id);
    }
}
