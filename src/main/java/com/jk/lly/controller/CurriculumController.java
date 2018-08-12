package com.jk.lly.controller;

import com.alibaba.fastjson.JSONObject;
import com.jk.lly.pojo.Curriculum;
import com.jk.lly.service.ICurriculumService;
import com.sun.webkit.ContextMenu;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("Curriculum")
public class CurriculumController {
    @Resource
    private ICurriculumService iCurriculumService;
    //分页
    @RequestMapping("queryCurriculum")
    @ResponseBody
    public JSONObject queryCurriculum(Curriculum curriculum, int offset, int limit) {
        JSONObject json = new JSONObject();
        try {
            json = iCurriculumService.queryCurriculum(curriculum, offset, limit);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }



    @RequestMapping("addcurriculum")
    @ResponseBody
    public String addcurriculum(Curriculum curriculum){
        iCurriculumService.addcurriculum(curriculum);

           return "1";
    }
}
