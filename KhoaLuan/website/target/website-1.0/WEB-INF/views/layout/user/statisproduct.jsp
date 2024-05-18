<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
<c:if test="${isCheck}">
<section class="breadcrumb-section set-bg" data-setbg="<c:url value='/resource/image/baner/bannermyshop.jpg'/>" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>${store.ten}</h2>
                </div>
            </div>
        </div>
    </div>
</section>
                
<div class="container" style="margin-top:20px;margin-bottom: 20px">
    <div class="row">
        <div class="col-lg-8"><h3 style="text-align: center"><strong>Thống kê doanh thu theo sản phẩm</strong></h3></div>
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
</div>
<div class="container" style="margin-top: 5px">
        <div class="row">
            <input class="form-control" type="hidden" id="id-shop" value="${store.id}">
            <div class="col-lg-3">
                <strong>Ngày bắt đầu</strong><input class="form-control" type="date" id="mindate-statistic-product">
            </div>
            <div class="col-lg-3">
                <strong>Ngày kết thúc</strong><input class="form-control" type="date" id="maxdate-statistic-product">
            </div>
            <div class="col-lg-3">
                <strong>Thống kê theo</strong>
                <select class="form-select" id="type-statis">
                    <option selected>Choose...</option>
                    <option value="0">Tháng</option>
                    <option value="2">Quý</option>
                    <option value="1">Năm</option>
                </select>
            </div>
            <div class="col-lg-3">
                <br>
                <div class="filter__option">
                    <button class="site-btn" id="statistic-product">Statistic</button>
                </div>
            </div>
        </div>
    </div>
<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <h4><strong>Biểu đồ tròn</strong></h4>
                <div class="shadow-lg p-3 mb-5 bg-body rounded nodata" style="text-align: center"><h4>Chưa có dữ liệu</h4></div>
                <div id="chart_div"></div>
            </div>
            
            <div class="col-lg-6">
                <h4><strong>Biểu đồ cột</strong></h4>
                <div class="shadow-lg p-3 mb-5 bg-body rounded nodata" style="text-align: center"><h4>Chưa có dữ liệu</h4></div>
                <div id="columnchart_values" style="width: 900px; height: 300px;"></div>
            </div>
            <div class="col-lg-12" style="margin-top: 30px">
                <div>
                    <div><h4><strong>Bảng thống kê doanh thu theo sản phẩm</strong></h4></div>
                    <div id="table_div"></div>
                    <div class="shadow-lg p-3 mb-5 bg-body rounded nodata" style="text-align: center"><h4>Chưa có dữ liệu</h4></div>
                </div>
            </div>
            <div class="col-lg-12" style="margin-top: 30px">
                <div>
                    <div><h4><strong id="table-content"></strong></h4></div>
                    <div id="table_divdt"></div>
                </div>
            </div>
            
        </div>
    </div>
    
</section>
</c:if>
<c:if test="${isCheck==false}">
    <div class="container h-50">
        <br><br>
        <h3>Bạn không có quyền truy cập shop này!</h3>
    </div>
</c:if>
