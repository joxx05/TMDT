<%-- 
    Document   : testchat
    Created on : Apr 20, 2024, 10:01:08 PM
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
            <video id="localStream" class="container-fluid" style="background-color: black" autoplay muted></video>
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
            const socket = new WebSocket('ws://localhost:8080/website/livestream?islive=true');

            // Xử lý khi kết nối được thiết lập
            socket.onopen = function (event) {
                console.log('Connected to server');
            };
            socket.onerror = function (error) {
                console.error('WebSocket error:', error);

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
                        socket.send(JSON.stringify({type: 'mess', content: $(this).val(), from: username, to: username}));
                        $(this).val("");
                    }

                });
            });
            function openStream() {
                const config = {audio: true, video: true};
                return navigator.mediaDevices.getUserMedia(config);
            }
            function playStream(idVideoTag, stream) {
                const video = document.getElementById(idVideoTag);
                video.srcObject = stream;
                video.play();
            }
            const peer = new Peer();

            $(document).ready(function () {
                openStream().then(stream => {
                    playStream('localStream', stream);

                    peer.on('open', () => {
                        socket.onmessage = function (event) {
                            const message = JSON.parse(event.data);
                            console.log('Received message from server:', message);
                            if (message.type === 'mess') {
                                $('.comments').prepend('<p><b>' + message.from + '</b>: ' + message.content + '</p>');
                            }else if(message.type === 'offer'){
                                console.log('Received message from server:', message.content);
                                peer.call(message.content, stream);
                            }
                        };
                        
                    });
                    //const call = peer.call('797ab602-42b8-4df9-a03a-58057ecf9514', stream);
                    //call.on('stream', remoteStream=>playStream('remoteStream',remoteStream));
                });
            });
            peer.on('call', call => {
                call.answer();
                call.on('stream', remoteStream => playStream('remoteStream', remoteStream));

            });
        </script>
    </body>
</html>



