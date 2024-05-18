/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.controllers.api;

import com.hodacnguyen.pojo.Role;
import com.hodacnguyen.pojo.User;
import com.hodacnguyen.pojo.UserRole;
import com.hodacnguyen.service.RoleService;
import com.hodacnguyen.service.UserRoleService;
import com.hodacnguyen.service.UserService;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 *
 * @author cumy1
 */
@RestController
public class ApiUserController {
    @Autowired
    private MailSender mailSender;
    @Autowired
    private RoleService roleService;
    @Autowired
    private UserService userService;
    @Autowired
    private UserRoleService userRoleService;
    @GetMapping("api/users")
    public ResponseEntity<List<User>> listUsers(){
        List<User> users= this.userService.list();
        return new ResponseEntity<>(users,HttpStatus.OK);
    }
    @GetMapping("api/user/{iduser}")
    public ResponseEntity<User> getUser(@PathVariable(name = "iduser") int id){
        User user=this.userService.getById(id);
        return new ResponseEntity<>(user,HttpStatus.OK);
    }
    @GetMapping("api/user/byemail/{email}")
    public ResponseEntity<User> getUser(@PathVariable(name = "email") String email){
        List<User> user=this.userService.searchUsers(email);
        if(!user.isEmpty()){
            return new ResponseEntity<>(user.get(0),HttpStatus.OK);
        }else{
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        
    }
    @PostMapping("admin/user/status")
    @ResponseStatus(value = HttpStatus.CREATED)
    public void setStatus(@RequestParam("id")int id){
        User u =this.userService.getById(id);
        u.setStatus(!u.isStatus());
        this.userService.update(u);
    }
    @PostMapping("admin/user/setadmin")
    @ResponseStatus(value = HttpStatus.CREATED)
    public void setAdmin(@RequestParam("id")int id){
        User u = userService.getById(id);
        boolean flag = false;
        for(Role role:u.getRole()){
            if(role.getId()==1){
                flag=true;
                break;
            }
        }
        if(flag){
            this.userRoleService.delete(id, 1);
        }else{
            UserRole r = new UserRole();
            r.setId_role(1);
            r.setId_user(id);
            this.userRoleService.add(r);
        }
        
    }
    @PostMapping("changepass")
    @ResponseStatus(value = HttpStatus.CREATED)
    public void sendMailChangePass(@RequestParam("email")String email){
        List<User> u = userService.getUsers(email);
        if(!u.isEmpty()){
            Random generator = new Random();
            int a = generator.nextInt(1000000);
            User user = u.get(0);
            sendEmail(user.getEmail(), "Thay đổi mật khẩu sàn thương maih điện tử!", "Mã thay đổi mật khẩu của bạn là:"+a);
        }
        
        
    }
    public void sendEmail(String to,String subject,String content) {
         SimpleMailMessage mailMessage=new SimpleMailMessage();
         mailMessage.setTo(to);
         mailMessage.setSubject(subject);
         mailMessage.setText(content);
         mailSender.send(mailMessage);
    }
}
