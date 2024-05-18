
Copy code
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Realtime Chat</title>
    </head>
    <body>
        <h1>Realtime Chat</h1>
        <div id="chat-messages"></div>
        <input type="text" id="message-input" placeholder="Type a message...">
        <button onclick="sendMessage()">Send</button>

        <script>
            var socket = new WebSocket("ws://localhost:8080/website/chat");

            socket.onmessage = function (event) {
                var message = event.data;
                displayMessage(message);
            }

            function sendMessage() {
                var messageInput = document.getElementById("message-input");
                var message = messageInput.value;
                socket.send(message);
                messageInput.value = "";
            }

            function displayMessage(message) {
                var chatMessages = document.getElementById("chat-messages");
                var messageElement = document.createElement("div");
                messageElement.textContent = message;
                chatMessages.appendChild(messageElement);
            }
        </script>
    </body>
</html>