/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.controllers;

import com.hodacnguyen.pojo.Product;
import com.hodacnguyen.service.ProductService;
import com.hodacnguyen.service.TagService;
import java.text.Normalizer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author CaNoc
 */
@Controller
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private TagService tagService;
    @RequestMapping("/products/{page}/{sort}")
    public String index(Model model,@PathVariable(name = "page")int page,@PathVariable(name="sort")int sort){
        Map<String,Object> map = new HashMap<>();
        map.put("products", productService.list(page, 9,sort));
        map.put("productsnew", productService.list(page, 6,1));
        map.put("page", page);
        map.put("sort", sort);
        map.put("tags", tagService.list(0, 8));
        model.addAllAttributes(map);
        return "products";
    }
    @RequestMapping("/products/tag/{idtag}")
    public String tag(Model model,@PathVariable(name = "idtag")int idtag){
        Map<String,Object> map = new HashMap<>();
        map.put("tag", tagService.getById(idtag));
        map.put("tags", tagService.list(0, 8));
        model.addAllAttributes(map);
        return "tag";
    }
    @RequestMapping("/product/{idproduct}")
    public String detail(Model model, @PathVariable(name = "idproduct") int idproduct){
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        Product product =productService.getById(idproduct);
        product.setView(product.getView()+1);
        productService.update(product);
        productService.setRating(product);
        map.put("product",productService.getById(idproduct));
        model.addAllAttributes(map);
        return "product";
    }
    @RequestMapping(value = "search", method = RequestMethod.POST, produces = { MimeTypeUtils.TEXT_PLAIN_VALUE })
    public String Search(@RequestParam("keysearch") String keysearch, Model model) {
        Map<String,Object> map = new HashMap<>();
        List<Product> products = productService.search(removeAccent(keysearch));
        map.put("products", products);
        model.addAllAttributes(map);
        return "layout/user/fragment/resultsearch";
    }
    public static String removeAccent(String s) {
        String temp = Normalizer.normalize(s, Normalizer.Form.NFD); 
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+"); 
        temp = pattern.matcher(temp).replaceAll(""); 
        return temp.replaceAll("đ", "d"); 
    }
}
