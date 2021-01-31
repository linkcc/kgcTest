package com.kgc.controller;

import com.github.pagehelper.PageInfo;
import com.kgc.entity.Brand;
import com.kgc.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName BrandController
 * @Author linkcc
 * @Date 2021/1/31 17:06
 * @Description :
 */
@Controller
public class BrandController {
    @Autowired
    private BrandService brandService;

    @RequestMapping("brand/list")
    @ResponseBody
    public Map findAll(Brand brand,
                       @RequestParam(value = "page",required = false,defaultValue = "1")int page,
                       @RequestParam(value = "limit",required = false,defaultValue = "6")int limit){
        PageInfo<Brand> pageInfo = brandService.findAll(brand, page, limit);
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg","查询成功");
        map.put("count",pageInfo.getTotal());
        map.put("data",pageInfo.getList());
        return map;
    }

    @RequestMapping("brand/delete/{id}")
    @ResponseBody
    public String delOne(@PathVariable("id")int id){
        brandService.delOne(id);
        return "delete ok";
    }

    @RequestMapping("brand/find/{id}")
    @ResponseBody
    public Brand findOne(@PathVariable("id")int id){
        return brandService.findOne(id);
    }

    @RequestMapping("brand/save")
    @ResponseBody
    public String save(Brand brand){
        brandService.save(brand);
        return "insert ok";
    }

    @RequestMapping("brand/upd")
    @ResponseBody
    public String update(Brand brand){
        brandService.upd(brand);
        return "update ok";
    }


}
