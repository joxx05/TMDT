/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.repository.Impl;

import com.hodacnguyen.pojo.Tag;
import com.hodacnguyen.repository.TagRepo;
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
public class TagRepoImpl implements TagRepo{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    public void add(Tag t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        session.save(t);
    }

    @Override
    public List<Tag> list(int page, int offset) {
        Session session= sessionFactory.getObject().getCurrentSession();
        Query query =session.createQuery("from Tag");
        query.setFirstResult(page);
        query.setMaxResults(offset);
        List<Tag> tagList = query.list();
        return tagList;
    }

    @Override
    public void update(Tag t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        session.update(t);
    }

    @Override
    public Tag getById(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        Tag p = (Tag) session.load(Tag.class, id);
        return p;
    }

    @Override
    public void delete(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        Tag p = (Tag) session.load(Tag.class, id);
        if(null != p){
            session.delete(p);
        }
    }

    @Override
    public Tag addOrGet(Tag t) {
        Session session= this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Tag> query = builder.createQuery(Tag.class);
        Root root= query.from(Tag.class);
        query=query.select(root);
        Predicate p = builder.equal(root.get("ten").as(String.class), t.getTen().trim());
        query=query.where(p);
        Query q = session.createQuery(query);
        if(q.getResultList().isEmpty()){
            this.add(t);
            return t;
        }else{
            return (Tag) q.getResultList().get(0);
        }
    }
}
