package com.kgc.service;

import com.github.pagehelper.PageInfo;
import com.kgc.entity.Good;

/**
 * @ClassName GoodService
 * @Author linkcc
 * @Date 2021/1/31 11:57
 * @Description :
 */
public interface GoodService {
    PageInfo<Good> findAll(Good good, int page, int limit);
    void saveGood(Good good);
    Good findOne(int id);
    void deleteOne(int id);
    void updOne(Good good);
}
