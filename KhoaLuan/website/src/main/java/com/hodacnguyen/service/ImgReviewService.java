/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service;

import com.hodacnguyen.pojo.ImgReview;
import java.util.List;

/**
 *
 * @author CaNoc
 */
public interface ImgReviewService {
    public void add(ImgReview t);
    public List<ImgReview> list();
    public void update(ImgReview t);
    public ImgReview getById(int id);
    public void delete(int id);
}
