<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<section class="breadcrumb-section set-bg" data-setbg="<c:url value='/resource/image/baner/bannermyshop.jpg'/>" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Administrator</h2>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="container" style="margin-top:20px;margin-bottom: 20px">
    <div class="row">
        <div class="col-lg-8"><h3 style="text-align: center"><strong>Reviews manager</strong></h3></div>
        <div class="col-lg-4">
            <div class="btn-group">
                <button type="button" class="site-btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Manage
                </button>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="${baseURL}/myshop/detail/${store.id}">Quản lý sản phẩm</a>
                    <a class="dropdown-item" href="${baseURL}/myshop/statisproduct/${store.id}">Thống kê doanh thu theo sản phẩm</a>
                    <a class="dropdown-item" href="${baseURL}/myshop/statistype/${store.id}">Thống kê doanh thu theo loại sản phẩm</a>
                    <a class="dropdown-item" href="${baseURL}/myshop/review/${store.id}">Quản lý bình luận</a>
                </div>

            </div>
        </div>
    </div>
    <hr>
</div>

<div class="container" style="margin-top: 5px">
    <div class="row">
        <input class="form-control" type="hidden" id="id-shop" value="${store.id}" >
        <div class="col-lg-6">
            <select title="Chọn một tùy chọn" onchange="changeSort(event)">
                <option value="date_up">Date up</option>
                <option value="date_down">Date down</option>
                <option value="ratespam_up">Spam Rate up</option>
                <option value="ratespam_down">Spam Rate down</option>
                <option value="status_up">Status up</option>
                <option value="status_down">Status down</option>
            </select>
        </div>
        <div class="col-lg-3">

        </div>
        <div class="col-lg-3">
            <b>Rate spam setting:</b> 
            <div class="row">
                <div class="col-lg-6">
                    <input class="form-control" type="number" id="ratespamsetting" value="${store.configSpamRate}">
                </div>
                <div class="col-lg-6">
                    <button class="site-btn" id="changeratespam">Change</button>
                </div>
            </div>
        </div>
    </div>
</div>
<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#id</th>
                        <th scope="col">User</th>
                        <th scope="col">Sản phẩm</th>
                        <th scope="col">Nội dung bình luận</th>
                        <th scope="col">Spam rate</th>
                        <th scope="col">Date</th>
                        <th scope="col">Status</th>
                    </tr>
                </thead>
                <tbody id="content-quanly-binhluan">

                </tbody>

            </table>
            <div class="text-right mt-3 product__pagination">
                <a class="pageleft" onclick="pagemanager(-1)" ><</a> <a class="pagenum"></a><a class="pageright" onclick="pagemanager(1)" >></a>
            </div>
        </div>
    </div>

</section>
<script>
    var additionalData;
    var page = 0;
    $(document).ready(function () {
        additionalData = {
            idstore: ${idstore},
            sort: 'date_up',
            page: page
        };
        loadDataReview(additionalData);
        $("#changeratespam").click(function () {
            var ratespam = $("#ratespamsetting").val();
            if (ratespam >= 100 || ratespam <= 0) {
                alert('Rate spam được cấu hình từ 0 - 100. Vui lòng cấu hình lại');
            } else {
                $.post('${baseURL}' + '/api/store/setratespam', {id: ${idstore}, ratespam: ratespam})
                        .done(function (data) {
                            // Xử lý dữ liệu phản hồi (nếu có)

                            alert('Cập nhật thành công!');
                        })
                        .fail(function () {
                            // Xử lý khi yêu cầu thất bại
                            alert('Cập nhật thất bại!');
                        });
            }
        });
    });
    function loadDataReview(additionalData) {
        $.ajax({
            url: '${baseURL}' + '/api/reviews/gets',
            dataType: 'json',
            data: additionalData,
            success: function (data) {

                // Xử lý dữ liệu JSON ở đây
                $('.pagenum').html(page);
                if (data.length < 10) {
                    $('.pageright').hide();
                } else {
                    $('.pageright').show();
                }
                if (page <= 0) {
                    $('.pageleft').hide();
                } else {
                    $('.pageleft').show();
                }
                var options = {
                    year: 'numeric',
                    month: '2-digit',
                    day: '2-digit',
                    hour: '2-digit',
                    minute: '2-digit',
                    second: '2-digit',
                    timeZone: 'Asia/Ho_Chi_Minh' // Đặt múi giờ theo múi giờ của Việt Nam
                };
                for (var i = 0; i < data.length; i++) {
                    var item = data[i];
                    var status = item.status == true ? 'Show' : 'Hide';
                    var date = new Date(item.date);
                    var html = '<tr>' +
                            '<th scope="row">' + item.id + '</th>' +
                            '<td>' + item.user.email + '</td>' +
                            '<td>' + item.product.ten + '</td>' +
                            '<td>' + item.comment + '</td>' +
                            '<td>' + item.spamRate + '</td>' +
                            '<td>' + date.toLocaleDateString('vi-VN', options) + '</td>' +
                            '<td><b class="btn-change-status-review" onclick="clickchangestatus(event,' + item.id + ')">' + status + '</b></td>' +
                            '</tr>';
                    $('#content-quanly-binhluan').append(html);

                }
            },
            error: function (xhr, status, error) {
                console.error('Error:', status, error);
            }
        });
    }
    function clickchangestatus(event, id) {
        var element = event.target;
        // Thực hiện các hành động với phần tử đó

        $.post('${baseURL}' + '/api/reviews/status', {id: id})
                .done(function (data) {
                    // Xử lý dữ liệu phản hồi (nếu có)
                    if (element.innerHTML == "Show") {
                        element.innerHTML = "Hide";
                    } else {
                        element.innerHTML = "Show";
                    }
                    alert('Cập nhật thành công!');
                })
                .fail(function () {
                    // Xử lý khi yêu cầu thất bại
                    alert('Cập nhật thất bại!');
                });
    }
    function changeSort(event) {
        var element = event.target;
        additionalData.sort = element.value;

        $('#content-quanly-binhluan').html('');
        loadDataReview(additionalData);
    }
    function pagemanager(e) {
        if (e == 1) {
            page++;
        } else {
            page--;
        }
        if (page < 0) {
            page = 0;
        }
        additionalData.page = page;
        $('#content-quanly-binhluan').html('');
        loadDataReview(additionalData);
    }
</script>
<style>
    .btn-change-status-review{
        cursor: pointer;
        color: blue;
    }
    .btn-change-status-review:hover {
        text-decoration: underline; /* Gạch chân */
    }
</style>
