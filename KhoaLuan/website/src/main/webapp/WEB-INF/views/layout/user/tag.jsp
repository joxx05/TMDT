<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
<div class="container shadow-lg p-3 mb-5 bg-body rounded position-relative" style="height: 100px;background-image: linear-gradient(#7fad39, #C3FCED);">
    <h4 class="position-absolute top-50 start-50 translate-middle"> Các sản phẩm có chủ đề: <span class="tag1">${tag.ten}</span></h4>
</div>
<section class="product spad">
    <div class="container">
        
        <div class="row">
        <c:set var="i" value="${0}"/>
        <c:forEach items="${tag.products}" var="item">
            <div class="col-lg-3 col-md-4 col-sm-4">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="<c:url value='/resource/image/products/'/><c:forEach var="img" items="${item.imgProducts}"  begin="0" step="1" end="0">${img.img}</c:forEach>" style="background-image: url(&quot;img/product/product-1.jpg&quot;);">
                            <ul class="product__item__pic__hover">
                                <li><a href="<c:url value='/product/' />${item.id}"><i class="fa fa-info-circle"></i></a></li>
                            <li><a class="addcart" id="<c:forEach var="type" items="${item.types}"  begin="0" step="1" end="0">${type.id}</c:forEach>"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>${item.ten}</h6>
                        <h5>
                            <c:forEach var="type" items="${item.types}"  begin="0" step="1" end="0">
                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${type.price}" />
                            </c:forEach> VND
                        </h5>
                    </div>
                </div>
            </div> 
            <c:set var="i" value="${i+1}"/>
        </c:forEach>
    </div>
</section>
