package com.jk.jgr.rabbitmq;

import com.jk.jgr.pojo.Log;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Sender {


    @Autowired
    private AmqpTemplate rabbitTemplate;

    public void send(Log log) {
        System.out.println("Sender : " + log);
        this.rabbitTemplate.convertAndSend("mc", log);
    }



}
