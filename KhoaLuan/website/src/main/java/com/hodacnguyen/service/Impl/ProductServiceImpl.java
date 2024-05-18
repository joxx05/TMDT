/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service.Impl;

import com.hodacnguyen.pojo.Product;
import com.hodacnguyen.pojo.Review;
import com.hodacnguyen.repository.ImgProductRepo;
import com.hodacnguyen.repository.ProductRepo;
import com.hodacnguyen.repository.StoreRepo;
import com.hodacnguyen.service.ProductService;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author CaNoc
 */
@Service
public class ProductServiceImpl implements ProductService{
    @Autowired
    private ProductRepo productRepo;
    @Autowired
    private ImgProductRepo imgProductRepo;
    @Autowired
    private StoreRepo storeRepo;
    @Override
    public void add(Product t) {
        t.setRating(0);
        this.productRepo.add(t);
    }

    @Override
    public List<Product> list(int page, int offset) {
        return this.productRepo.list(page,offset);
    }
    @Override
    public List<Product> list(int page, int offset, int sort) {
        return this.productRepo.list(page,offset,sort);
    }

    @Override
    public void update(Product t) {
        
        this.productRepo.update(t);
    }

    @Override
    public Product getById(int id) {
        return this.productRepo.getById(id);
    }

    @Override
    public void delete(int id) {
        this.productRepo.delete(id);
    }

    @Override
    public List<Product> search(String key) {
        return this.productRepo.search(key);
    }

    @Override
    public Product productTopView(int idshop) {
        List<Product> products=new ArrayList<Product>();
        if(idshop<=0){
            products = this.list(0, 100);
        }else{
            products.addAll(this.storeRepo.getById(idshop).getProducts());
        }
        
        Product p = null;
        for(Product product: products){
            if(p==null||p.getView()<product.getView()){
                p=product;
            }
        }
        return p;
    }

    @Override
    public void setRating(Product t) {
        Set<Review> reviews = t.getReviews();
        double rating =0;
        int i=0;
        for(Review item : reviews){
            rating+=item.getRate();
            i++;
        }
        if(i>0){
            rating=rating/i;
        }
        
        t.setRating(rating);
        this.update(t);
    }
    
    
}
