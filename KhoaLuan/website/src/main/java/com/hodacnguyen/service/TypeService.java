/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service;

import com.hodacnguyen.pojo.Type;
import java.util.List;

/**
 *
 * @author CaNoc
 */
public interface TypeService {
    public void add(Type t);
    public List<Type> list();
    public void update(Type t);
    public Type getById(int id);
    public void delete(int id);
}
