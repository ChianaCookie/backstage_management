package com.jk.lly.mapper;

import com.jk.lly.pojo.Curriculum;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ICurriculumMapper {


    void addcurriculum(Curriculum curriculum);

    long querycurriculumCount(@Param("curriculum") Curriculum curriculum);

    List<Curriculum> queryCurriculum(@Param("curriculum")Curriculum curriculum, @Param("start") int offset, @Param("end")int limit);

    void deletecurriculum(@Param("ids") String ids);

    void updatecurriculumbyid(Integer curriculumid);

    void updatecurriculumbyids(Integer curriculumid);

    long queryCurriculumfalsecount(@Param("curriculum") Curriculum curriculum);

    List<Curriculum> queryCurriculumfalse(@Param("curriculum") Curriculum curriculum, @Param("strat")int offset, @Param("end")int limit);

    Curriculum querycurriculumbyid(Integer curriculumid);

    void updatecurriculum(Curriculum curriculum);
}
