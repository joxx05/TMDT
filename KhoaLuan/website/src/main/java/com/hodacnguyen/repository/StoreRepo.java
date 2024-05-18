/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.repository;

import com.hodacnguyen.pojo.Store;
import java.util.List;

/**
 *
 * @author CaNoc
 */
public interface StoreRepo {
    public void add(Store t);
    public List<Store> list();
    public void update(Store t);
    public Store getById(int id);
    public void delete(int id);
    public List<Store> search(String key);
}
