/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service;

import com.hodacnguyen.pojo.Cart;
import java.util.List;

/**
 *
 * @author CaNoc
 */
public interface CartService {
    public void add(Cart t);
    public List<Cart> list();
    public void update(Cart t);
    public Cart getById(int id);
    public void delete(int id);
}
