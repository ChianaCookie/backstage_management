package com.jk.lly.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.lly.pojo.Curriculum;

import java.util.List;

public interface ICurriculumService {


    void addcurriculum(Curriculum curriculum);

    JSONObject queryCurriculum(Curriculum curriculum, int offset, int limit);

    void deletecurriculum(String ids);

    void updatecurriculumbyid(Integer curriculumid);

    void updatecurriculumbyids(Integer curriculumid);

    JSONObject queryCurriculumfalse(Curriculum curriculum, int offset, int limit);

    Curriculum querycurriculumbyid(Integer curriculumid);

    void updatecurriculum(Curriculum curriculum);
}
