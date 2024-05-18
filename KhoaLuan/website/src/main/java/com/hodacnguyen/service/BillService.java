/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service;

import com.hodacnguyen.pojo.Bill;
import com.hodacnguyen.pojo.Product;
import com.hodacnguyen.pojo.Type;
import java.util.Date;
import java.util.List;

/**
 *
 * @author CaNoc
 */
public interface BillService {
    public void add(Bill t);
    public List<Bill> list();
    public List<Bill> list(Date minDate, Date maxDate);
    public void update(Bill t);
    public Bill getById(int id);
    public void delete(int id);
    public List<Product> statisticalProduct(int idshop, Date minDate, Date maxDate,int groupBy);
    public List<Type> statisticalType(int idshop, Date minDate, Date maxDate,int groupBy);
}
