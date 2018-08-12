package com.jk.lly.mapper;

import com.jk.lly.pojo.Curriculum;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ICurriculumMapper {


    void addcurriculum(Curriculum curriculum);

    long querycurriculumCount(@Param("curriculum") Curriculum curriculum);

    List<Curriculum> queryCurriculum(@Param("curriculum")Curriculum curriculum, @Param("start") int offset, @Param("end")int limit);
}
