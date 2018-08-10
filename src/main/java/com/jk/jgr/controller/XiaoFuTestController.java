package com.jk.jgr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("jgr")
public class XiaoFuTestController {

    @RequestMapping("xiaofu")
    public String xiaofu(){


        return "xiaofu";
    }



}
