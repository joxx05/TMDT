/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.repository;

import com.hodacnguyen.pojo.ImgProduct;
import java.util.List;

/**
 *
 * @author CaNoc
 */
public interface ImgProductRepo {
    public void add(ImgProduct t);
    public List<ImgProduct> list();
    public void update(ImgProduct t);
    public ImgProduct getById(int id);
    public void delete(int id);
}