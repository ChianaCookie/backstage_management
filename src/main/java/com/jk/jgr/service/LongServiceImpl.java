package com.jk.jgr.service;

import com.jk.jgr.mapper.LongDao;
import com.jk.jgr.pojo.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class LongServiceImpl implements LongService {

    @Autowired
    private LongDao longdao;


    @Autowired
    private MongoTemplate ongoTemplate;

    @Override
    public List<Log> dsq() {

        return ongoTemplate.findAll(Log.class);
    }
}
