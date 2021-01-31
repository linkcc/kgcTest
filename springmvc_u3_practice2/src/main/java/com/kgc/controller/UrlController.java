package com.kgc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName UrlController
 * @Author linkcc
 * @Date 2021/1/31 17:05
 * @Description :
 */
@Controller
public class UrlController {

    @RequestMapping("list")
    public String list(){
        return "list";
    }
}
