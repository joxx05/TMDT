/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service.Impl;

import com.hodacnguyen.pojo.Test;
import com.hodacnguyen.repository.TestRepo;
import com.hodacnguyen.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author CaNoc
 */
@Service
public class TestServiceImpl implements TestService{
    @Autowired
    private TestRepo testRepo;
    @Override
    public Test getById(int id) {
        
        return this.testRepo.getById(id);
    }
}
