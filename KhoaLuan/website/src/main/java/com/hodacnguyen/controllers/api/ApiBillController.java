/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.controllers.api;

import com.hodacnguyen.pojo.Bill;
import com.hodacnguyen.pojo.BillType;
import com.hodacnguyen.pojo.Cart;
import com.hodacnguyen.pojo.CartType;
import com.hodacnguyen.service.BillService;
import com.hodacnguyen.service.BillTypeService;
import com.hodacnguyen.service.CartService;
import com.hodacnguyen.service.CartTypeService;
import com.hodacnguyen.service.UserService;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ApiBillController {
    @Autowired
    private CartService cartService;
    @Autowired
    private BillService billService;
    @Autowired
    private UserService userService;
    @Autowired
    private BillTypeService billTypeService;
    @Autowired
    private CartTypeService cartTypeService;
    @GetMapping("api/bills/{iduser}")
    public ResponseEntity<Set<Bill>> list( int iduser){    
        com.hodacnguyen.pojo.User t= userService.getById(0);
        return new ResponseEntity<>(t.getBills(),HttpStatus.OK);
    }
    @GetMapping("api/bills/get/{id}")
    public ResponseEntity<Bill> getBillById(int id){    
        Bill t= billService.getById(id);
        return new ResponseEntity<>(t,HttpStatus.OK);
    }
    @GetMapping("api/bills/detail/{id}")
    public ResponseEntity<Set<BillType>> getBillTypeBillById(int id){    
        Bill t= billService.getById(id);
        return new ResponseEntity<>(t.getBillTypes(),HttpStatus.OK);
    }
    @PostMapping("admin/bills/tranfer")
    @ResponseStatus(value = HttpStatus.CREATED)
    public void tranfer(int idcart , int iduser){
        com.hodacnguyen.pojo.User t= userService.getById(iduser);
        Bill bill = new Bill();
        bill.setUser(t);
        bill.setIs_pay(Boolean.FALSE);
        billService.add(bill);
        Cart cart=cartService.getById(idcart);
        for(CartType item : cart.getCartTypes()){
            BillType billType = new BillType();
            billType.setBill(bill);
            billType.setSoluong(item.getSoluong());
            billType.setType(item.getType());
            billTypeService.add(billType);
            cartTypeService.delete(item.getId());
        }   
    }
}
