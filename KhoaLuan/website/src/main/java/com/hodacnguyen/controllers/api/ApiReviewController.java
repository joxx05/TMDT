/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.controllers.api;

import com.hodacnguyen.pojo.Cart;
import com.hodacnguyen.pojo.CartType;
import com.hodacnguyen.pojo.Review;
import com.hodacnguyen.service.ReviewService;
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

/**
 *
 * @author Nguyen
 */
@RestController
public class ApiReviewController {
    @Autowired
    private ReviewService reviewService;
    @Autowired
    private StoreService storeService;
    
    @GetMapping("api/reviews/gets")
    public ResponseEntity<List<Review>> getReviews(@RequestParam(defaultValue = "0") int page, @RequestParam(name = "idstore") int idStore, @RequestParam(name = "sort",defaultValue = "id") String sortBy){
        List<Review> reviews= this.storeService.getAllReviews(idStore, page, sortBy);
        return new ResponseEntity<>(reviews,HttpStatus.OK);
    }
    @PostMapping("api/reviews/status")
    @ResponseStatus(value = HttpStatus.CREATED)
    public void setStatus(@RequestParam("id")int id){
        Review u =this.reviewService.getById(id);
        u.setStatus(!u.getStatus());
        this.reviewService.update(u);
    }
}
