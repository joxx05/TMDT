/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.repository;

import com.hodacnguyen.pojo.Product;
import java.util.List;

/**
 *
 * @author CaNoc
 */
public interface ProductRepo {
    public void add(Product t);
    public List<Product> list(int page,int offset);
    public List<Product> list(int page,int offset,int sort);
    public void update(Product t);
    public Product getById(int id);
    public void delete(int id);
    public List<Product> search(String key);
}
