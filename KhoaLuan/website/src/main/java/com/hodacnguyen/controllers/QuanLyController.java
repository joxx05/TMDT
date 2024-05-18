/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.controllers;


import com.hodacnguyen.pojo.Product;
import com.hodacnguyen.pojo.Store;
import com.hodacnguyen.service.ProductService;
import com.hodacnguyen.service.StoreService;
import com.hodacnguyen.service.TagService;
import com.hodacnguyen.service.UserService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class QuanLyController {
    @Autowired
    private TagService tagService;
    @Autowired
    private UserService userService;
    @Autowired
    private StoreService storeService;
    @Autowired
    private ProductService productService;
    @RequestMapping("/admin/user")
    public String index(Model model ,@AuthenticationPrincipal User user){
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        //com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        map.put("users", userService.list());
        model.addAllAttributes(map);
        return "quanlyuser";
    }
    @RequestMapping("/admin/store")
    public String store(Model model ,@AuthenticationPrincipal User user){
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        //com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        map.put("stores", storeService.list());
        model.addAllAttributes(map);
        return "quanlystore";
    }
    @RequestMapping("/admin/product")
    public String product(Model model ,@AuthenticationPrincipal User user){
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        //com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        map.put("products", productService.list(0,20));
        model.addAllAttributes(map);
        return "quanlysanpham";
    }
    @RequestMapping("/admin/reviews")
    public String reviews(Model model ,@AuthenticationPrincipal User user){
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        
        //map.put("products", productService.list(0,20));
        model.addAllAttributes(map);
        return "quanlybinhluan";
    }
    @RequestMapping("/admin/statistic/product")
    public String statisticProduct(Model model ,@AuthenticationPrincipal User user){
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        //com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        model.addAllAttributes(map);
        return "adminstatisproduct";
    }
    @RequestMapping("/admin/statistic/type")
    public String statisticType(Model model ,@AuthenticationPrincipal User user){
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        //com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        
        model.addAllAttributes(map);
        return "adminstatistype";
    }
    
    @PostMapping("/admin/user/search")
    public String searchUser(Model model,@RequestParam("key")String key){
        Map<String,Object> map = new HashMap<>();
        List<com.hodacnguyen.pojo.User> users = userService.searchUsers(key);
        map.put("users", users);
        model.addAllAttributes(map);
        return "layout/admin/fragment/resultuser";
    }
    @PostMapping("/admin/store/search")
    public String searchStore(Model model,@RequestParam("key")String key){
        Map<String,Object> map = new HashMap<>();
        List<Store> stores = storeService.search(key);
        map.put("stores", stores);
        model.addAllAttributes(map);
        return "layout/admin/fragment/resultstore";
    }
    @PostMapping("/admin/product/search")
    public String searchProduct(Model model,@RequestParam("key")String key){
        Map<String,Object> map = new HashMap<>();
        List<Product> products = productService.search(key);
        map.put("products", products);
        model.addAllAttributes(map);
        return "layout/admin/fragment/resultproduct";
    }
}
