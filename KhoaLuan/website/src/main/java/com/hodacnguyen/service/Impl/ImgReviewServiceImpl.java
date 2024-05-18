/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service.Impl;

import com.hodacnguyen.pojo.ImgReview;
import com.hodacnguyen.repository.ImgReviewRepo;
import com.hodacnguyen.service.ImgReviewService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author CaNoc
 */
@Service
public class ImgReviewServiceImpl implements ImgReviewService{
    @Autowired
    private ImgReviewRepo imgReviewRepo;
    @Override
    public void add(ImgReview t) {
        this.imgReviewRepo.add(t);
    }

    @Override
    public List<ImgReview> list() {
        return this.imgReviewRepo.list();
    }

    @Override
    public void update(ImgReview t) {
        this.imgReviewRepo.update(t);
    }

    @Override
    public ImgReview getById(int id) {
        return this.imgReviewRepo.getById(id);
    }

    @Override
    public void delete(int id) {
        this.imgReviewRepo.delete(id);
    }
    
}
