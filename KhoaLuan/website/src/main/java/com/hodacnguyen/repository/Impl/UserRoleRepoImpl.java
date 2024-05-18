/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.repository.Impl;

import com.hodacnguyen.pojo.UserRole;
import com.hodacnguyen.repository.UserRoleRepo;
import java.util.Calendar;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class UserRoleRepoImpl implements UserRoleRepo{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    public void add(UserRole t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        t.setDate_update(Calendar.getInstance().getTime());             
        session.save(t);
    }

    @Override
    public void delete(int iduser, int idrole) {
        Session session= sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from UserRole f where f.id_user = :iduser and f.id_role = :idrole");
        query.setParameter("iduser",iduser);
        query.setParameter("idrole",idrole);
        List<UserRole> list = query.list();
        for(UserRole p : list){
            session.delete(p);
        }
    }
    
}
