package com.jk.jgr.rabbitmq;

import com.jk.jgr.pojo.Log;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;

@Component
@RabbitListener(queues = "mc")
public class RabbiReceiver {

    @Autowired
    private MongoTemplate mongoTemplate;

    @RabbitHandler
    public void process(Log log) {

        mongoTemplate.save(log);


    }




}
