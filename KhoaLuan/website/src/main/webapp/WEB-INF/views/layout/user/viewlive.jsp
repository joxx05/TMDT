<%-- 
    Document   : viewlive
    Created on : Apr 23, 2024, 11:28:43 PM
    Author     : Nguyen
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>WebRTC Livestream - Offerer</title>
        <link rel="stylesheet" href="<c:url value='/resource/css/livestream.css'/>" type="text/css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>

        <div class="container-fluid d-flex align-items-center justify-content-center position-relative" style="height: 100vh">
            <video id="remoteStream" class="container-fluid" style="background-color: black" autoplay controls></video>
            <div class="overlay" style="display: none"></div>
            <div class="content" style="display: none">
                <h1>Welcome to Our Video</h1>
                <p>This is some additional information about the video.</p>
            </div>
            <div class="comment-section position-absolute bottom-0 end-0 p-3">
                <button class="toggle-comments btn btn-primary" style="height: 5vh">Comments</button>
                <div class="comment-container mt-3">
                    <div class="comments mb-3">
                    </div>
                    <div class="comment-input">
                        <input id="comment-content" type="text" class="form-control" placeholder="Enter your comment">
                    </div>
                </div>
            </div>
        </div>


        <script src="https://unpkg.com/peerjs@1.5.2/dist/peerjs.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script>
            var username = '${pageContext.request.userPrincipal.name}';
            var userlive = '${userlive}';
            const socket = new WebSocket('ws://localhost:8080/website/livestream?islive=false&iduserlive=' + userlive);

            // Xử lý khi kết nối được thiết lập
            socket.onopen = function (event) {
                console.log('Connected to server');
                
            };
            socket.onerror = function (error) {
                console.error('WebSocket error:', error);

            };
            socket.onmessage = function (event) {
                const message = JSON.parse(event.data);
                console.log('Received message from server:', message);
                if (message.type === 'mess') {
                    $('.comments').prepend('<p><b>' + message.from + '</b>: ' + message.content + '</p>');
                }

            };
            // Xử lý khi kết nối WebSocket được đóng lại
            socket.onclose = function (event) {
                if (event.wasClean) {
                    console.log('WebSocket connection closed cleanly');
                } else {
                    console.log('WebSocket connection closed unexpectedly');
                }
                console.log('Close code:', event.code);
                console.log('Close reason:', event.reason);
            };

            $(document).ready(function () {
                $(".toggle-comments").click(function () {
                    $(".comment-container").toggle();
                });
                $("#comment-content").keyup(function (e) {
                    var keycode = (event.keyCode ? event.keyCode : event.which);
                    if (keycode == '13') {
                        socket.send(JSON.stringify({type: 'mess', content: $(this).val(), from: username, to: userlive}));
                        $(this).val("");
                    }

                });
            });

            const peer = new Peer();
            peer.on('open', id => {
                const message = {type: "offer", content: id, to: userlive, from: username};
                socket.send(JSON.stringify(message));
            });
            peer.on('call', call => {
                call.answer();
                call.on('stream', remoteStream => playStream('remoteStream', remoteStream));
            });
            function playStream(idVideoTag, stream) {
                const video = document.getElementById(idVideoTag);
                //video.muted = true;
                video.srcObject = stream;
                video.onloadedmetadata = function () {
                    // Kiểm tra trạng thái của video trước khi gọi phương thức play
                    if (video.readyState >= 2) { // readyState 2 tương đương với video đã tải xong và sẵn sàng để phát
                        video.play().then(() => {
                            // Video đã bắt đầu phát
                            console.log("Video started playing successfully.");
                        }).catch(error => {
                            // Xử lý lỗi khi phát video
                            console.error("Failed to play video:", error);
                        });
                    } else {
                        // Video chưa sẵn sàng để phát
                        console.warn("Video is not ready to play yet.");
                    }
                };
            }
        </script>
    </body>
</html>



