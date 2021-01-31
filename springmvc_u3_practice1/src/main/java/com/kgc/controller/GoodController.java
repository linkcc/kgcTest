package com.kgc.controller;

import com.github.pagehelper.PageInfo;
import com.kgc.entity.Good;
import com.kgc.service.GoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName GoodController
 * @Author linkcc
 * @Date 2021/1/31 12:06
 * @Description :
 */
@Controller
public class GoodController {

    @Autowired
    private GoodService goodService;

    @RequestMapping("good/list")
    @ResponseBody
    public Map findAll(Good good,
                       @RequestParam(value = "page",required = false,defaultValue = "1")int page,
                       @RequestParam(value = "limit",required = false,defaultValue = "3")int limit){
        PageInfo<Good> pageInfo = goodService.findAll(good, page, limit);
        Map map = new HashMap();
        map.put("code", 0);
        map.put("msg", "查询成功");
        map.put("count", pageInfo.getTotal());
        map.put("data", pageInfo.getList());
        return map;
    }

    @RequestMapping("good/save")
    @ResponseBody
    public String insertGood(Good good){
        System.out.println(good);
        goodService.saveGood(good);
        return "insert ok";
    }


    @RequestMapping("good/find/{id}")
    @ResponseBody
    public Good findOne(@PathVariable("id") int id){
        return goodService.findOne(id);
    }

    @RequestMapping("good/delete/{id}")
    @ResponseBody
    public String deleteOne(@PathVariable("id") int id){
        goodService.deleteOne(id);
        return "delete ok";
    }


    @RequestMapping("good/upd")
    @ResponseBody
    public String updOne(Good good){
        System.out.println(good);
        goodService.updOne(good);
        return "update ok";
    }
}
