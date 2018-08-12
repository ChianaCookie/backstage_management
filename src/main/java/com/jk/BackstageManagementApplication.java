package com.jk;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@MapperScan("com.jk.lly.mapper")
@SpringBootApplication
public class BackstageManagementApplication extends SpringBootServletInitializer {



	public static void main(String[] args) {
		SpringApplication.run(BackstageManagementApplication.class, args);
	}

	//支持JSP页面
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application){
		return application.sources(BackstageManagementApplication.class);
	}



}
