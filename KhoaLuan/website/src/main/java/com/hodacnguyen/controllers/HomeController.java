/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.controllers;

import com.hodacnguyen.pojo.Product;
import com.hodacnguyen.pojo.Tag;
import com.hodacnguyen.service.ProductService;
import java.io.IOException;
import java.text.Normalizer;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @Autowired
    private ProductService productService;
    @RequestMapping("/")
    public String index(Model model) throws IOException, Exception{
        Map<String,Object> map = new HashMap<>();
        Set<Tag> tags = new HashSet<>();
        List<Product> listProductTop=productService.list(0, 8);
        for(Product item:listProductTop){
            for(Tag tag: item.getTags()){
                tags.add(tag);
            }
        }
        map.put("producttop", listProductTop);
        map.put("tags", tags);
        map.put("productnew", productService.list(0, 6, 1));
        map.put("productreview", productService.list(0, 6, 3));
        map.put("productgood", productService.list(0, 6, 5));
        model.addAllAttributes(map);
        
        return "home";
    }
    @RequestMapping("/contact")
    public String contact(Model model) throws IOException, Exception{
        Map<String,Object> map = new HashMap<>();
        Set<Tag> tags = new HashSet<>();
        List<Product> listProductTop=productService.list(0, 3);
        for(Product item:listProductTop){
            for(Tag tag: item.getTags()){
                tags.add(tag);
            }
        }
        map.put("tags", tags);
        model.addAllAttributes(map);
        return "contact";
    }
    
    public static String removeAccent(String s) {
        String temp = Normalizer.normalize(s, Normalizer.Form.NFD); 
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+"); 
        temp = pattern.matcher(temp).replaceAll(""); 
        return temp.replaceAll("đ", "d"); 
    }
    
}
