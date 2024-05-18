/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service.Impl;

import com.hodacnguyen.pojo.Review;
import com.hodacnguyen.repository.ReviewRepo;
import com.hodacnguyen.service.ReviewService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author CaNoc
 */
@Service
public class ReviewServiceImpl implements ReviewService{
    @Autowired
    private ReviewRepo reviewRepo;
    @Override
    public void add(Review t) {
        this.reviewRepo.add(t);
    }

    @Override
    public List<Review> list() {
        return this.reviewRepo.list();
    }

    @Override
    public void update(Review t) {
        this.reviewRepo.update(t);
    }

    @Override
    public Review getById(int id) {
        return this.reviewRepo.getById(id);
    }

    @Override
    public void delete(int id) {
        this.reviewRepo.delete(id);
    }
    
}
