/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.repository.Impl;

import com.hodacnguyen.pojo.Test;
import com.hodacnguyen.repository.TestRepo;
import org.hibernate.Session;
import org.hibernate.query.Query;
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
public class TestRepoImpl implements TestRepo{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public Test getById(int id) {
        Session session= (sessionFactory.getObject().getCurrentSession());
        Query q = session.createQuery("From Test");
        
        return (Test) q.getResultList().get(id);
    }  
}
