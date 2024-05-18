/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service.Impl;

import com.hodacnguyen.pojo.CartType;
import com.hodacnguyen.repository.CartTypeRepo;
import com.hodacnguyen.service.CartTypeService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author CaNoc
 */
@Service
public class CartTypeServiceImpl implements CartTypeService{
    @Autowired
    private CartTypeRepo cartTypeRepo;
    @Override
    public void add(CartType t) {
        this.cartTypeRepo.add(t);
    }

    @Override
    public List<CartType> list() {
        return this.cartTypeRepo.list();
    }

    @Override
    public void update(CartType t) {
        this.cartTypeRepo.update(t);
    }

    @Override
    public CartType getById(int id) {
        return this.cartTypeRepo.getById(id);
    }

    @Override
    public void delete(int id) {
        this.cartTypeRepo.delete(id);
    }
    
}
