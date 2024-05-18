/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.repository.Impl;

import com.hodacnguyen.pojo.Store;
import com.hodacnguyen.repository.StoreRepo;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class StoreRepoImpl implements StoreRepo{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    public void add(Store t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        t.setStatus(true);
        session.save(t);
    }

    @Override
    public List<Store> list() {
        Session session= sessionFactory.getObject().getCurrentSession();
        List<Store> userList = session.createQuery("from Store").list();
        return userList;
    }

    @Override
    public void update(Store t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        session.update(t);
    }

    @Override
    public Store getById(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        Store p = (Store) session.get(Store.class, id);
        return p;
    }

    @Override
    public void delete(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        Store p = (Store) session.get(Store.class, id);
        if(null != p){
            session.delete(p);
        }
    }

    @Override
    public List<Store> search(String key) {
        Session session= sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from Store f where f.ten like :searchField");
        query.setParameter("searchField","%"+key+"%");
        List<Store> storeList = query.list();
        return storeList;
    }
    
}
