/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.repository.Impl;

import com.hodacnguyen.pojo.ImgProduct;
import com.hodacnguyen.repository.ImgProductRepo;
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
public class ImgProductRepoImpl implements ImgProductRepo{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    public void add(ImgProduct t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        session.save(t);
    }

    @Override
    public List<ImgProduct> list() {
        Session session= sessionFactory.getObject().getCurrentSession();
        List<ImgProduct> userList = session.createQuery("from ImgProduct").list();
        return userList;
    }

    @Override
    public void update(ImgProduct t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        session.update(t);
    }

    @Override
    public ImgProduct getById(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        ImgProduct p = (ImgProduct) session.load(ImgProduct.class, id);
        return p;
    }

    @Override
    public void delete(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        ImgProduct p = (ImgProduct) session.load(ImgProduct.class, id);
        if(null != p){
            session.delete(p);
        }
    }
    
}
