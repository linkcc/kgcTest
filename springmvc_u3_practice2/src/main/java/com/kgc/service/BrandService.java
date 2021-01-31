package com.kgc.service;

import com.github.pagehelper.PageInfo;
import com.kgc.entity.Brand;

/**
 * @ClassName BrandService
 * @Author linkcc
 * @Date 2021/1/31 17:06
 * @Description :
 */
public interface BrandService {
    PageInfo<Brand> findAll(Brand brand,int page,int limit);
    void delOne(int id);
    Brand findOne(int id);
    void save(Brand brand);
    void upd(Brand brand);
}
