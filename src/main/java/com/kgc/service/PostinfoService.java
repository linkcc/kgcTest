package com.kgc.service;

import com.github.pagehelper.PageInfo;
import com.kgc.entity.Postinfo;

import java.util.List;

/**
 * @ClassName PostinfoService
 * @Author linkcc
 * @Date 2021/1/24 14:29
 * @Description :
 */
public interface PostinfoService {
    //查询所有PostInfo信息
    PageInfo<Postinfo> findAll(Postinfo postinfo, int page, int pageSize);

    Postinfo findOne(int id);

    void save(Postinfo postinfo);

    void del(int id);

    void update(Postinfo postinfo);

    Postinfo detail(int id);
}
