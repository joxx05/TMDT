package com.hodacnguyen.controllers.api;

import com.hodacnguyen.pojo.Cart;
import com.hodacnguyen.pojo.CartType;
import com.hodacnguyen.pojo.Type;
import com.hodacnguyen.service.CartService;
import com.hodacnguyen.service.CartTypeService;
import com.hodacnguyen.service.TypeService;
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

@RestController
public class ApiCartController {
    @Autowired
    private CartService cartService;
    @Autowired
    private CartTypeService cartTypeService;
    @Autowired
    private TypeService typeService;
    @GetMapping("api/cart/product/get/{id}")
    public ResponseEntity<Set<CartType>> getProductsCartById(@PathVariable(name = "id")int id){
        Cart cart=this.cartService.getById(id);
        return new ResponseEntity<>(cart.getCartTypes(),HttpStatus.OK);
    }
    @PostMapping("admin/cart/add")
    @ResponseStatus(value = HttpStatus.CREATED)
    public void updateCart(@RequestParam("id")int id,@RequestParam("idtype")int idtype,@RequestParam("qty")int qty){
        Cart cart=this.cartService.getById(id);
        Type type=this.typeService.getById(idtype);
        boolean flag = true;
        for(CartType item: cart.getCartTypes()){
            if(item.getType().getId()==idtype){
                item.setSoluong(item.getSoluong()+qty);
                if(item.getSoluong()<=0){
                    this.cartTypeService.delete(item.getId());
                }
                flag=false;
            }
        }
        if(flag){
            CartType cartType = new CartType();
            cartType.setCart(cart);
            cartType.setSoluong(qty);
            cartType.setType(type);
            this.cartTypeService.add(cartType);
            cart.getCartTypes().add(cartType);
        }
        
        
        //u.setStatus(!u.isStatus());
        this.cartService.update(cart);
    }
    @PostMapping("admin/cart/del")
    @ResponseStatus(value = HttpStatus.CREATED)
    public void delTypeCart(@RequestParam("id")int id,@RequestParam("idtype")int idtype){
        Cart cart=this.cartService.getById(id);
        int idct=0;
        for(CartType item:cart.getCartTypes()){
            if(item.getType().getId()==idtype){
                idct=item.getId();
                break;
            }
        }
        if(idct>0){
            this.cartTypeService.delete(idct);
        }
        
    }
}
