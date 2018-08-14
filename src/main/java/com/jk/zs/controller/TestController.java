package com.jk.zs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 10432
 * @Title: TestController
 * @ProjectName backstage_management
 * @Description: TODO
 * @date 2018-08-0911:35
 */
@Controller
public class TestController {


    @RequestMapping("ceshi")
    public String ceshi(){

        System.out.println("测试");
        return "homepage";
    }

}
