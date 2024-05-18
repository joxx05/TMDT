<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
<section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>Sản phẩm mới</h4>
                                <div class="latest-product__slider owl-carousel owl-loaded owl-drag">
                                <div class="owl-stage-outer">
                                    <div class="owl-stage" style="transform: translate3d(-630px, 0px, 0px); transition: all 1.2s ease 0s; width: 1260px;">
                                    <c:set var="i" value="${0}" />
                                    <c:forEach items="${productsnew}" var="item">
                                        <c:if test="${i%3==0}"><div class="owl-item cloned" style="width: 289.984px;"><div class="latest-prdouct__slider__item"></c:if>
                                                <a href="<c:url value='/product/' />${item.id}" class="latest-product__item link1">
                                                    <div class="latest-product__item__pic">
                                                        <img style="width: 100px" src="<c:url value='/resource/image/products/'/><c:forEach var="img" items="${item.imgProducts}"  begin="0" step="1" end="0">${img.img}</c:forEach>" alt="">
                                                    </div>
                                                    <div class="latest-product__item__text">
                                                        <h6>${item.ten}</h6>
                                                        <span><c:forEach var="type" items="${item.types}"  begin="0" step="1" end="0"><fmt:formatNumber type="number" maxFractionDigits="3" value="${type.price}" /></c:forEach> VND</span>
                                                    </div>
                                                </a>
                                        <c:if test="${i%3==2}"></div></div></c:if>
                                        <c:set var="i" value="${i+1}" />
                                    </c:forEach>
                                    
                                    </div></div><div class="owl-nav"><button type="button" role="presentation" class="owl-prev"><span class="fa fa-angle-left"><span></span></span></button><button type="button" role="presentation" class="owl-next"><span class="fa fa-angle-right"><span></span></span></button></div><div class="owl-dots disabled"></div></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__option">
                                    
                                </div>
                                
                            </div>
                            <div class="col-lg-4 col-md-4">
                                
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__sort">
                                    <span><b>Sort By</b></span>
                                    <div class="nice-select" tabindex="0">
                                        <span class="current">
                                            <c:if test="${sort==1}" ><i class="fa fa-arrow-circle-up" aria-hidden="true"></i>Mới nhất</c:if>
                                            <c:if test="${sort==2}" ><i class="fa fa-arrow-circle-down" aria-hidden="true"></i> Cũ</c:if>
                                            <c:if test="${sort==3}" ><i class="fa fa-arrow-circle-up" aria-hidden="true"></i>Theo tên</c:if>
                                            <c:if test="${sort==4}" ><i class="fa fa-arrow-circle-down" aria-hidden="true"></i> Theo tên</c:if>
                                            <c:if test="${sort==5}" ><i class="fa fa-arrow-circle-up" aria-hidden="true"></i> Theo số lượng người xem</c:if>
                                            <c:if test="${sort==6}" ><i class="fa fa-arrow-circle-down" aria-hidden="true"></i> Theo số lượng người xem</c:if>
                                            <c:if test="${sort==7}" ><i class="fa fa-arrow-circle-up" aria-hidden="true"></i> Theo đánh giá</c:if>
                                            <c:if test="${sort==8}" ><i class="fa fa-arrow-circle-down" aria-hidden="true"></i> Theo đánh giá</c:if>
                                        </span>
                                        <ul class="list">
                                            <li  class="option <c:if test="${sort==1}" >selected</c:if>"><a href="<c:url value="${baseURL}/products/${page}/1"/>"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i>Mới nhất</a></li>
                                            <li  class="option <c:if test="${sort==2}" >selected</c:if>"><a href="<c:url value="${baseURL}/products/${page}/2"/>"><i class="fa fa-arrow-circle-down" aria-hidden="true"></i> Cũ</a></li>
                                            <li  class="option <c:if test="${sort==3}" >selected</c:if>"><a href="<c:url value="${baseURL}/products/${page}/3"/>"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i>Theo tên</a></li>
                                            <li  class="option <c:if test="${sort==4}" >selected</c:if>"><a href="<c:url value="${baseURL}/products/${page}/4"/>"><i class="fa fa-arrow-circle-down" aria-hidden="true"></i> Theo tên</a></li>
                                            <li  class="option <c:if test="${sort==1}" >selected</c:if>"><a href="<c:url value="${baseURL}/products/${page}/5"/>"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i>Theo số lượng người xem</a></li>
                                            <li  class="option <c:if test="${sort==2}" >selected</c:if>"><a href="<c:url value="${baseURL}/products/${page}/6"/>"><i class="fa fa-arrow-circle-down" aria-hidden="true"></i> Theo số lượng người xem</a></li>
                                            <li  class="option <c:if test="${sort==3}" >selected</c:if>"><a href="<c:url value="${baseURL}/products/${page}/7"/>"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i>Theo đánh giá</a></li>
                                            <li  class="option <c:if test="${sort==4}" >selected</c:if>"><a href="<c:url value="${baseURL}/products/${page}/8"/>"><i class="fa fa-arrow-circle-down" aria-hidden="true"></i> Theo đánh giá</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <c:set var="i" value="${0}"/>
                        <c:forEach items="${products}" var="item">
                            <div class="col-lg-4 col-md-6 col-sm-6">
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
                        
                    <div class="product__pagination">
                        <c:if test="${page>0}"> <a href="${baseURL}/products/${page-1}/${sort}"><i class="fa fa-long-arrow-left"></i></a></c:if>
                        <a href="#">${page}</a>
                        <c:if test="${i>=9}"><a href="${baseURL}/products/${page+1}/${sort}"><i class="fa fa-long-arrow-right"></i></a></c:if>
                    </div>
                </div>
            </div>
        </div>
    </section>