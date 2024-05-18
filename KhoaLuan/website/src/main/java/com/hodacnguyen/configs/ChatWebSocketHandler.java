/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.configs;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.hodacnguyen.pojo.Message;
import com.hodacnguyen.pojo.User;
import com.hodacnguyen.service.MessageService;
import com.hodacnguyen.service.UserService;
import java.io.IOException;
import java.security.Principal;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/**
 *
 *
 * @author cumy1
 */
@Component
public class ChatWebSocketHandler extends TextWebSocketHandler {

    @Autowired
    private UserService userService;
    @Autowired
    private MessageService messageService;
    private static final Logger logger = LoggerFactory.getLogger(ChatWebSocketHandler.class);
    private final Map<String, WebSocketSession> userSessions;

    @Autowired
    public ChatWebSocketHandler(Map<String, WebSocketSession> userSessions) {
        this.userSessions = userSessions;
        logger.info("ChatWebSocketHandler bean is created.");
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session) {
        logger.info(session.getId());
        String userId = getUserIdFromSession(session);
        if (userId != null) {
            userSessions.put(userId, session);
            logger.info("userSessions save with id: " + userId);
        }
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException {
        String payload = message.getPayload();
        // Xử lý tin nhắn JSON
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(payload);

        String sender = jsonNode.get("sender").asText();
        String receiver = jsonNode.get("receiver").asText();
        String content = jsonNode.get("content").asText();
        logger.info("Day la tin nhan: " + content);
        Message t = new Message();
        t.setIncoming(this.userService.getUsers(sender).get(0).getId());
        t.setOutcoming(this.userService.getUsers(receiver).get(0).getId());
        t.setContent(content);
        // Xử lý logic gửi tin nhắn đến người nhận
        WebSocketSession receiverSession = userSessions.get(receiver);
        if (receiverSession != null && receiverSession.isOpen()) {
            //receiverSession.sendMessage(new TextMessage("From " + sender + ": " + content));
            ObjectNode responseNode = objectMapper.createObjectNode();
            responseNode.put("status", "success");

            ObjectNode messageNode = objectMapper.createObjectNode();
            messageNode.put("sender", sender);
            messageNode.put("receiver", receiver);
            messageNode.put("content", content);

            responseNode.set("message", messageNode);

            // Convert ObjectNode to JSON string and send as TextMessage
            String jsonResponse = objectMapper.writeValueAsString(responseNode);
            receiverSession.sendMessage(new TextMessage(jsonResponse));
            
            
            t.setIs_load(true);
        }else{
            t.setIs_load(false);
        }
        this.messageService.add(t);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
        String userId = getUserIdFromSession(session);
        if (userId != null) {
            userSessions.remove(userId);
            logger.info("userSessions remove with id: " + userId);
        }
    }

    private String getUserIdFromSession(WebSocketSession session) {
        // Lấy principal từ session
        Principal principal = session.getPrincipal();

        // Kiểm tra xem principal có tồn tại không và có phải là Authentication không
        if (principal instanceof Authentication) {
            Authentication authentication = (Authentication) principal;
            logger.info(authentication.getName());
            return authentication.getName(); // Trả về tên người dùng (username) hoặc id người dùng
        }

        return null;
    }
}
