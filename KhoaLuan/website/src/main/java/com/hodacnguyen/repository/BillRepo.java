/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.repository;

import com.hodacnguyen.pojo.Bill;
import java.util.Date;
import java.util.List;

/**
 *
 * @author CaNoc
 */
public interface BillRepo {
    public void add(Bill t);
    public List<Bill> list();
    public List<Bill> list(Date minDate, Date maxDate);
    public void update(Bill t);
    public Bill getById(int id);
    public void delete(int id);
}
