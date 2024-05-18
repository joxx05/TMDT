/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.repository.Impl;

import com.hodacnguyen.pojo.Promotion;
import com.hodacnguyen.repository.PromotionRepo;
import java.util.List;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author CaNoc
 */
@Repository
@Transactional
public class PromotionRepoImpl implements PromotionRepo{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    public void add(Promotion t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        session.save(t);
    }

    @Override
    public List<Promotion> list() {
        Session session= sessionFactory.getObject().getCurrentSession();
        List<Promotion> userList = session.createQuery("from Promotion").list();
        return userList;
    }

    @Override
    public void update(Promotion t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        session.update(t);
    }

    @Override
    public Promotion getById(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        Promotion p = (Promotion) session.load(Promotion.class, id);
        return p;
    }

    @Override
    public void delete(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        Promotion p = (Promotion) session.load(Promotion.class, id);
        if(null != p){
            session.delete(p);
        }
    }
    
}
