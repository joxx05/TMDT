<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!-- Categories Section Begin -->
<input type="hidden" id="url-addcart" value="<c:url value="cart/addcart"/>"/>
<section class="categories">
    <div class="container">
        <div class="row">

            <div class="categories__slider owl-carousel owl-loaded owl-drag">
                <div class="owl-stage-outer"><div class="owl-stage" style="transform: translate3d(-1440px, 0px, 0px); transition: all 1.2s ease 0s; width: 3120px;">
                        
                        <c:forEach items="${productnew}" var="item">
                            <div class="owl-item" style="width: 240px;">
                                <div class="featured__item" style="margin: 5px">
                                        <div class="shadow-lg p-3 mb-5 bg-body rounded featured__item__pic set-bg" data-setbg="<c:url value='/resource/image/products/'/><c:forEach var="img" items="${item.imgProducts}"  begin="0" step="1" end="0">${img.img}</c:forEach>" style="background-image: url(&quot;img/featured/feature-1.jpg&quot;);">
                                            <ul style="background-color: rgba(66, 65, 65, 0.595); padding: 3px" class="featured__item__pic__hover">
                                                <li><a href="<c:url value='/product/' />${item.id}"><i class="fa fa-info-circle"></i></a></li>

                                            <li>
                                                <a class="addcart" id="<c:forEach var="type" items="${item.types}"  begin="0" step="1" end="0">${type.id}</c:forEach>"><i class="fa fa-shopping-cart"></i></a>
                                            </li>
                                                <h6 style="color: white">${item.ten}</h6>
                                            </ul>
                                            
                                        </div>
                                </div>
                            </div>
                        </c:forEach>
                        
                        </div></div><div class="owl-nav"><button type="button" role="presentation" class="owl-prev"><span class="fa fa-angle-left"><span></span></span></button><button type="button" role="presentation" class="owl-next"><span class="fa fa-angle-right"><span></span></span></button></div><div class="owl-dots disabled"></div></div>
        </div>
    </div>
    <style>
    
    
    </style>
</section>
<!-- Categories Section End -->

<!-- Featured Section Begin -->
<section class="featured spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Sản phẩm được đánh giá cao ${user}</h2>
                </div>
                <div class="featured__controls">
                    <ul>
                        <li class="active" data-filter="*">All</li>
                            <c:forEach items="${tags}" var="item">
                            <li data-filter=".${item.ghichu}">${item.ten}</li>
                            </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row featured__filter" id="MixItUpDDEC34">
            <c:forEach items="${producttop}" var="item">
                <div class="col-lg-3 col-md-4 col-sm-6 mix <c:forEach items="${item.tags}" var="tags">${tags.ghichu} </c:forEach>">
                        <div class="featured__item">
                            <div class="featured__item__pic set-bg" data-setbg="<c:url value='/resource/image/products/'/><c:forEach var="img" items="${item.imgProducts}"  begin="0" step="1" end="0">${img.img}</c:forEach>" style="background-image: url(&quot;img/featured/feature-1.jpg&quot;);">
                                <ul class="featured__item__pic__hover">
                                    <li><a href="<c:url value='/product/' />${item.id}"><i class="fa fa-info-circle"></i></a></li>
                                    
                                    <li><a class="addcart" id="<c:forEach var="type" items="${item.types}"  begin="0" step="1" end="0">${type.id}</c:forEach>"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="featured__item__text" style="z-index: 1000">
                                <h6>${item.ten}</h6>
                            <h5>
                                <c:forEach var="type" items="${item.types}"  begin="0" step="1" end="0">
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${type.price}" />
                                </c:forEach> VND
                            </h5>
                            </div>
                    </div>
                </div> 
            </c:forEach>

        </div>
    </div>
</section>
<!-- Featured Section End -->

<!-- Banner Begin -->
<div class="banner">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="banner__pic">
                    <img src="img/banner/banner-1.jpg" alt="">
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="banner__pic">
                    <img src="img/banner/banner-2.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Banner End -->

<!-- Latest Product Section Begin -->
<section class="latest-product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">


                    <h4>Sản phẩm mới ${i}</h4>
                    <div class="latest-product__slider owl-carousel owl-loaded owl-drag">

                        <div class="owl-stage-outer">
                            <div class="owl-stage" style="transform: translate3d(-869px, 0px, 0px); transition: all 1.2s ease 0s; width: 1740px;">
                                <c:set var="i" value="${0}" />
                                <c:forEach items="${productnew}" var="item">
                                    <c:if test="${i%3==0}"><div class="owl-item" style="width: 289.984px;"><div class="latest-prdouct__slider__item"></c:if>
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
                            
                           
                        </div>
                    </div>
                    <div class="owl-nav"><button type="button" role="presentation" class="owl-prev"><span class="fa fa-angle-left"><span></span></span></button><button type="button" role="presentation" class="owl-next"><span class="fa fa-angle-right"><span></span></span></button></div><div class="owl-dots disabled"></div></div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6">
            <div class="latest-product__text">
                <h4>Sản phẩm top đầu</h4>
                <div class="latest-product__slider owl-carousel owl-loaded owl-drag">
                    <div class="owl-stage-outer">
                        <div class="owl-stage" style="transform: translate3d(-869px, 0px, 0px); transition: all 1.2s ease 0s; width: 1740px;">
                                <c:set var="i" value="${0}" />
                                <c:forEach items="${productreview}" var="item">
                                    <c:if test="${i%3==0}"><div class="owl-item" style="width: 289.984px;"><div class="latest-prdouct__slider__item"></c:if>
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
        <div class="col-lg-4 col-md-6">
            <div class="latest-product__text">
                <h4>Sản phẩm tốt</h4>
                <div class="latest-product__slider owl-carousel owl-loaded owl-drag">
                    <div class="owl-stage-outer">
                        <div class="owl-stage" style="transform: translate3d(-869px, 0px, 0px); transition: all 1.2s ease 0s; width: 1740px;">
                            
                                <c:set var="i" value="${0}" />
                                <c:forEach items="${productgood}" var="item">
                                    <c:if test="${i%3==0}"><div class="owl-item" style="width: 289.984px;"><div class="latest-prdouct__slider__item"></c:if>
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
</section>