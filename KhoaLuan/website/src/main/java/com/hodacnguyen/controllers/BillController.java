package com.hodacnguyen.controllers;

import com.hodacnguyen.pojo.Bill;
import com.hodacnguyen.pojo.BillType;
import com.hodacnguyen.pojo.Cart;
import com.hodacnguyen.pojo.CartType;
import com.hodacnguyen.service.BillService;
import com.hodacnguyen.service.BillTypeService;
import com.hodacnguyen.service.CartService;
import com.hodacnguyen.service.CartTypeService;
import com.hodacnguyen.service.TagService;
import com.hodacnguyen.service.UserService;
import com.hodacnguyen.util.ZaloPay;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class BillController {
    @Autowired
    private CartService cartService;
    @Autowired
    private BillService billService;
    @Autowired
    private TagService tagService;
    @Autowired
    private UserService userService;
    @Autowired
    private BillTypeService billTypeService;
    @Autowired
    private CartTypeService cartTypeService;
    @RequestMapping("/bill")
    public String index(Model model ,@AuthenticationPrincipal User user){
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        map.put("bills", t.getBills());
        model.addAllAttributes(map);
        return "bills";
    }
    @RequestMapping("/bill/detail/{idbill}")
    public String bill(Model model, @PathVariable(name = "idbill") int idbill ){
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        map.put("bill", billService.getById(idbill));
        model.addAllAttributes(map);
        return "bill";
    }
    @RequestMapping("/bill/tranfer/{idcart}")
    public String tranfer(Model model, @PathVariable(name = "idcart") int idcart ,@AuthenticationPrincipal User user){
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        Bill bill=new Bill();
        bill.setUser(t);
        bill.setIs_pay(Boolean.FALSE);
        billService.add(bill);
        Cart cart=cartService.getById(idcart);
        for(CartType item : cart.getCartTypes()){
            BillType billType = new BillType();
            billType.setBill(bill);
            billType.setSoluong(item.getSoluong());
            billType.setType(item.getType());
            billTypeService.add(billType);
            cartTypeService.delete(item.getId());
        }
        model.addAllAttributes(map);
        return "redirect:"+"/bill/detail/"+bill.getId();
    }
    @RequestMapping("/bill/detail/pay/{idbill}")
    public String payBill(Model model, @PathVariable(name = "idbill") int idbill ) throws Exception{
        Bill bill = billService.getById(idbill);
        Set<BillType> billTypes =bill.getBillTypes();
        int amount=0;
        for(BillType billType: billTypes){
            amount+=billType.getType().getPrice()*billType.getSoluong();
        }
        String url = ZaloPay.order(amount, String.valueOf(idbill));
        if(url.length()>10){
            return "redirect:"+url;
        }else{
            return "redirect:/bill";
        }
        
    } 
    @RequestMapping(value = "/bill/detail/pay/check/{idbill}")
    public String checkBill(Model model, @PathVariable(name = "idbill") int idbill,@RequestParam(value = "apptransid") String code,@RequestParam(value = "status") int status ) throws Exception{
        Bill bill=billService.getById(idbill);
        if(status>0){
            bill.setCode_pay(code);
            bill.setIs_pay(Boolean.TRUE);
            billService.update(bill);
        }
        return "redirect:"+"/bill/detail/"+idbill;
    }
}
