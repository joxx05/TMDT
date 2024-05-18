/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service.Impl;

import com.hodacnguyen.pojo.Cart;
import com.hodacnguyen.repository.CartRepo;
import com.hodacnguyen.service.CartService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author CaNoc
 */
@Service
public class CartServiceImpl implements CartService{
    @Autowired
    private CartRepo cartRepo;
    @Override
    public void add(Cart t) {
        this.cartRepo.add(t);
    }

    @Override
    public List<Cart> list() {
        return this.cartRepo.list();
    }

    @Override
    public void update(Cart t) {
        this.cartRepo.update(t);
    }

    @Override
    public Cart getById(int id) {
        return this.cartRepo.getById(id);
    }

    @Override
    public void delete(int id) {
        this.cartRepo.delete(id);
    }
    
}
