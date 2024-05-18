/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.repository.Impl;

import com.hodacnguyen.pojo.ImgReview;
import com.hodacnguyen.repository.ImgReviewRepo;
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
public class ImgReviewRepoImpl implements ImgReviewRepo{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    public void add(ImgReview t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        session.save(t);
    }

    @Override
    public List<ImgReview> list() {
        Session session= sessionFactory.getObject().getCurrentSession();
        List<ImgReview> userList = session.createQuery("from ImgReview").list();
        return userList;
    }

    @Override
    public void update(ImgReview t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        session.update(t);
    }

    @Override
    public ImgReview getById(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        ImgReview p = (ImgReview) session.load(ImgReview.class, id);
        return p;
    }

    @Override
    public void delete(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        ImgReview p = (ImgReview) session.load(ImgReview.class, id);
        if(null != p){
            session.delete(p);
        }
    }
    
}
