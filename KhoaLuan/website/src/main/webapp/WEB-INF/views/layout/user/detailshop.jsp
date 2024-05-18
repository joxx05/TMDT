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
        <div class="col-lg-8"><h3 style="text-align: center"><strong>Quản lý sản phẩm</strong></h3></div>
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
            <div class="col-lg-4 col-md-5">
                <br>
                <div class="filter__option">
                    <a href="<c:url value="/myshop/detail/addproduct/${store.id}"/>" class="site-btn">Add product</a>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <br>
                <div class="input-group mb-3">
                    <input type="hidden" value="${store.id}" id="id-shop">
                    <input type="hidden" value="<c:url value="/searchinshop"/>" id="url-search-in-shop">
                    <input type="text" id="boxsearch-inshop" class="form-control" placeholder="Tìm kiếm trong shop" aria-label="Recipient's username" aria-describedby="basic-addon2">
                </div>
            </div>
            <div class="col-lg-4 col-md-3">
                <br>
                <b>Tổng số sản phẩm:</b> ${productCount}
            </div>
        </div>
    </div>
<section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Sản phẩm</th>
                                    <th>Số lượng</th>
                                    <th>Control</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${products}" var="product">
                                    <tr>
                                        <td class="shoping__cart__item">
                                            <img src="img/cart/cart-1.jpg" alt="">
                                            <h5>${product.ten}</h5>
                                        </td>
                                        <td class="shoping__cart__quantity">
                                            <div class="quantity">
                                                <div class="pro-qty">
                                                    <input type="text" value="${product.soluong}">
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <a href="<c:url value="/myshop/detail/${store.id}/product/${product.id}"/>" class="primary-btn">EDIT</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                
                            </tbody>
                        </table>
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
