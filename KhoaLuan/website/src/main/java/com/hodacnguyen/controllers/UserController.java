/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.controllers;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private TagService tagService;
    @RequestMapping("/profile")
    public String index(Model model,@AuthenticationPrincipal User user){
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        map.put("user",t);
        model.addAllAttributes(map);
        return "profile";
    }
    @RequestMapping(value = "/profile",method = RequestMethod.POST)
    public String changePass(Model model,@AuthenticationPrincipal User user,@RequestParam(value = "newpass") String newpass,@RequestParam(value = "newpass2") String newpass2){
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        map.put("user",t);
        if(newpass.equals(newpass2)){
            userService.changePass(t, newpass);
            map.put("statusMess",1);
            map.put("message","Cập nhật thành công!");
        }else{
            map.put("statusMess",0);
            map.put("message","Mật khẩu không khớp!");
        }
        model.addAllAttributes(map);
        return "profile";
    }
    @RequestMapping("/profile/edit")
    public String editProfile(Model model,@AuthenticationPrincipal User user){
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        map.put("user",t);
        model.addAllAttributes(map);
        return "editprofile";
    }
    @RequestMapping(value = "/profile/edit", method = RequestMethod.POST)
    public String showDashboardPage(HttpServletRequest request, Model model, @RequestParam("img") CommonsMultipartFile file, HttpServletRequest req, @ModelAttribute(value = "user") com.hodacnguyen.pojo.User user,@RequestParam(value = "id") int id) {
        Map<String,Object> map = new HashMap<>();
        com.hodacnguyen.pojo.User t = userService.getById(id);
        if(file!=null&&file.getSize()>0){
            String filePath = System.currentTimeMillis()+".jpg";
            try {
                String rootPath = req.getServletContext().getRealPath("resources");
                File dir = new File(rootPath+File.separator+"image"+File.separator+"user");
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
            t.setImage(filePath);
        }
        t.setTen(user.getTen());
        t.setPhone(user.getPhone());
        t.setAddress(user.getAddress());
        t.setHo(user.getHo());
        t.setGioithieu(user.getGioithieu());
        t.setGhichu(user.getGhichu());
        userService.update(t);
        model.addAllAttributes(map);
        return "redirect:/profile";
    }
    
}
