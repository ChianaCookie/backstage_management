package com.jk.zs.config;

import org.springframework.boot.web.servlet.ServletComponentScan;

import javax.servlet.annotation.WebServlet;

/**
 * @author 10432
 * @Title: JspServlet
 * @ProjectName backstage_management
 * @Description: TODO
 * @date 2018-08-1017:15
 */

@ServletComponentScan
@WebServlet(urlPatterns = "*.jsp",name = "JspServlet")
public class JspServlet extends org.apache.jasper.servlet.JspServlet {

}