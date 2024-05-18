/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.controllers;

import com.hodacnguyen.pojo.Cart;
import com.hodacnguyen.pojo.CartType;
import com.hodacnguyen.pojo.Type;
import com.hodacnguyen.service.CartService;
import com.hodacnguyen.service.CartTypeService;
import com.hodacnguyen.service.TagService;
import com.hodacnguyen.service.TypeService;
import com.hodacnguyen.service.UserService;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class CartController {
    @Autowired
    private TypeService typeService;
    @Autowired
    private UserService userService;
    @Autowired
    private TagService tagService;
    @Autowired
    private CartService cartService;
    @Autowired
    private CartTypeService cartTypeService;
    @RequestMapping("/cart")
    public String index(Model model ,@AuthenticationPrincipal User user){
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        map.put("cart",t.getCart());
        model.addAllAttributes(map);
        return "cart";
    }
    @RequestMapping(value = "cart/addcart", method = RequestMethod.POST,produces = { MimeTypeUtils.TEXT_PLAIN_VALUE })
    public String addCart(@RequestParam(value = "idtype") int idtype,@RequestParam(value = "soluong") int soluong,Model model,@AuthenticationPrincipal User user){
        Map<String,Object> map = new HashMap<>();
        com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        Cart cart = t.getCart();
        for(CartType item: cart.getCartTypes()){
            if(item.getType().getId()==idtype){
                int sl =item.getSoluong();
                CartType cartType=cartTypeService.getById(item.getId());
                cartType.setSoluong(sl+soluong);
                cartTypeService.update(cartType);
                map.put("code", 1);
                model.addAllAttributes(map);
                return "layout/user/fragment/cart";
            }
        }
        Type type=typeService.getById(idtype);
        CartType cartType = new CartType();
        cartType.setSoluong(soluong);
        cartType.setType(type);
        cartType.setCart(cart);
        cartTypeService.add(cartType);
        map.put("code", 1);
        model.addAllAttributes(map);
        return "layout/user/fragment/cart";
    }
    @RequestMapping("/cart/delete/{idcarttype}")
    public String delete(Model model ,@AuthenticationPrincipal User user,@PathVariable(name = "idcarttype")int idcarttype){
        Map<String,Object> map = new HashMap<>();
        com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        Cart cart = t.getCart();
        for(CartType item: cart.getCartTypes()){
            if(item.getId()==idcarttype){
                cartTypeService.delete(idcarttype);
                break;
            }
        }
        model.addAllAttributes(map);
        return "redirect:/cart";
    }
    @RequestMapping(value = "cart/updatecart", method = RequestMethod.POST,produces = { MimeTypeUtils.TEXT_PLAIN_VALUE })
    public String updateCart(@RequestParam(value = "idcarttype") int idcarttype,@RequestParam(value = "soluong") int soluong,Model model,@AuthenticationPrincipal User user){
        Map<String,Object> map = new HashMap<>();
        com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        CartType cartType=cartTypeService.getById(idcarttype);
        cartType.setSoluong(soluong);
        cartTypeService.update(cartType);
        int tong=soluong*cartType.getType().getPrice();
        map.put("tong", tong);
        
        int tonggia=0;
        for(CartType item:t.getCart().getCartTypes()){
            tonggia+=item.getSoluong()*item.getType().getPrice();
        }
        map.put("tonggia", tonggia);
        model.addAllAttributes(map);
        return "layout/user/fragment/cartgrid";
    }
    
}
