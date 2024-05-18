/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service.Impl;

import com.hodacnguyen.pojo.Bill;
import com.hodacnguyen.pojo.BillType;
import com.hodacnguyen.pojo.Product;
import com.hodacnguyen.pojo.Type;
import com.hodacnguyen.repository.BillRepo;
import com.hodacnguyen.service.BillService;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author CaNoc
 */
@Service
public class BillServiceImpl implements BillService{
    @Autowired
    private BillRepo billRepo;
    @Override
    public void add(Bill t) {
        this.billRepo.add(t);
    }

    @Override
    public List<Bill> list() {
        return this.billRepo.list();
    }

    @Override
    public void update(Bill t) {
        this.billRepo.update(t);
    }

    @Override
    public Bill getById(int id) {
        return this.billRepo.getById(id);
    }

    @Override
    public void delete(int id) {
        this.billRepo.delete(id);
    }

    @Override
    public List<Product> statisticalProduct(int idshop, Date minDate, Date maxDate,int groupBy) {
        Calendar cal = Calendar.getInstance();
        List<Product> list = new ArrayList<>();
        
        for(Bill bill:this.billRepo.list(minDate,maxDate)){//duyet tung bill
            cal.setTime(bill.getDate());
            for(BillType billType:bill.getBillTypes()){//duyet tung bill type
                if(billType.getType().getProduct().getStoreOfProduct().getId()== idshop||idshop<=0){
                    Product product = billType.getType().getProduct();
                    switch (groupBy){
                        case 0://thang
                            String groupby=String.valueOf(cal.get(Calendar.MONTH)+1)+"/"+String.valueOf(cal.get(Calendar.YEAR));
                            product.setGroupBy(groupby);
                            product.setDoanhThu(billType.getType().getPrice()*billType.getSoluong());
                            break;
                        case 1://nam
                            cal.setTime(bill.getDate());
                            String groupby1= String.valueOf(cal.get(Calendar.YEAR));
                            product.setGroupBy(groupby1);
                            product.setDoanhThu(billType.getType().getPrice()*billType.getSoluong());
                            break;
                        case 2://quy
                            String groupby2=String.valueOf((cal.get(Calendar.MONTH)+1)/3+1)+"-"+String.valueOf(cal.get(Calendar.YEAR));
                            product.setGroupBy(groupby2);
                            product.setDoanhThu(billType.getType().getPrice()*billType.getSoluong());
                            break;
                    }
                    boolean flag=true;
                    for(Product item:list){
                        if(item.getId()==product.getId()&&item.getGroupBy().equals(product.getGroupBy())){
                            item.setDoanhThu(item.getDoanhThu()+product.getDoanhThu());
                            flag=false;
                            break;
                        }
                    }
                    if(flag){
                        list.add(product);
                    }
                }
            }
        }
        return list;
    }
    
    @Override
    public List<Type> statisticalType(int idshop, Date minDate, Date maxDate, int groupBy) {
        Calendar cal = Calendar.getInstance();
        List<Type> list = new ArrayList<>();
        
        for(Bill bill:this.billRepo.list(minDate,maxDate)){//duyet tung bill
            cal.setTime(bill.getDate());
            for(BillType billType:bill.getBillTypes()){//duyet tung bill type
                if(billType.getType().getProduct().getStoreOfProduct().getId()== idshop||idshop<=0){
                    Type type = billType.getType();
                    switch (groupBy){
                        case 0://thang
                            String groupby=String.valueOf(cal.get(Calendar.MONTH)+1)+"/"+String.valueOf(cal.get(Calendar.YEAR));
                            type.setGroupBy(groupby);
                            type.setDoanhThu(billType.getType().getPrice()*billType.getSoluong());
                            break;
                        case 1://nam
                            cal.setTime(bill.getDate());
                            String groupby1= String.valueOf(cal.get(Calendar.YEAR));
                            type.setGroupBy(groupby1);
                            type.setDoanhThu(billType.getType().getPrice()*billType.getSoluong());
                            break;
                        case 2://quy
                            String groupby2=String.valueOf((cal.get(Calendar.MONTH)+1)/3+1)+"-"+String.valueOf(cal.get(Calendar.YEAR));
                            type.setGroupBy(groupby2);
                            type.setDoanhThu(billType.getType().getPrice()*billType.getSoluong());
                            break;
                    }
                    boolean flag=true;
                    for(Type item:list){
                        if(item.getId()==type.getId()&&item.getGroupBy().equals(type.getGroupBy())){
                            item.setDoanhThu(item.getDoanhThu()+type.getDoanhThu());
                            flag=false;
                            break;
                        }
                    }
                    if(flag){
                        list.add(type);
                    }
                }
            }
        }
        return list;
    }

    @Override
    public List<Bill> list(Date minDate, Date maxDate) {
        return this.billRepo.list(minDate, maxDate);
    }  
}
