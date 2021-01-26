package com.kgc.controller;

import com.github.pagehelper.PageInfo;
import com.kgc.entity.Postinfo;
import com.kgc.service.PostinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName PostinfoController
 * @Author linkcc
 * @Date 2021/1/24 14:38
 * @Description :
 */
@Controller
public class PostinfoController {
    @Autowired
    private PostinfoService postinfoService;

    @RequestMapping("postinfo/list")
    @ResponseBody
    public Map list(Postinfo postinfo,
                    @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                    @RequestParam(value = "limit", required = false, defaultValue = "5") int limit
    ) {
        PageInfo<Postinfo> pageInfo = postinfoService.findAll(postinfo, page, limit);
        Map map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "查询成功");
        map.put("count", pageInfo.getTotal());
        map.put("data", pageInfo.getList());
        return map;
    }

    @RequestMapping("postinfo/{id}")
    public String findOne(@PathVariable("id") int id) {
        Postinfo one = postinfoService.findOne(id);
        System.out.println(one);
        return "list";
    }

    @RequestMapping(value = "postinfo/save", produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public String postinfoSave(Postinfo postinfo) {
        postinfoService.save(postinfo);
        return "add ok";
    }

    @RequestMapping("postinfo/delete/{id}")
    @ResponseBody
    public String delPostinfo(@PathVariable("id") int id) {
        postinfoService.del(id);
        return "del ok";
    }

    @RequestMapping("postinfo/find/{id}")
    @ResponseBody
    public Postinfo updatePostinfo(@PathVariable("id") int id) {
        return postinfoService.findOne(id);

    }

    @RequestMapping("postinfo/update")
    @ResponseBody
    public String updatePostinfo(Postinfo postinfo) {
        postinfoService.update(postinfo);
        System.out.println(postinfo);
        return "upd ok";
    }

    @RequestMapping("postinfo/detail/{id}")
    @ResponseBody
    public Postinfo detailPostinfo(@PathVariable("id") int id) {
        return postinfoService.detail(id);
    }

    @RequestMapping("postinfo/detailOne/{id}")
    @ResponseBody
    public void detailOne(@PathVariable("id") int id) {
        Postinfo detail = postinfoService.detail(id);
        Integer clicknum = detail.getClicknum();
//        if (clicknum == null) {
//            detail.setClicknum(1);
//        } else {
//            detail.setClicknum(clicknum + 1);
//        }
        detail.setClicknum((clicknum == null ? 1 : clicknum + 1));
        System.out.println(detail);
        postinfoService.update(detail);
    }


}
