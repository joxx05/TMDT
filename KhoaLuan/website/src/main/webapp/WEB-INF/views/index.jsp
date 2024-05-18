<%@page import="com.hodacnguyen.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="vn">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title><tiles:insertAttribute name="title"/></title>
        <!-- Google Font -->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&amp;display=swap" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <!-- Css Styles -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="<c:url value='/resource/css/bootstrap.min.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/resource/css/font-awesome.min.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/resource/css/elegant-icons.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/resource/css/nice-select.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/resource/css/jquery-ui.min.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/resource/css/owl.carousel.min.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/resource/css/slicknav.min.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/resource/css/style.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/resource/css/site.css'/>" type="text/css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body style="font-family: sans-serif;font-style: inherit">
        <!--mess-->
        <tiles:insertAttribute name="mess" />
        <!--header-->
        <tiles:insertAttribute name="header" />
        <!--content-->
        <tiles:insertAttribute name="content" />
        <!--footer-->
        <tiles:insertAttribute name="footer" />


        <!-- Js Plugins -->
        <script src="<c:url value='/resource/js/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/resource/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/resource/js/jquery.nice-select.min.js'/>"></script>
        <script src="<c:url value='/resource/js/jquery-ui.min.js'/>"></script>
        <script src="<c:url value='/resource/js/jquery.slicknav.js'/>"></script>
        <script src="<c:url value='/resource/js/mixitup.min.js'/>"></script>
        <script src="<c:url value='/resource/js/owl.carousel.min.js'/>"></script>
        <script src="<c:url value='/resource/js/main.js'/>"></script>
        <script src="<c:url value='/resource/js/site.js'/>"></script>
        <script src="<c:url value='/resource/js/realtime.js'/>"></script>
        <script src="<c:url value='/resource/js/chart.js'/>"></script>
        <script src="<c:url value='/resource/js/admin.js'/>"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="<c:url value='/resource/js/tagsinput.js'/>"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@latest/dist/tf.min.js"></script>
        <script src="<c:url value='/resource/static/vocabs.js'/>"></script>
        
        
        <c:if test="${pageContext.request.userPrincipal.name!=null}">
            <script>
                var idCurrentUser = "${currentUser.id}";
                console.log(idCurrentUser);
                var _incoming = "${pageContext.request.userPrincipal.name}";
                var _outcoming;
                var ws;
                var messagesDiv = document.getElementById("messages");

                function connectWebSocket() {
                    ws = new WebSocket("ws://localhost:8080/website/chat");

                    ws.onopen = function (event) {
                        console.log("WebSocket connected");
                        console.log(_incoming);
                    };

                    ws.onmessage = function (event) {
                        var data = JSON.parse(event.data);
                        var status = data.status;
                        var message = data.message;

                        if (status === "success") {
                            var sender = message.sender;
                            var receiver = message.receiver;
                            var content = message.content;

                            if (_outcoming != sender) {
                                _outcoming = sender;
                                console.log(_outcoming);
                                setImageOutcoming(_outcoming);
                                $('#name-outcoming').html(_outcoming);
                                loadhistory();
                            }
                            
                            $('#view-chat').show(1000);
                            $('#list-content-chat').prepend('<div class="chat"><p class="outcoming">' + content + '</p></div>');
                            console.log("Message from " + sender + " to " + receiver + ": " + content);
                        } else {
                            var errorMessage = message;
                            console.error("Error:", errorMessage);
                        }
                        //setImageOutcoming(_outcoming);

                    };

                    ws.onclose = function (event) {
                        console.log("WebSocket disconnected");
                    };
                }

                function sendMessage() {
                    var messageInput = document.getElementById("content-mess");
                    var sender = _incoming;
                    var receiver = _outcoming;
                    var message = messageInput.value.trim();
                    if (sender !== "" && receiver !== "" && message !== "") {
                        var jsonMessage = JSON.stringify({sender: sender, receiver: receiver, content: message});
                        ws.send(jsonMessage);
                        messageInput.value = "";
                        console.log(jsonMessage);
                    }
                    $('#list-content-chat').prepend('<div class="chat1"><p class="incoming">' + message + '</p></div>');
                }

                window.onload = function () {
                    connectWebSocket();
                };
                $(document).ready(function () {
                    $("#content-mess").keyup(function (e) {
                        var keycode = (event.keyCode ? event.keyCode : event.which);
                        if (keycode == '13') {
                            sendMessage();
                        }

                    });
                });
            </script>
        </c:if>

    </body>
</html>

