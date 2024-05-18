/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.repository.Impl;

import com.hodacnguyen.pojo.CartType;
import com.hodacnguyen.repository.CartTypeRepo;
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
public class CartTypeRepoImpl implements CartTypeRepo{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    public void add(CartType t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        session.save(t);
    }

    @Override
    public List<CartType> list() {
        Session session= sessionFactory.getObject().getCurrentSession();
        List<CartType> userList = session.createQuery("from CartType").list();
        return userList;
    }

    @Override
    public void update(CartType t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        session.update(t);
    }

    @Override
    public CartType getById(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        CartType p = (CartType) session.load(CartType.class, id);
        return p;
    }

    @Override
    public void delete(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        CartType p = (CartType) session.load(CartType.class, id);
        if(null != p){
            session.delete(p);
        }
    }
    
}
