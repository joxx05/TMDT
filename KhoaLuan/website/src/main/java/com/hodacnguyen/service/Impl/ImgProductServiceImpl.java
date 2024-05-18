/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service.Impl;

import com.hodacnguyen.pojo.ImgProduct;
import com.hodacnguyen.repository.ImgProductRepo;
import com.hodacnguyen.service.ImgProductService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author CaNoc
 */
@Service
public class ImgProductServiceImpl implements ImgProductService{
    @Autowired
    private ImgProductRepo imgProductRepo;
    @Override
    public void add(ImgProduct t) {
        this.imgProductRepo.add(t);
    }

    @Override
    public List<ImgProduct> list() {
        return this.imgProductRepo.list();
    }

    @Override
    public void update(ImgProduct t) {
        this.imgProductRepo.update(t);
    }

    @Override
    public ImgProduct getById(int id) {
        return this.imgProductRepo.getById(id);
    }

    @Override
    public void delete(int id) {
        this.imgProductRepo.delete(id);
    }
    
}
