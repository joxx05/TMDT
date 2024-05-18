/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.repository.Impl;

import com.hodacnguyen.pojo.Role;
import com.hodacnguyen.repository.RoleRepo;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
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
public class RoleRepoImpl implements RoleRepo{

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    public void add(Role t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        session.save(t);
    }

    @Override
    public List<Role> list() {
        Session session= sessionFactory.getObject().getCurrentSession();
        List<Role> roleList = session.createQuery("from Role").list();
        return roleList;
    }

    @Override
    public void update(Role t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        session.update(t);
    }

    @Override
    public Role getById(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        Role p = (Role) session.get(Role.class, id);
        return p;
    }

    @Override
    public void delete(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        session.getTransaction().begin();
        Role p = (Role) session.get(Role.class, id);
        if(null != p){
            session.delete(p);
        }
    }

    @Override
    public Role getByTen(String Role) {
        Session session= this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Role> query = builder.createQuery(Role.class);
        Root root= query.from(Role.class);
        query=query.select(root);
        Predicate p = builder.equal(root.get("ten").as(String.class), Role.trim());
        query=query.where(p);
        Query q = session.createQuery(query);
        if(q.getResultList().isEmpty()){
            return null;
        }else{
            return (Role) q.getResultList().get(0);
        }  
    }
    
}
