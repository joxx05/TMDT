/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.controllers;


import com.hodacnguyen.pojo.ImgProduct;
import com.hodacnguyen.pojo.Product;
import com.hodacnguyen.pojo.Store;
import com.hodacnguyen.pojo.Tag;
import com.hodacnguyen.pojo.Type;
import com.hodacnguyen.service.ImgProductService;
import com.hodacnguyen.service.ProductService;
import com.hodacnguyen.service.StoreService;
import com.hodacnguyen.service.TagService;
import com.hodacnguyen.service.TypeService;
import com.hodacnguyen.service.UserService;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


/**
 *
 * @author CaNoc
 */
@Controller
public class MyShopController {
    @Autowired
    private UserService userService;
    @Autowired
    private StoreService storeService;
    @Autowired
    private ProductService productService;
    @Autowired
    private ImgProductService imgProductService;
    @Autowired
    private TagService tagService;
    @Autowired
    private TypeService typeService;
    
    @Transactional
    @GetMapping("/myshop")
    public String index(Model model, @AuthenticationPrincipal User user) {
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        
        if(userService.getStores(t).isEmpty()){
            map.put("stores", null);
        }else{
            map.put("stores", userService.getStores(t));
        }
        
        model.addAllAttributes(map);
        return "myshop";
    }
    @GetMapping("/myshop/create")
    public String create(Model model, @AuthenticationPrincipal User user) {
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        map.put("store", new Store());
        model.addAllAttributes(map);
        return "createshop";
    }
    @RequestMapping(value = "/myshop/create", method = RequestMethod.POST)
    public String addShop(Model model, @ModelAttribute(value = "store") Store store,@AuthenticationPrincipal User user) {
        com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        store.setUser(t);
        store.setDate_create(Calendar.getInstance().getTime());
        storeService.add(store);
        return "redirect:/myshop";
    }
    @Transactional
    @GetMapping("/myshop/detail/{idshop}")
    public String detail(Model model, @AuthenticationPrincipal User user, @PathVariable(value = "idshop")int idshop) {
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        Set<Store> stores = userService.getStores(t);
        boolean isCheck = false;
        for(Store item : stores ){
            if(item.getId()==idshop && item.isStatus()){
                isCheck = true;
                break;
            }
        }
        map.put("isCheck",isCheck);
        if(isCheck){
            Store store=storeService.getById(idshop);
            
            map.put("productCount",store.getProducts().size());
            map.put("products",store.getProducts());
            map.put("store",store);
        }
        model.addAllAttributes(map);
        return "detailshop";
    }
    @GetMapping("/myshop/statisproduct/{idshop}")
    public String statisProduct(Model model, @AuthenticationPrincipal User user, @PathVariable(value = "idshop")int idshop) {
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        Set<Store> stores = userService.getStores(t);
        boolean isCheck = false;
        for(Store item : stores ){
            if(item.getId()==idshop){
                isCheck = true;
                break;
            }
        }
        map.put("isCheck",isCheck);
        if(isCheck){
            Store store=storeService.getById(idshop);
            map.put("store",store);
        }
        model.addAllAttributes(map);
        return "statisproduct";
    }
    @GetMapping("/myshop/review/{idshop}")
    public String review(Model model, @AuthenticationPrincipal User user, @PathVariable(value = "idshop")int idshop) {
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        Set<Store> stores = userService.getStores(t);
        boolean isCheck = false;
        for(Store item : stores ){
            if(item.getId()==idshop && item.isStatus()){
                isCheck = true;
                break;
            }
        }
        map.put("isCheck",isCheck);
        if(isCheck){
            Store store=storeService.getById(idshop);
            map.put("store",store);
        }
        map.put("idstore",idshop);
        model.addAllAttributes(map);
        return "quanlybinhluanshop";
    }
    @GetMapping("/myshop/statistype/{idshop}")
    public String statisType(Model model, @AuthenticationPrincipal User user, @PathVariable(value = "idshop")int idshop) {
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        Set<Store> stores = userService.getStores(t);
        boolean isCheck = false;
        for(Store item : stores ){
            if(item.getId()==idshop){
                isCheck = true;
                break;
            }
        }
        map.put("isCheck",isCheck);
        if(isCheck){
            Store store=storeService.getById(idshop);
            map.put("store",store);
        }
        model.addAllAttributes(map);
        return "statistype";
    }
    @Transactional
    @GetMapping("/myshop/detail/addproduct/{idshop}")
    public String addProduct(Model model, @AuthenticationPrincipal User user, @PathVariable(value = "idshop")int idshop) {
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        Set<Store> stores = userService.getStores(t);
        boolean isCheck = false;
        for(Store item : stores ){
            if(item.getId()==idshop){
                isCheck = true;
                break;
            }
        }
        map.put("isCheck",isCheck);
        if(isCheck){
            Store store=storeService.getById(idshop);
            map.put("store",store);
            map.put("product", new Product());
        }
        model.addAllAttributes(map);
        return "addproduct";
    }
    @RequestMapping(value = "/myshop/detail/addproduct/{idshop}", method = RequestMethod.POST)
    public String postProduct(@RequestParam("img[]") MultipartFile[] files,@RequestParam(value = "nametype[]") String[] nametype,@RequestParam(value = "motatype[]") String[] motatype,@RequestParam(value = "price[]") int[] price,@RequestParam(value = "ghichutype[]") String[] ghichutype,@RequestParam(value = "tag") String tag, @PathVariable(value = "idshop")int idshop, @ModelAttribute(value = "product") Product product,HttpServletRequest req) {
        Store store=storeService.getById(idshop);
        product.setStoreOfProduct(store);
        productService.add(product);
        Set<ImgProduct> imgProducts = new HashSet<>();
        for(MultipartFile file:files ){
            String filePath = System.currentTimeMillis()+".jpg";
            try {
                String rootPath = req.getServletContext().getRealPath("resources");
                File dir = new File(rootPath+File.separator+"image"+File.separator+"products");
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
            ImgProduct imgProduct = new ImgProduct();
            imgProduct.setProduct(product);
            imgProduct.setImg(filePath);
            imgProductService.add(imgProduct);
            imgProducts.add(imgProduct);
        }
        product.setImgProducts(imgProducts);
        productService.update(product);
        
        Set<Tag> tags = new HashSet<>();
        String[] arrTag = tag.split(",");
        for(String item:arrTag){
            Tag t = new Tag();
            t.setTen(item.trim());
            t.setGhichu(removeAccent(item).trim().replaceAll(" ", ""));
            Tag tagrs =tagService.addOrGet(t);
            if(tagrs.getProducts()==null){
                tagrs.setProducts(new HashSet<>());
            }
            tagrs.getProducts().add(product);
            tags.add(tagrs);
            tagService.update(tagrs);
        }
        product.setTags(tags);
        productService.update(product);
        Set<Type> types = new HashSet<>();
        
        int i =0;
        for(String name:nametype){
            Type type = new Type();
            type.setTen(name);
            if(i<motatype.length){
                type.setMota(motatype[i]);
            }
            
            if(i<ghichutype.length){
                type.setGhichu(ghichutype[i]);
            }
            if(i<motatype.length){
                type.setPrice(price[i]);
            }
            type.setProduct(product);
            typeService.add(type);
            types.add(type);
            i++;
        }
        return "redirect:/myshop/detail/"+idshop;
    }
    @GetMapping("/myshop/detail/{idshop}/product/{idproduct}")
    public String updateProduct(Model model, @PathVariable(value = "idproduct")int idproduct,@PathVariable(value = "idshop")int idshop) {
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        map.put("idshop", idshop);
        map.put("product", productService.getById(idproduct));
        model.addAllAttributes(map);
        return "detailproduct";
    }

    @RequestMapping(value = "/myshop/detail/{idshop}/product/{idproduct}", method = RequestMethod.POST)
    public String postUpdateProduct(@RequestParam("img[]") MultipartFile[] files,@RequestParam(value = "nametype[]") String[] nametype,@RequestParam(value = "motatype[]") String[] motatype,@RequestParam(value = "price[]") int[] price,@RequestParam(value = "ghichutype[]") String[] ghichutype,@RequestParam(value = "tag") String tag, @PathVariable(value = "idproduct")int idproduct,@PathVariable(value = "idshop")int idshop, @ModelAttribute(value = "product") Product product,HttpServletRequest req) {
        product.setStoreOfProduct(storeService.getById(idshop));
        for(Type item: productService.getById(product.getId()).getTypes()){
            typeService.delete(item.getId());
        }
        if(files.length>0){
            for(ImgProduct item: productService.getById(product.getId()).getImgProducts()){
                imgProductService.delete(item.getId());
            }
        }
        productService.update(product);
        Set<ImgProduct> imgProducts = new HashSet<>();
        for(MultipartFile file:files ){
            String filePath = System.currentTimeMillis()+".jpg";
            try {
                String rootPath = req.getServletContext().getRealPath("resources");
                File dir = new File(rootPath+File.separator+"image"+File.separator+"products");
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
            ImgProduct imgProduct = new ImgProduct();
            imgProduct.setProduct(product);
            imgProduct.setImg(filePath);
            imgProductService.add(imgProduct);
            imgProducts.add(imgProduct);
        }
        product.setImgProducts(imgProducts);
        productService.update(product);
        
        Set<Tag> tags = new HashSet<>();
        String[] arrTag = tag.split(",");
        for(String item:arrTag){
            Tag t = new Tag();
            t.setTen(item.trim());
            t.setGhichu(removeAccent(item).trim().replaceAll(" ", ""));
            Tag tagrs =tagService.addOrGet(t);
            if(tagrs.getProducts()==null){
                tagrs.setProducts(new HashSet<>());
            }
            tagrs.getProducts().add(product);
            tags.add(tagrs);
            tagService.update(tagrs);
        }
        product.setTags(tags);
        productService.update(product);
        
        Set<Type> types = new HashSet<>();
        int i =0;
        for(String name:nametype){
            Type type = new Type();
            type.setTen(name);
            if(motatype.length>i){
                type.setMota(motatype[i]);
            }
            if(ghichutype.length>i){
                type.setGhichu(ghichutype[i]);
            }
            if(price.length>i){
                type.setPrice(price[i]);
            }
            type.setProduct(product);
            typeService.add(type);
            types.add(type);
            i++;
        }
        return "redirect:/myshop/detail/"+idshop+"/product/"+idproduct;
    }
    
    
    @Transactional
    @RequestMapping(value = "searchinshop", method = RequestMethod.POST, produces = { MimeTypeUtils.TEXT_PLAIN_VALUE })
    public String Search(@RequestParam("keysearch") String keysearch,@RequestParam("idshop") int idshop,Model model) {
        Map<String,Object> map = new HashMap<>();
        Store store=storeService.getById(idshop);
        Set<Product>t=store.getProducts();
        List<Product> products=new ArrayList<>();
        for(Product item:t){
            if(removeAccent(item.getTen().toLowerCase()).contains(keysearch)){
                products.add(item);
            }
        }
        map.put("idstore", idshop);
        map.put("products", products);
        model.addAllAttributes(map);
        return "layout/user/fragment/resultsearchinshop";
    }
    public static String removeAccent(String s) {
        String temp = Normalizer.normalize(s, Normalizer.Form.NFD); 
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+"); 
        temp = pattern.matcher(temp).replaceAll(""); 
        return temp.replaceAll("đ", "d"); 
    }
}
