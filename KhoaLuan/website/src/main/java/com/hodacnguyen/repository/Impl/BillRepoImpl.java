/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.repository.Impl;

import com.hodacnguyen.pojo.Bill;
import com.hodacnguyen.repository.BillRepo;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.apache.commons.lang.time.DateUtils;
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
public class BillRepoImpl implements BillRepo{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    public void add(Bill t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        session.save(t);
        
    }

    @Override
    public List<Bill> list() {
        Session session= sessionFactory.getObject().getCurrentSession();
        List<Bill> userList = session.createQuery("from Bill").list();
        return userList;
    }
    @Override
    public List<Bill> list(Date minDate, Date maxDate) {
        Session session= sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from Bill f where f.date > :min and f.date < :max");
        query.setParameter("min", minDate);
        query.setParameter("max", maxDate);
        List<Bill> list = query.list();
        return list;
    }

    @Override
    public void update(Bill t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        session.update(t);
    }

    @Override
    public Bill getById(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        Bill p = (Bill) session.load(Bill.class, id);
        return p;
    }

    @Override
    public void delete(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        Bill p = (Bill) session.load(Bill.class, id);
        if(null != p){
            session.delete(p);
        }
    }
    
}
