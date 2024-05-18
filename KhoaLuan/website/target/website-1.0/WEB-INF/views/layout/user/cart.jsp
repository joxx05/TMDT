<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
<input type="hidden" id="url-updatecart" value="${baseURL}/cart/updatecart""/>
<section class="breadcrumb-section set-bg" data-setbg="<c:url value='/resource/image/baner/cartbanner.jpg'/>" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Giỏ hàng</font></font></h2>
                    
                </div>
            </div>
        </div>
    </div>
</section>
<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table">
                    <table>
                        <thead>
                            <tr>
                                <th class="shoping__product"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Các sản phẩm</font></font></th>
                                <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Giá</font></font></th>
                                <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Số lượng</font></font></th>
                                <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Tổng cộng</font></font></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="tongcong" value="${0}"/>
                            <c:forEach items="${cart.cartTypes}" var="item">
                                <tr>
                                    <td class="shoping__cart__item">
                                        <h5><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${item.type.product.ten} - ${item.type.ten}</font></font></h5>
                                    </td>
                                    <td class="shoping__cart__price"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                                        <fmt:formatNumber type="number" maxFractionDigits="3" value="${item.type.price}" /> ₫
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty qtycart div${item.id}" id="${item.id}">
                                                <input class="qty" id="${item.id}" type="number" value="${item.soluong}">
                                            </div>
                                        </div>
                                    </td>
                                    <c:set var="tong" value="${item.soluong*item.type.price}"/>
                                    <td class="shoping__cart__total"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;" id="tong${item.id}">
                                        <fmt:formatNumber type="number" maxFractionDigits="3" value="${tong}" /> ₫
                                        </font></font></td>
                                    <td class="shoping__cart__item__close">
                                        <a style="text-decoration: none" href="${baseURL}/cart/delete/${item.id}"><span class="icon_close"></span></a>
                                    </td>
                                </tr> 
                                <c:set var="tongcong" value="${tongcong+tong}"/>
                            </c:forEach>
                                             
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__btns">
                    <a href="<c:url value="/" />" class="primary-btn cart-btn"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">TIẾP TỤC MUA SẮM</font></font></a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="shoping__continue">
                    <div class="shoping__discount">
                        <h5><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Mã giảm giá (Nếu có)</font></font></h5>
                        <form action="#">
                            <input type="text" placeholder="Nhập mã phiếu giảm giá của bạn">
                            <button type="submit" class="site-btn"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">APPlY</font></font></button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="shoping__checkout">
                    <h5><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Tổng tất cả</font></font></h5>
                    <ul>
                        <li><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Tổng cộng</font></font><span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;" id="tonggia"><fmt:formatNumber type="number" maxFractionDigits="3" value="${tongcong}" /> ₫</font></font></span></li>
                    </ul>
                    <a href="${baseURL}/bill/tranfer/${cart.id}" class="primary-btn"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Đặt hàng</font></font></a>
                </div>
            </div>
        </div>
    </div>
</section>