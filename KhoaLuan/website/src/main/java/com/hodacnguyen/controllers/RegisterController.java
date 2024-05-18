package com.hodacnguyen.controllers;


import com.hodacnguyen.pojo.User;
import com.hodacnguyen.service.CartService;
import com.hodacnguyen.service.RoleService;
import com.hodacnguyen.service.TagService;
import com.hodacnguyen.service.UserService;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author CaNoc
 */
@Controller
public class RegisterController {
    @Autowired
    private UserService userDetailsService;
    @Autowired
    private CartService cartService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private TagService tagService;
    @RequestMapping("/register")
    public String index(Model model) {
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        map.put("user", new User());
        model.addAllAttributes(map);
        return "register";
    }
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String showDashboardPage(HttpServletRequest request, Model model, @RequestParam("img") CommonsMultipartFile file, HttpServletRequest req, @ModelAttribute(value = "user") User user) {
        Map<String,Object> map = new HashMap<>();
        List<User>u=userDetailsService.getUsers(user.getEmail());
        if(!u.isEmpty()){
            map.put("statusMess", 0);
            map.put("message", "Email đã tồn tại!");
            model.addAllAttributes(map);
            return "register";
        }else{
            if(user.getPassword().equals(user.getConfirmPassword())){
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
                user.setImage(filePath);
                this.userDetailsService.add(user);
            }else{
                map.put("statusMess", 0);
                map.put("message", "Mật khẩu không khớp!");
                model.addAllAttributes(map);
                return "register";
            }
        }
        

        model.addAllAttributes(map);
        return "redirect:/login";
    }
    
}
