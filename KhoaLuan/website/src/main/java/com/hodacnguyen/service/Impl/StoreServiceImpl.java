/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service.Impl;

import com.hodacnguyen.pojo.Product;
import com.hodacnguyen.pojo.Review;
import com.hodacnguyen.pojo.Store;
import com.hodacnguyen.repository.ReviewRepo;
import com.hodacnguyen.repository.StoreRepo;
import com.hodacnguyen.service.StoreService;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author CaNoc
 */
@Service
public class StoreServiceImpl implements StoreService {

    @Autowired
    private StoreRepo storeRepo;
    @Autowired
    private ReviewRepo reviewRepo;

    @Override
    public void add(Store t) {
        this.storeRepo.add(t);
    }

    @Override
    public List<Store> list() {
        return this.storeRepo.list();
    }

    @Override
    public void update(Store t) {
        this.storeRepo.update(t);
    }

    @Override
    public Store getById(int id) {
        return this.storeRepo.getById(id);
    }

    @Override
    public void delete(int id) {
        this.storeRepo.delete(id);
    }

    @Override
    public List<Store> search(String key) {
        return this.storeRepo.search(key);
    }

    @Override
    public List<Review> getAllReviews(int idStore, int page, String sort) {
        int offset = 10;
        List<Review> listReview = new ArrayList<>();
        if (idStore == 0) {
            listReview = reviewRepo.list();
        } else {
            Store store = this.storeRepo.getById(idStore);
            for (Product item : store.getProducts()) {
                listReview.addAll(item.getReviews());
            }
        }

        if ("date_up".equals(sort)) {
            Collections.sort(listReview, Comparator.comparing(Review::getDate));
        } else if ("date_down".equals(sort)) {
            Collections.sort(listReview, Comparator.comparing(Review::getDate).reversed());
        } else if ("ratespam_up".equals(sort)) {
            Collections.sort(listReview, Comparator.comparingDouble(Review::getSpamRate));
        } else if ("ratespam_down".equals(sort)) {
            Collections.sort(listReview, Comparator.comparingDouble(Review::getSpamRate).reversed());
        } else if ("status_up".equals(sort)) {
            Collections.sort(listReview, Comparator.comparing(Review::getStatus));
        } else if ("status_down".equals(sort)) {
            Collections.sort(listReview, Comparator.comparing(Review::getStatus).reversed());
        }
        int startIndex = page * offset;
        int endIndex = startIndex + offset;
        if (endIndex >= listReview.size()) {
            endIndex = listReview.size() - 1;
        }
        if (startIndex >= listReview.size()) {
            return null;
        }
        return listReview.subList(startIndex, endIndex);
    }
}
