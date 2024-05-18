/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.repository;

import com.hodacnguyen.pojo.Review;
import java.util.List;

/**
 *
 * @author CaNoc
 */
public interface ReviewRepo {
    public void add(Review t);
    public List<Review> list();
    public void update(Review t);
    public Review getById(int id);
    public void delete(int id);
}
