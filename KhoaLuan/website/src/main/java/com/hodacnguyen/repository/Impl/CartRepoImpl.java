/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.repository.Impl;

import com.hodacnguyen.pojo.Cart;
import com.hodacnguyen.repository.CartRepo;
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
public class CartRepoImpl implements CartRepo{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public void add(Cart t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        session.save(t);
    }

    @Override
    public List<Cart> list() {
        Session session= sessionFactory.getObject().getCurrentSession();
        List<Cart> userList = session.createQuery("from Cart").list();
        return userList;
    }

    @Override
    public void update(Cart t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        session.update(t);
    }

    @Override
    public Cart getById(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        Cart p = (Cart) session.load(Cart.class, id);
        return p;
    }

    @Override
    public void delete(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        Cart p = (Cart) session.load(Cart.class, id);
        if(null != p){
            session.delete(p);
        }
    }
    
}
