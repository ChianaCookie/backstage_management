package com.jk.lly.controller;

import com.alibaba.fastjson.JSONObject;
import com.jk.lly.pojo.Curriculum;
import com.jk.lly.service.ICurriculumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("Curriculum")
public class CurriculumController {

   @Autowired
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



     //删除课程
     @RequestMapping("deletecurriculum")
     @ResponseBody
     public String deletecurriculum(String ids) {
         try {
             iCurriculumService.deletecurriculum(ids);
         } catch (Exception e) {
             e.printStackTrace();
         }
         return "1";
     }
    //根据id审核通过
    @RequestMapping("updatecurriculumbyid")
    @ResponseBody
     public String updatecurriculumbyid(Integer curriculumid){
        iCurriculumService.updatecurriculumbyid(curriculumid);

          return "1";
    }
//根据id审核驳回
    @RequestMapping("updatecurriculumbyids")
    @ResponseBody
    public String updatecurriculumbyids(Integer curriculumid){
        iCurriculumService.updatecurriculumbyids(curriculumid);
       return  "1";
    }
    //查询驳回的数据
    @RequestMapping("queryCurriculumfalse")
    @ResponseBody
    public JSONObject queryCurriculumfalse(Curriculum curriculum, int offset, int limit) {
        JSONObject json = new JSONObject();
        try {
            json = iCurriculumService.queryCurriculumfalse(curriculum, offset, limit);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }
    //整改课程回显
    @RequestMapping("querycurriculumbyid")
    public String querycurriculumbyid(Integer curriculumid, Model model) {
        Curriculum curriculum = null;
        try {
            curriculum = iCurriculumService.querycurriculumbyid(curriculumid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("curriculum", curriculum);
        return "/lly/examine/update_curriculum";
    }
    //课程回显
    @RequestMapping("updatecurriculum")
    @ResponseBody
    public String updatecurriculum(Curriculum curriculum){
        iCurriculumService.updatecurriculum(curriculum);
       return "1";
    }
}
