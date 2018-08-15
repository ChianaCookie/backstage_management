package com.jk.jgr.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jk.jgr.pojo.Log;
import com.jk.jgr.service.LongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("log")
public class LongController {

    @Autowired
    private LongService longService;


    @RequestMapping("querydsq")
    @ResponseBody
    public List<Log> dsq(){

        List<Log> list = longService.dsq();

        System.out.println(list+"查询结果");


        return list;
    }




}
