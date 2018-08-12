package com.jk.lly.pojo;

import org.springframework.context.annotation.Primary;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Primary
public class Curriculum {
    private Integer  curriculumid;
    private Integer  curriculumnumber;
    private String  curriculumname;
    private Double curriculumprice;
    private Double curriculumnowprice;
    private Integer curriculumfrom;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date curriculumtime;
    private Integer auditstatus;

    public Integer getCurriculumid() {
        return curriculumid;
    }

    public void setCurriculumid(Integer curriculumid) {
        this.curriculumid = curriculumid;
    }

    public Integer getCurriculumnumber() {
        return curriculumnumber;
    }

    public void setCurriculumnumber(Integer curriculumnumber) {
        this.curriculumnumber = curriculumnumber;
    }

    public String getCurriculumname() {
        return curriculumname;
    }

    public void setCurriculumname(String curriculumname) {
        this.curriculumname = curriculumname;
    }

    public Double getCurriculumprice() {
        return curriculumprice;
    }

    public void setCurriculumprice(Double curriculumprice) {
        this.curriculumprice = curriculumprice;
    }

    public Double getCurriculumnowprice() {
        return curriculumnowprice;
    }

    public void setCurriculumnowprice(Double curriculumnowprice) {
        this.curriculumnowprice = curriculumnowprice;
    }

    public Integer getCurriculumfrom() {
        return curriculumfrom;
    }

    public void setCurriculumfrom(Integer curriculumfrom) {
        this.curriculumfrom = curriculumfrom;
    }

    public Date getCurriculumtime() {
        return curriculumtime;
    }

    public void setCurriculumtime(Date curriculumtime) {
        this.curriculumtime = curriculumtime;
    }

    public Integer getAuditstatus() {
        return auditstatus;
    }

    public void setAuditstatus(Integer auditstatus) {
        this.auditstatus = auditstatus;
    }

    @Override
    public String toString() {
        return "Curriculum{" +
                "curriculumid=" + curriculumid +
                ", curriculumnumber=" + curriculumnumber +
                ", curriculumname='" + curriculumname + '\'' +
                ", curriculumprice=" + curriculumprice +
                ", curriculumnowprice=" + curriculumnowprice +
                ", curriculumfrom=" + curriculumfrom +
                ", curriculumtime=" + curriculumtime +
                ", auditstatus=" + auditstatus +
                '}';
    }
}
