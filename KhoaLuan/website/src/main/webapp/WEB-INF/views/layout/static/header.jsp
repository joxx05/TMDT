
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
<input type="hidden" id="url-addcart" value="${baseURL}/cart/addcart""/>
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Humberger Begin -->
<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
    <div class="humberger__menu__logo">
        <a href="#"><img src="img/logo.png" alt=""></a>
    </div>
    <div class="humberger__menu__cart">
        <ul>
            <li>
                <a href="${baseURL}/cart"><i class="fa fa-shopping-bag"></i>
                </a>
            </li>
        </ul>
    </div>
    <div class="humberger__menu__widget">
        <div class="header__top__right__language">
            <a class="link1" href="<c:url value="/register"/>">Register</a>
        </div>
        <div class="header__top__right__auth">
            <c:if test="${pageContext.request.userPrincipal.name==null}">
                <a class="link1" href="<c:url value="/login"/>"><i class="fa fa-user"></i> Login</a>
            </c:if>
            <c:if test="${pageContext.request.userPrincipal.name!=null}">
                <div class="header__top__right__language">
                    <div>${pageContext.request.userPrincipal.name}</div>
                    <span class="arrow_carrot-down"></span>
                    <ul style="width: 200px">
                        <li><a href="${baseURL}/profile"><i class="fa fa-address-card-o" aria-hidden="true"></i> Info</a></li>
                        <li><a href="${baseURL}/myshop"><i class="fa fa-shopping-cart" aria-hidden="true"></i> My shop</a></li>
                        <li><a href="${baseURL}/bill"><i class="fa fa-outdent" aria-hidden="true"></i> Đơn hàng của tôi</a></li>
                        <li><a href="${baseURL}/logout"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
                    </ul>
                </div>
            </c:if>
        </div>
    </div>
    <nav class="humberger__menu__nav mobile-menu">
        <ul>
            <li class="active"><a href="${baseURL}">Home</a></li>
            <li><a href="${baseURL}/products/0/1">Products</a></li>
            <li><a href="${baseURL}/myshop">My Shop</a></li>
            <li><a href="${baseURL}/contact">Contact</a></li>
        </ul>
    </nav>
    <div id="mobile-menu-wrap"></div>
    <div class="header__top__right__social">
        <a href="#"><i class="fa fa-facebook"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-pinterest-p"></i></a>
    </div>
    <div class="humberger__menu__contact">
        <ul>
            <li><i class="fa fa-envelope"></i> 2051012074nguyen@ou.edu.vn</li>
            <li>Open University</li>
        </ul>
    </div>
</div>
<!-- Humberger End -->

<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa fa-envelope"></i> 2051012074nguyen@ou.edu.vn</li>
                            <li>Open University</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                            <a href="#"><i class="fa fa-pinterest-p"></i></a>
                        </div>
                        <div class="header__top__right__language">
                            <a class="link1" href="<c:url value="/register"/>">Register</a>
                        </div>
                        <div class="header__top__right__auth">
                            <c:if test="${pageContext.request.userPrincipal.name==null}">
                                <a class="link1" href="<c:url value="/login" />"><i class="fa fa-user"></i> Login</a>
                            </c:if>
                            <c:if test="${pageContext.request.userPrincipal.name!=null}">
                                <div class="header__top__right__language">
                                    <div>${pageContext.request.userPrincipal.name}</div>
                                    <span class="arrow_carrot-down"></span>
                                    <ul style="width: 200px">
                                        <li><a href="${baseURL}/profile"><i class="fa fa-address-card-o" aria-hidden="true"></i> Info</a></li>
                                        <li><a href="${baseURL}/myshop"><i class="fa fa-shopping-cart" aria-hidden="true"></i> My shop</a></li>
                                        <li><a href="${baseURL}/bill"><i class="fa fa-outdent" aria-hidden="true"></i> Đơn hàng của tôi</a></li>
                                        <li><a href="${baseURL}/logout"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
                                    </ul>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="./index.html"><img src="img/logo.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li><a href="${baseURL}">Home</a></li>
                        <li><a href="${baseURL}/products/0/1">Products</a></li>
                        <li><a href="${baseURL}/myshop">My Shop</a></li>
                        <li><a href="${baseURL}/contact">Contact</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>
                        <li><a href="${baseURL}/cart"><i class="fa fa-shopping-bag"></i></a></li>
                    </ul>

                </div>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>
<!-- Header Section End -->

<!-- Hero Section Begin -->
<section class="hero hero-normal">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>All tags</span>
                    </div>
                    <ul>
                        <c:forEach items="${tags}" var="item">
                            <li><a href="${baseURL}/products/tag/${item.id}" class="link1">${item.ten}</a></li>
                            </c:forEach>

                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="#">
                            <div class="hero__search__categories">
                                Enter keywords
                                <i class="fa fa-angle-double-right" aria-hidden="true"></i>
                            </div>
                            <input id="url-search" type="hidden" value="${baseURL}/search">
                            <input id="boxsearch" type="text" placeholder="What do you need?">
                            <button type="submit" class="site-btn">SEARCH</button>
                        </form>
                    </div>
                    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>+0774926640</h5>
                            <span>support 24/7 time</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section id="result-search" class="container">
    <div class="centered shadow p-3 mb-5 bg-body rounded" style=" position: relative;width:80% ;height: auto; z-index: 2000">

    </div>
</section>
