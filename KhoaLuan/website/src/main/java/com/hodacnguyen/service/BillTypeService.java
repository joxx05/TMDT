/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service;

import com.hodacnguyen.pojo.BillType;
import java.util.List;

/**
 *
 * @author CaNoc
 */
public interface BillTypeService {
    public void add(BillType t);
    public List<BillType> list();
    public void update(BillType t);
    public BillType getById(int id);
    public void delete(int id);
}
