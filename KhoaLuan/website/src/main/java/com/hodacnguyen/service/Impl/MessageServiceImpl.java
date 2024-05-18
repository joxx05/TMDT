/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service.Impl;

import com.hodacnguyen.pojo.Message;
import com.hodacnguyen.repository.MessageRepo;
import com.hodacnguyen.service.MessageService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author cumy1
 */
@Service
public class MessageServiceImpl implements MessageService{
    @Autowired
    private MessageRepo messageRepo;
    @Override
    public void add(Message t) {
        t.setIs_load(Boolean.FALSE);
        this.messageRepo.add(t);
    }

    @Override
    public List<Message> list(int user1, int user2) {
        List<Message> list = this.messageRepo.list(user1, user2);
        for(Message item:list){
            if(Boolean.FALSE==item.getIs_load()){
                this.update(item);
            }
        }
        return list;
    }

    @Override
    public void update(Message t) {
        t.setIs_load(Boolean.TRUE);
        this.messageRepo.update(t);
    }

    @Override
    public Message getbyid(int user1, int user2) {
        Message mess=this.messageRepo.getbyuserid(user1, user2);     
        return mess;
    }

    @Override
    public Message getbyid(int user1) {
        return this.messageRepo.getbyuserid(user1);
    }
    
}
