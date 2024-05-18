/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.repository.Impl;
import com.hodacnguyen.pojo.Store;
import com.hodacnguyen.pojo.User;
import com.hodacnguyen.repository.UserRepo;
import java.util.Calendar;
import java.util.List;
import java.util.Set;
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
public class UserRepoImpl implements UserRepo{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public void add(User t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        t.setDateCreate(Calendar.getInstance().getTime());
        t.setDateUpdate(Calendar.getInstance().getTime());              
        session.save(t);
    }

    @Override
    public List<User> list() {
        Session session= sessionFactory.getObject().getCurrentSession();
        List<User> userList = session.createQuery("from User").list();
        return userList;
    }

    @Override
    public void update(User t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        session.update(t);
    }

    @Override
    public User getById(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        User p = (User) session.get(User.class, id);
        return p;
    }

    @Override
    public void delete(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        User p = (User) session.load(User.class, id);
        if(null != p){
            session.delete(p);
        }
    }

    @Override
    public List<User> getUsers(String email) {
        Session session= this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root= query.from(User.class);
        query=query.select(root);
        if(!email.isEmpty()){
            Predicate p = builder.equal(root.get("email").as(String.class), email.trim());
            Predicate t = builder.equal(root.get("status").as(boolean.class), true);
            Predicate e = builder.and(p, t);
            query=query.where(e);
        }
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public Set<Store> getStores(User t) {
        return t.getStores();
    }

    @Override
    public List<User> searchUsers(String key) {
        Session session= sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from User f where f.email like :searchField or f.ten like :searchField or f.ho like :searchField");
        query.setParameter("searchField","%"+key+"%");
        List<User> userList = query.list();
        return userList;
    }
    
}
