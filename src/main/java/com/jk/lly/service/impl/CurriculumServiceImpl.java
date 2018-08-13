package com.jk.lly.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.lly.mapper.ICurriculumMapper;
import com.jk.lly.pojo.Curriculum;
import com.jk.lly.service.ICurriculumService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CurriculumServiceImpl implements ICurriculumService {
    @Resource
    private ICurriculumMapper iCurriculumMapper;

    @Override
    public void addcurriculum(Curriculum curriculum) {
        iCurriculumMapper.addcurriculum(curriculum);
    }

    @Override
    public JSONObject queryCurriculum(Curriculum curriculum, int offset, int limit) {
        long totals = iCurriculumMapper.querycurriculumCount(curriculum);
        List<Curriculum> list = iCurriculumMapper.queryCurriculum(curriculum,offset,limit);
        JSONObject json = new JSONObject();
        json.put("total",totals);
        json.put("rows",list);
        return json;
    }





    @Override
    public void deletecurriculum(String ids) {
        String[] strs = ids.split(",");
        for (int i = 0;i < strs.length;i++){
            iCurriculumMapper.deletecurriculum(strs[i]);
        }
    }

    @Override
    public void updatecurriculumbyid(Integer curriculumid) {
        iCurriculumMapper.updatecurriculumbyid(curriculumid);
    }

    @Override
    public void updatecurriculumbyids(Integer curriculumid) {
        iCurriculumMapper.updatecurriculumbyids(curriculumid);
    }

    @Override
    public JSONObject queryCurriculumfalse(Curriculum curriculum, int offset, int limit) {
        long totals = iCurriculumMapper.queryCurriculumfalsecount(curriculum);
        List<Curriculum> list = iCurriculumMapper.queryCurriculumfalse(curriculum,offset,limit);
        JSONObject json = new JSONObject();
        json.put("total",totals);
        json.put("rows",list);
        return json;
    }

    @Override
    public Curriculum querycurriculumbyid(Integer curriculumid) {

        return iCurriculumMapper.querycurriculumbyid(curriculumid);
    }

    @Override
    public void updatecurriculum(Curriculum curriculum) {
        iCurriculumMapper.updatecurriculum(curriculum);
    }


}
