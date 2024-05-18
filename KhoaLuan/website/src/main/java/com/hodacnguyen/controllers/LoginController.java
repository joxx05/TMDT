/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.controllers;

import com.hodacnguyen.pojo.User;
import com.hodacnguyen.service.TagService;
import com.hodacnguyen.service.UserService;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author CaNoc
 */
@Controller
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
    @Autowired
    private UserService userDetailsService;
    @Autowired
    private TagService tagService;
    @Autowired
    private JavaMailSender mailSender;
    @Autowired
    private HttpSession httpSession;

    @GetMapping("/login")
    public String index(Model model) {
        Map<String, Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        model.addAllAttributes(map);
        return "login";
    }

    @GetMapping("/code")
    public String getPass(Model model, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        model.addAllAttributes(map);
        return "code";
    }

    @GetMapping("/resetpassword")
    public String resetPassword() {
        return "resetpassword";
    }

    @PostMapping("/resetpassword")
    public String resetPasswordPost(Model model, @RequestParam("email") String email, HttpServletRequest request) throws NoSuchAlgorithmException {
        Map<String, Object> map = new HashMap<>();
        if (!userDetailsService.getUsers(email).isEmpty()) {
            int randomNumber = (int) (Math.random() * 1000);
            String input = email + randomNumber;
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] hashedBytes = md.digest(input.getBytes());

            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }

            String hashedString = sb.toString();
            httpSession.setAttribute(hashedString, email);
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom("cumy1999@gmail.com");
            message.setTo(email);
            message.setSubject("Reset password email!");
            String protocol = request.getScheme(); // Lấy protocol (http hoặc https)
            String serverName = request.getServerName(); // Lấy hostname
            int serverPort = request.getServerPort(); // Lấy port
            String contextPath = request.getContextPath(); // Lấy context path

            String baseUrl = protocol + "://" + serverName + ":" + serverPort + contextPath;
            String urlresetpass = baseUrl + "/repass/" + hashedString;
            message.setText("Đường dẫn reset password của bạn là: " + urlresetpass);
            mailSender.send(message);
            map.put("notify", "Đường dẫn reset mật khẩu đã được gửi tới hộp thư " + email + "! Vui lòng kiểm tra hộp thư của mình!");
            logger.info((String) httpSession.getAttribute(hashedString));
        } else {
            map.put("notify", "Không có tài khoản " + email + " trong hệ thống! Bạn có thể tạo tài khoản mới!");
        }

        model.addAllAttributes(map);
        return "resetpassword2";
    }

    @GetMapping("/repass/{hashcode}")
    public String resetPass(Model model, @PathVariable(name = "hashcode") String hashcode) {
        Map<String, Object> map = new HashMap<>();
        String email = (String) httpSession.getAttribute(hashcode);
        logger.info(email);
        if (email != null) {
            map.put("status", true);
            map.put("email", email);
        } else {
            map.put("status", false);
        }

        
        model.addAllAttributes(map);
        return "resetpassword3";
    }

    @PostMapping("/repass/{hashcode}")
    public String resetPassPost(Model model, HttpServletRequest request, @PathVariable(name = "hashcode") String hashcode, @RequestParam("password") String password, @RequestParam("repassword") String repassword, RedirectAttributes redirectAttributes) {
        Map<String, Object> map = new HashMap<>();
        String email = (String) httpSession.getAttribute(hashcode);
        Boolean status = false;
        String currentPath = request.getRequestURI();
        if (!userDetailsService.getUsers(email).isEmpty()) {
            User u = userDetailsService.getUsers(email).get(0);
            if (repassword != null && password != null && repassword.equals(password)) {
                status = userDetailsService.changePass(u, password);
            } else {
                map.put("statusMess", 0);
                map.put("message", "Mật khẩu không trùng khớp!");
                map.put("status", true);
                map.put("email", email);
                model.addAllAttributes(map);
                return "resetpassword3";
            }

        }
        if (status) {
            httpSession.removeAttribute(hashcode);
            map.put("message", "Thay đổi mật khẩu thành công!");
            redirectAttributes.addAllAttributes(map);
            return "redirect:/login";
        } else {
            map.put("statusMess", 0);
            map.put("message", "Hệ thống lỗi liên hệ admin để xử lý vấn đề!");
            map.put("status", true);
            map.put("email", email);
            model.addAllAttributes(map);
            return "resetpassword3";
        }

    }

}
