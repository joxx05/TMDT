/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.controllers;

import com.hodacnguyen.pojo.User;
import com.hodacnguyen.service.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

/**
 *
 * @author Nguyen
 */
@ControllerAdvice
public class GlobalControllerAdvice {

    @Autowired
    private UserService userService;

    @ModelAttribute("currentUser")
    public User getCurrentUser() {
        // Tạo một đối tượng SharedData với dữ liệu cố định
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            // Nếu người dùng đã đăng nhập, trả về tên người dùng
            List<User> users = userService.getUsers(authentication.getName());
            if (users != null && !users.isEmpty()) {
                return users.get(0);
                // Xử lý với currentUser
            } else {
                // Xử lý khi danh sách rỗng hoặc null
                return null;
            }
        } else {
            // Nếu không có người dùng nào đăng nhập, trả về null hoặc một giá trị mặc định
            return null;
        }
    }
}
