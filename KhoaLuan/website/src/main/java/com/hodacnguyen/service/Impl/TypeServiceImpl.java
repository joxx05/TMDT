/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service.Impl;

import com.hodacnguyen.pojo.Type;
import com.hodacnguyen.repository.TypeRepo;
import com.hodacnguyen.service.TypeService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author CaNoc
 */
@Service
public class TypeServiceImpl implements TypeService{
    @Autowired
    private TypeRepo typeRepo;
    @Override
    public void add(Type t) {
        this.typeRepo.add(t);
    }

    @Override
    public List<Type> list() {
        return this.typeRepo.list();
    }

    @Override
    public void update(Type t) {
        this.typeRepo.update(t);
    }

    @Override
    public Type getById(int id) {
        return this.typeRepo.getById(id);
    }

    @Override
    public void delete(int id) {
        this.typeRepo.delete(id);
    }
    
}
