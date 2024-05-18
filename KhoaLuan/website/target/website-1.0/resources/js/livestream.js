let websocket;
let mediaRecorder;

function startScreenLivestream() {
    // Kiểm tra xem trình duyệt có hỗ trợ chia sẻ màn hình không
    if (navigator.mediaDevices && navigator.mediaDevices.getDisplayMedia) {
        // Thực hiện yêu cầu chia sẻ màn hình
        navigator.mediaDevices.getDisplayMedia({ video: true })
            .then(function (stream) {
                var websocket = new WebSocket('ws://localhost:8080/website/livestream?islive=true'); 
        
                websocket.onopen = function () {
                    console.log('WebSocket connected');
                };

                // Tạo đối tượng MediaRecorder để ghi lại video từ luồng màn hình
                var mediaRecorder = new MediaRecorder(stream);

                // Lắng nghe sự kiện dataavailable để nhận dữ liệu video ghi lại
                mediaRecorder.ondataavailable = function (event) {
                    if (event.data && event.data.size > 0) {
                        // Tạo một đối tượng ArrayBuffer để lưu trữ dữ liệu video
                        var reader = new FileReader();
                        reader.onloadend = function () {
                            // Tạo một đối tượng JSON chứa dữ liệu video
                            var jsonData = {
                                livestreamData: Array.from(new Uint8Array(reader.result))
                            };

                            // Chuyển đổi đối tượng JSON thành chuỗi và gửi qua WebSocket
                            websocket.send(JSON.stringify(jsonData));
                        };
                        reader.readAsArrayBuffer(event.data);
                    }
                };

                // Bắt đầu ghi lại video
                mediaRecorder.start();
            })
            .catch(function (error) {
                console.error('Error accessing screen:', error);
            });
    } else {
        console.error('Screen sharing is not supported in this browser');
    }
}

function stopScreenLivestream() {
    if (mediaRecorder && mediaRecorder.state !== 'inactive') {
        // Dừng ghi lại video
        mediaRecorder.stop();
        document.getElementById('livestreamStatus').innerText = 'Screen Livestream Stopped';

        // Đóng kết nối WebSocket
        if (websocket && websocket.readyState === WebSocket.OPEN) {
            websocket.close();
        }
    }
}