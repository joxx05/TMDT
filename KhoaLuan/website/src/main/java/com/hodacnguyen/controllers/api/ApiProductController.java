/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.controllers.api;

import com.hodacnguyen.pojo.Product;
import com.hodacnguyen.pojo.Review;
import com.hodacnguyen.service.ProductService;
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
public class ApiProductController {
    @Autowired
    private ProductService productService;
    @GetMapping("api/product/{qty}")
    public ResponseEntity<List<Product>> listProducts(@PathVariable(name = "qty")int qty){
        List<Product> products=this.productService.list(0, qty);
        return new ResponseEntity<>(products,HttpStatus.OK);
    }
    @GetMapping("api/product/get/{id}")
    public ResponseEntity<Product> getProductsById(@PathVariable(name = "id")int id){
        Product product=this.productService.getById(id);
        return new ResponseEntity<>(product,HttpStatus.OK);
    }
    @GetMapping("api/product/review/get/{id}")
    public ResponseEntity<Set<Review>> getReviewProductsById(@PathVariable(name = "id")int id){
        Product product=this.productService.getById(id);
        return new ResponseEntity<>(product.getReviews(),HttpStatus.OK);
    }
    
    @PostMapping("admin/product/status")
    @ResponseStatus(value = HttpStatus.CREATED)
    public void setStatus(@RequestParam("id")int id){
        Product u =this.productService.getById(id);
        u.setStatus(!u.isStatus());
        this.productService.update(u);
    }
}
