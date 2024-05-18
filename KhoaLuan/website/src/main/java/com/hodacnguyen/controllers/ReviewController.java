/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.controllers;

import com.hodacnguyen.pojo.BillType;
import com.hodacnguyen.pojo.ImgProduct;
import com.hodacnguyen.pojo.ImgReview;
import com.hodacnguyen.pojo.Product;
import com.hodacnguyen.pojo.Review;
import com.hodacnguyen.service.BillTypeService;
import com.hodacnguyen.service.ImgReviewService;
import com.hodacnguyen.service.ReviewService;
import com.hodacnguyen.service.TagService;
import com.hodacnguyen.service.UserService;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ReviewController {
    @Autowired
    private UserService userService;
    @Autowired
    private ReviewService reviewService;
    @Autowired
    private TagService tagService;
    @Autowired
    private BillTypeService billTypeService;
    @Autowired
    private ImgReviewService imgReviewService;
    
    @RequestMapping("product/review/{idbilltype}")
    public String index(Model model ,@AuthenticationPrincipal User user,@PathVariable(name = "idbilltype") int idbilltype){
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        BillType billType =billTypeService.getById(idbilltype);
        map.put("billtype",billType);
        model.addAllAttributes(map);
        return "review";
    }
    @RequestMapping(value = "product/review/{idbilltype}",method = RequestMethod.POST)
    public String addreview(Model model ,@AuthenticationPrincipal User user,@PathVariable(name = "idbilltype") int idbilltype,@RequestParam(name = "comment")String comment,@RequestParam(name = "spamRate")Double spamRate, @RequestParam(name = "rating")int rating,@RequestParam("img[]") MultipartFile[] files,HttpServletRequest req){
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        BillType billType =billTypeService.getById(idbilltype);
        billType.setIsreview(true);
        billTypeService.update(billType);
        Product product = billType.getType().getProduct();
        Double spamRateConfig = product.getStoreOfProduct().getConfigSpamRate();
        Review review = new Review();
        review.setComment(comment);
        review.setProduct(product);
        review.setRate(rating);
        review.setUser(t);
        review.setSpamRate(spamRate);
        if(spamRate>=spamRateConfig){
            review.setStatus(Boolean.FALSE);
        }else{
            review.setStatus(Boolean.TRUE);
        }
        reviewService.add(review);
        for(MultipartFile file:files ){
            String filePath = System.currentTimeMillis()+".jpg";
            try {
                String rootPath = req.getServletContext().getRealPath("resources");
                File dir = new File(rootPath+File.separator+"image"+File.separator+"reviews");
                if(!dir.exists()){
                    dir.mkdir();
                }
                byte[] bytes = file.getBytes();
                try (FileOutputStream fos = new FileOutputStream(dir.getAbsoluteFile()+File.separator+filePath)) {
                    fos.write(bytes);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            ImgReview imgReview = new ImgReview();
            imgReview.setReview(review);
            imgReview.setImg(filePath);
            imgReviewService.add(imgReview);
        }
        map.put("billtype",billType);
        model.addAllAttributes(map);
        return "redirect:/bill";
    }
}
