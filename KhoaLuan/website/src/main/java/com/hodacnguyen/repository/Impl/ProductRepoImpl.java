/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.repository.Impl;

import com.hodacnguyen.pojo.Product;
import com.hodacnguyen.repository.ProductRepo;
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
public class ProductRepoImpl implements ProductRepo{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    public void add(Product t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        t.setStatus(true);
        session.save(t);
    }

    @Override
    public List<Product> list(int page, int offset) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from Product");
        query.setFirstResult(page);
        query.setMaxResults(offset);
        List<Product> roleList = query.list();
        return roleList;
    }
    @Override
    public List<Product> list(int page, int offset, int sort) {
        Session session= sessionFactory.getObject().getCurrentSession();
        String hql = "";
        switch (sort) {
            case 1:
                hql = "FROM Product f ORDER BY f.id DESC";
                break;
            case 2:
                hql = "FROM Product f ORDER BY f.id ASC";
                break;
            case 3:
                hql = "FROM Product f ORDER BY f.ten DESC";
                break;
            case 4:
                hql = "FROM Product f ORDER BY f.ten ASC";
                break;  
            case 5:
                hql = "FROM Product f ORDER BY f.view DESC";
                break;
            case 6:
                hql = "FROM Product f ORDER BY f.view ASC";
                break;
            case 7:
                hql = "FROM Product f ORDER BY f.rating DESC";
                break;
            case 8:
                hql = "FROM Product f ORDER BY f.rating ASC";
                break;
        }
        Query query = session.createQuery(hql);
        query.setFirstResult(page);
        query.setMaxResults(offset);
        List<Product> roleList = query.list();
        return roleList;
    }

    @Override
    public void update(Product t) {
        Session session= sessionFactory.getObject().getCurrentSession();
        session.update(t);
    }

    @Override
    public Product getById(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        Product p = (Product) session.load(Product.class, id);
        return p;
    }

    @Override
    public void delete(int id) {
        Session session= sessionFactory.getObject().getCurrentSession();
        Product p = (Product) session.load(Product.class, id);
        if(null != p){
            session.delete(p);
        }
    }

    @Override
    public List<Product> search(String key) {
        Session session= this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Product> query = builder.createQuery(Product.class);
        Root root= query.from(Product.class);
        query=query.select(root);
        Predicate t = builder.like(root.get("ten"), "%"+key+"%");
        query=query.where(t);
        Query q = session.createQuery(query);
        return q.getResultList();
    }
    
}
