/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.repository;

import com.hodacnguyen.pojo.Message;
import java.util.List;

/**
 *
 * @author cumy1
 */
public interface MessageRepo {
    public void add(Message t);
    public List<Message> list(int user1,int user2);
    public void update(Message t);
    public Message getbyuserid(int user1,int user2);
    public Message getbyuserid(int user1);
}
