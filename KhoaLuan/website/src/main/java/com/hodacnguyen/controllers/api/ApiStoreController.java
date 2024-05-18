/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.controllers.api;

import com.hodacnguyen.pojo.Product;
import com.hodacnguyen.pojo.Store;
import com.hodacnguyen.service.StoreService;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class ApiStoreController {
    
    @Autowired
    private StoreService storeService;
    @GetMapping("api/store/list")
    public ResponseEntity<List<Store>> listStore(){
        List<Store> stores=this.storeService.list();
        return new ResponseEntity<>(stores,HttpStatus.OK);
    }
    @GetMapping("api/store/get/{id}")
    public ResponseEntity<Store> getStoreById(@PathVariable(name = "id")int id){
        Store store=this.storeService.getById(id);
        return new ResponseEntity<>(store,HttpStatus.OK);
    }
    @GetMapping("api/store/product/get/{id}")
    public ResponseEntity<Set<Product>> getProductStoreById(@PathVariable(name = "id")int id){
        Store store=this.storeService.getById(id);
        return new ResponseEntity<>(store.getProducts(),HttpStatus.OK);
    }
    @PostMapping("admin/store/status")
    @ResponseStatus(value = HttpStatus.CREATED)
    public void setStatus(@RequestParam("id")int id){
        Store u =this.storeService.getById(id);
        u.setStatus(!u.isStatus());
        this.storeService.update(u);
    }
    @PostMapping("api/store/setratespam")
    @ResponseStatus(value = HttpStatus.CREATED)
    public void setRateSpam(@RequestParam("id")int id, @RequestParam("ratespam") double ratespam){
        Store u =this.storeService.getById(id);
        u.setConfigSpamRate(ratespam);
        this.storeService.update(u);
    }
}
