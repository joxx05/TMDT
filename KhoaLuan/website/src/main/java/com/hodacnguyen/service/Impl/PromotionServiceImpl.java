/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service.Impl;

import com.hodacnguyen.pojo.Promotion;
import com.hodacnguyen.repository.PromotionRepo;
import com.hodacnguyen.service.PromotionService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author CaNoc
 */
@Service
public class PromotionServiceImpl implements PromotionService{
    @Autowired
    private PromotionRepo promotionRepo;
    @Override
    public void add(Promotion t) {
        this.promotionRepo.add(t);
    }

    @Override
    public List<Promotion> list() {
        return this.promotionRepo.list();
    }

    @Override
    public void update(Promotion t) {
        this.promotionRepo.update(t);
    }

    @Override
    public Promotion getById(int id) {
        return this.promotionRepo.getById(id);
    }

    @Override
    public void delete(int id) {
        this.promotionRepo.delete(id);
    }
    
}
