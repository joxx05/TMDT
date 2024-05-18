/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.repository.Impl;

import com.hodacnguyen.pojo.BillType;
import com.hodacnguyen.repository.BillTypeRepo;
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
public class BillTypeRepoImpl implements BillTypeRepo{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    public void add(BillType t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        session.save(t);
    }

    @Override
    public List<BillType> list() {
        Session session= sessionFactory.getObject().getCurrentSession();
        List<BillType> userList = session.createQuery("from BillType").list();
        return userList;
    }

    @Override
    public void update(BillType t) {
        Session session= sessionFactory.getObject().getCurrentSession();
            session.update(t);
    }

    @Override
    public BillType getById(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        BillType p = (BillType) session.load(BillType.class, id);
        return p;
    }

    @Override
    public void delete(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        BillType p = (BillType) session.load(BillType.class, id);
        if(null != p){
            session.delete(p);
        }
    }
    
}
