/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service.Impl;

import com.hodacnguyen.pojo.BillType;
import com.hodacnguyen.repository.BillTypeRepo;
import com.hodacnguyen.service.BillTypeService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author CaNoc
 */
@Service
public class BillTypeServiceImpl implements BillTypeService{
    @Autowired
    private BillTypeRepo billTypeRepo;
    @Override
    public void add(BillType t) {
        t.setIsreview(false);
        this.billTypeRepo.add(t);
    }

    @Override
    public List<BillType> list() {
        return this.billTypeRepo.list();
    }

    @Override
    public void update(BillType t) {
        this.billTypeRepo.update(t);
    }

    @Override
    public BillType getById(int id) {
        return this.billTypeRepo.getById(id);
    }

    @Override
    public void delete(int id) {
        this.billTypeRepo.delete(id);
    }
    
}
