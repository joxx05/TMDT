/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service;

import com.hodacnguyen.pojo.CartType;
import java.util.List;

/**
 *
 * @author CaNoc
 */
public interface CartTypeService {
    public void add(CartType t);
    public List<CartType> list();
    public void update(CartType t);
    public CartType getById(int id);
    public void delete(int id);
}
