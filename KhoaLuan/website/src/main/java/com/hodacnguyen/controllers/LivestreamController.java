/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.controllers;

import com.hodacnguyen.configs.LivestreamWebSocketHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

/**
 *
 * @author Nguyen
 */
@EnableWebSocket
@Controller
public class LivestreamController implements WebSocketConfigurer {

    @Autowired
    private LivestreamWebSocketHandler livestreamWebSocketHandler;

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(livestreamWebSocketHandler, "/livestream")
                .setAllowedOrigins("*");
    }
    @RequestMapping("/live")
    public String index1(Model model, @RequestParam("content") String content){
        model.addAttribute("contentLive", content);
        return "testlive";
    }
    @RequestMapping("/viewlive")
    public String index2(Model model, @RequestParam("userlive") String userlive){
        model.addAttribute("userlive", userlive);
        return "viewlive";
    }
}
