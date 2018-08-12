package com.jk.lly.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.lly.pojo.Curriculum;

import java.util.List;

public interface ICurriculumService {


    void addcurriculum(Curriculum curriculum);

    JSONObject queryCurriculum(Curriculum curriculum, int offset, int limit);
}
