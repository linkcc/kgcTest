package com.kgc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgc.dao.BrandMapper;
import com.kgc.entity.Brand;
import com.kgc.entity.BrandExample;
import com.kgc.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName BrandServiceImpl
 * @Author linkcc
 * @Date 2021/1/31 17:07
 * @Description :
 */
@Service
public class BrandServiceImpl implements BrandService {
    @Autowired
    private BrandMapper brandMapper;

    @Override
    public PageInfo<Brand> findAll(Brand brand, int page, int limit) {
        PageHelper.startPage(page, limit);
        BrandExample brandExample = new BrandExample();
        BrandExample.Criteria criteria = brandExample.createCriteria();
        if (brand.getName() != null && brand.getName().length() > 0) {
            criteria.andNameLike('%' + brand.getName() + '%');
        }
        if (brand.getStatus() != null && brand.getStatus() > -1) {
            criteria.andStatusEqualTo(brand.getStatus());
        }
        List<Brand> list = brandMapper.selectByExample(brandExample);
        PageInfo<Brand> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public void delOne(int id) {
        brandMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Brand findOne(int id) {
        return brandMapper.selectByPrimaryKey(id);
    }

    @Override
    public void save(Brand brand) {
        brandMapper.insertSelective(brand);
    }

    @Override
    public void upd(Brand brand) {
        brandMapper.updateByPrimaryKeySelective(brand);
    }
}
