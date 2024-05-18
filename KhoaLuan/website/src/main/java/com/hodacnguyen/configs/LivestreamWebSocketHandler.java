package com.hodacnguyen.configs;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import java.io.IOException;
import java.net.URI;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.springframework.security.core.Authentication;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.springframework.web.util.UriComponentsBuilder;

@Component
public class LivestreamWebSocketHandler extends TextWebSocketHandler {

    private static final Logger logger = LoggerFactory.getLogger(LivestreamWebSocketHandler.class);

    @Autowired
    private ObjectMapper objectMapper;
    @Autowired
    private Map<String, WebSocketSession> livestreamSessionsByUser = new ConcurrentHashMap<>();// chứa người muốn live
    @Autowired
    private Map<String, List<WebSocketSession>> viewersByStream = new ConcurrentHashMap<>();//chứa người xem live

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        Map<String, String> queryParams = extractParamsFromUri(session);
        String userId = extractUserId(session);
        Boolean isLive = Boolean.valueOf(queryParams.get("islive"));
        logger.info("Contains islive attribute: " + isLive);
        if (isLive) {
            // Session này là của người live

            if (userId != null) {
                if (!livestreamSessionsByUser.containsKey(userId)) {
                    logger.info("User connected: " + userId);
                    livestreamSessionsByUser.put(userId, session);
                } else {
                    logger.warn("User already has an active livestream session: " + userId);
                    session.close(CloseStatus.POLICY_VIOLATION.withReason("Only one active livestream session allowed per user"));
                }
            } else {
                logger.warn("User connected without ID");
            }
            logger.info("The person doing the livestream is: " + userId);
        } else {
            // Session này là của người xem
            String idUserLive = queryParams.get("iduserlive");
            if (idUserLive != null) {
                // Kiểm tra xem Map có chứa khóa tương ứng không
                if (!viewersByStream.containsKey(idUserLive)) {
                    viewersByStream.put(idUserLive, new ArrayList<>());
                }
                viewersByStream.get(idUserLive).add(session);
                logger.info("Viewer " + userId + " has connected to viewer " + idUserLive + "'s livestream session");
            } else {
                logger.warn("Viewer connected without specifying the user's livestream session");
            }
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        String userId = extractUserId(session);

        if (userId != null) {
            logger.info("User disconnected: " + userId);
            livestreamSessionsByUser.remove(userId);
            removeSessionFromAllStreams(session);
        } else {
            logger.warn("User disconnected without ID");
        }
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String userId = extractUserId(session);
        String payload = message.getPayload();
        try {
            // Chuyển đổi payload JSON thành đối tượng Message
            Message mess = objectMapper.readValue(payload, Message.class);
            String jsonOfferMessage = objectMapper.writeValueAsString(mess);
            if ("offer".equals(mess.getType())) {
                WebSocketSession livesession=livestreamSessionsByUser.get(mess.getTo());
                if(livesession != null){
                    livesession.sendMessage(new TextMessage(jsonOfferMessage));
                }
            } else if ("mess".equals(mess.getType())) {
                
                broadcastLivestreamData(mess.getTo(), jsonOfferMessage);
            }

            // Thực hiện xử lý offerMessage tại đây
        } catch (JsonProcessingException e) {
            logger.error("Error processing JSON message: " + e.getMessage());
        }

    }

    private void broadcastLivestreamData(String streamId, String message) throws IOException {
        WebSocketSession session = livestreamSessionsByUser.get(streamId);
        if(session!=null){
            session.sendMessage(new TextMessage(message));
        }
        List<WebSocketSession> viewers = viewersByStream.get(streamId);

        if (viewers != null) {
            for (WebSocketSession viewer : viewers) {
                try {
                    // Gửi dữ liệu dưới dạng Blob
                    viewer.sendMessage(new TextMessage(message));
                } catch (IOException e) {
                    logger.error("Error broadcasting livestream data to viewer " + viewer.getId(), e);
                }
            }
        }
    }

    private String extractUserId(WebSocketSession session) {
        // Lấy principal từ session
        Principal principal = session.getPrincipal();

        // Kiểm tra xem principal có tồn tại không và có phải là Authentication không
        if (principal instanceof Authentication) {
            Authentication authentication = (Authentication) principal;
            return authentication.getName(); // Trả về tên người dùng (username) hoặc id người dùng
        }

        return null;
    }

    private void removeSessionFromAllStreams(WebSocketSession session) {
        for (List<WebSocketSession> sessions : viewersByStream.values()) {
            sessions.remove(session);
        }
    }

    public Map<String, String> extractParamsFromUri(WebSocketSession session) {
        URI uri = session.getUri();
        return UriComponentsBuilder.fromUri(uri).build().getQueryParams().toSingleValueMap();
    }

    private static class Message {

        /**
         * @return the type
         */
        public String getType() {
            return type;
        }

        /**
         * @param type the type to set
         */
        public void setType(String type) {
            this.type = type;
        }

        /**
         * @return the content
         */
        public String getContent() {
            return content;
        }

        /**
         * @param content the content to set
         */
        public void setContent(String content) {
            this.content = content;
        }

        /**
         * @return the from
         */
        public String getFrom() {
            return from;
        }

        /**
         * @param from the from to set
         */
        public void setFrom(String from) {
            this.from = from;
        }

        /**
         * @return the to
         */
        public String getTo() {
            return to;
        }

        /**
         * @param to the to to set
         */
        public void setTo(String to) {
            this.to = to;
        }

        private String type;
        private String content;
        private String from;
        private String to;

        public Message() {
        }

    }
}
