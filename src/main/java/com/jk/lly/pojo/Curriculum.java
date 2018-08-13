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
    private Integer curriculumfrom;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date curriculumtime;
    private Integer curriculumstatus;
    private Integer  curriculumtype;
    private String  curriculumneirong;
    private String  dismissal;

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

    public Integer getCurriculumstatus() {
        return curriculumstatus;
    }

    public void setCurriculumstatus(Integer curriculumstatus) {
        this.curriculumstatus = curriculumstatus;
    }

    public Integer getCurriculumtype() {
        return curriculumtype;
    }

    public void setCurriculumtype(Integer curriculumtype) {
        this.curriculumtype = curriculumtype;
    }

    public String getCurriculumneirong() {
        return curriculumneirong;
    }

    public void setCurriculumneirong(String curriculumneirong) {
        this.curriculumneirong = curriculumneirong;
    }

    public String getDismissal() {
        return dismissal;
    }

    public void setDismissal(String dismissal) {
        this.dismissal = dismissal;
    }

    @Override
    public String toString() {
        return "Curriculum{" +
                "curriculumid=" + curriculumid +
                ", curriculumnumber=" + curriculumnumber +
                ", curriculumname='" + curriculumname + '\'' +
                ", curriculumprice=" + curriculumprice +
                ", curriculumfrom=" + curriculumfrom +
                ", curriculumtime=" + curriculumtime +
                ", curriculumstatus=" + curriculumstatus +
                ", curriculumtype=" + curriculumtype +
                ", curriculumneirong='" + curriculumneirong + '\'' +
                ", dismissal='" + dismissal + '\'' +
                '}';
    }
}
