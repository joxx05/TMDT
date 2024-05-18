
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service;

import com.hodacnguyen.pojo.Promotion;
import java.util.List;

/**
 *
 * @author CaNoc
 */
public interface PromotionService {
    public void add(Promotion t);
    public List<Promotion> list();
    public void update(Promotion t);
    public Promotion getById(int id);
    public void delete(int id);
}
