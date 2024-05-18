/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.repository.Impl;

import com.hodacnguyen.pojo.Message;
import com.hodacnguyen.repository.MessageRepo;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class MessageRepoImpl implements MessageRepo{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    public void add(Message t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        session.save(t);
    }

    @Override
    public List<Message> list(int user1, int user2) {
        Session session= sessionFactory.getObject().getCurrentSession();
        String hql = "FROM Message f WHERE f.incoming = "+user1+" AND f.outcoming = "+user2+" OR f.incoming = "+user2+" AND f.outcoming = "+user1+" ORDER BY f.id DESC";
        Query query = session.createQuery(hql);
        query.setFirstResult(0);
        query.setMaxResults(20);
        List<Message> messList = query.list();
        return messList;
    }

    @Override
    public void update(Message t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        session.update(t);
    }

    @Override
    public Message getbyuserid(int user1, int user2) {
        Session session= sessionFactory.getObject().getCurrentSession();
        String hql = "FROM Message f WHERE (f.incoming = "+user1+" AND f.outcoming = "+user2+" OR f.incoming = "+user2+" AND f.outcoming = "+user1+") AND f.is_load = false ORDER BY f.id DESC";
        Query query = session.createQuery(hql);
        query.setFirstResult(0);
        query.setMaxResults(1);
        List<Message> messList = query.list();
        if(messList.size() <= 0){
            return null;
        }
        return messList.get(0);
    }

    @Override
    public Message getbyuserid(int user1) {
        Session session= sessionFactory.getObject().getCurrentSession();
        String hql = "FROM Message f WHERE f.outcoming = "+user1+" AND f.is_load = false ORDER BY f.id DESC";
        Query query = session.createQuery(hql);
        query.setFirstResult(0);
        query.setMaxResults(1);
        List<Message> messList = query.list();
        if(messList.size() <= 0){
            return null;
        }
        return messList.get(0);
    }
    
}
