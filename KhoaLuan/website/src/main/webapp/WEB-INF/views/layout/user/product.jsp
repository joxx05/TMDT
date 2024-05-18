<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
<section class="product-details">
    <div class="container shadow p-3 mb-5 bg-body rounded">
        <h4>Các thẻ liên quan:</h4>
        <c:forEach var="tag" items="${product.tags}">
            <a class="tag1" href="${baseURL}/products/tag/${tag.id}"><span >${tag.ten}</span></a>
            </c:forEach>

    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="product__details__pic">
                    <div class="product__details__pic__item">
                        <img class="product__details__pic__item--large" style="height: 500px" src="<c:url value='/resource/image/products/'/><c:forEach var="img" items="${product.imgProducts}"  begin="0" step="1" end="0">${img.img}</c:forEach>" alt="">
                        </div>
                        <div class="product__details__pic__slider owl-carousel owl-loaded owl-drag">
                            <div class="owl-stage-outer">
                                <div class="owl-stage" style="transform: translate3d(-1006px, 0px, 0px); transition: all 1.2s ease 0s; width: 1725px;">
                                <c:forEach var="img" items="${product.imgProducts}">
                                    <div class="owl-item cloned" style="width: 123.75px; margin-right: 20px;">
                                        <img data-imgbigurl="<c:url value='/resource/image/products/'/>${img.img}" src="<c:url value='/resource/image/products/'/>${img.img}" alt="">
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                        <div class="owl-nav disabled">
                            <button type="button" role="presentation" class="owl-prev">
                                <span aria-label="Previous">‹</span>
                            </button>
                            <button type="button" role="presentation" class="owl-next">
                                <span aria-label="Next">›</span>
                            </button></div>
                        <div class="owl-dots disabled">
                            <button role="button" class="owl-dot active">
                                <span></span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">

                <div class="product__details__text">
                    <h3>${product.ten}</h3>
                    <div >

                        <b style="font-size: 20px;padding: 5px; margin-right: 10px" class="border border-warning">
                            ${product.rating} <span style="color: yellow" class="fa fa-star"></span>
                        </b>

                        <span>(<i class="fa fa-comments-o" aria-hidden="true"></i> ${product.reviews.size()} <strong>Reviews</strong>)</span>
                        <span>(<i class="fa fa-eye" aria-hidden="true"></i> ${product.view} <strong>Views</strong>)</span>
                    </div>
                    <ul class="nav nav-pills" role="tablist">
                        <c:set var="i" value="${0}" />
                        <c:forEach items="${product.types}" var="item" begin="0" step="1">
                            <li role="presentation" style="margin-right: 10px">
                                <a href="#tab${item.id}" role="tab" data-toggle="tab" class="btn btn-outline-success <c:if test="${i==0}">active</c:if>">${item.ten}</a>
                                </li>
                            <c:set var="i" value="${i+1}" />
                        </c:forEach>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <c:set var="i" value="${0}" />
                        <c:forEach items="${product.types}" var="item" begin="0" step="1">
                            <div role="tabpanel" class="tab-pane <c:if test="${i==0}">active</c:if>" id="tab${item.id}">
                                    <br>
                                    <h4>${item.ten}</h4>
                                <div class="product__details__price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.price}" /> VND</div>
                                <p>Mô tả: ${item.mota}</p>
                                <p>Ghi chú: ${item.ghichu}</p>
                                <div class="product__details__quantity">
                                    <div class="quantity">
                                        <div class="pro-qty">
                                            <input class="qty-${item.id}" type="text" value="1">
                                        </div>
                                    </div>
                                </div>
                                <button class="primary-btn add-cart" id="${item.id}">ADD TO CARD</button>
                            </div>
                            <c:set var="i" value="${i+1}" />
                        </c:forEach>
                    </div>

                </div>
            </div>
            <div class="container">
                <h3 style="color: #7fad39; margin:20px">Sản phẩm của: <strong>${product.storeOfProduct.ten}</strong> 
                    <c:if test="${pageContext.request.userPrincipal.name!=null&&pageContext.request.userPrincipal.name!=product.storeOfProduct.user.email}">
                        <input type="hidden" id="id-email" value="${product.storeOfProduct.user.email}">
                        <button id="chat-start" class="btn btn-primary"><i class="fa fa-commenting" aria-hidden="true"></i> Chat</button></h3>
                    </c:if>

            </div>
            <div class="col-lg-12">
                <div class="product__details__tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab" aria-selected="false">Mô tả</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab" aria-selected="true">Đánh giá</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>Mô tả sản phẩm</h6>
                                <p>${product.mota}</p>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>Đánh giá sản phẩm</h6>
                                <c:forEach items="${product.reviews}" var="item">
                                    <c:if test="${item.status}">
                                        <div class="card">
                                            <div class="card-header">
                                                <img src="<c:url value='/resource/image/user/'/>${item.user.image}" style="width: 50px" class="rounded-circle" alt="Cinque Terre">
                                                <b> ${item.user.ten}</b>
                                            </div>
                                            <div class="card-body">
                                                <blockquote class="blockquote mb-0">
                                                    <p>${item.comment}</p>
                                                    <footer class="blockquote-footer"><cite title="Source Title">
                                                            <small>Date: ${item.date}</small>
                                                        </cite></footer>
                                                </blockquote>
                                            </div>
                                            <div class="card-footer text-muted">
                                                <c:forEach items="${item.imgReviews}" var="imgrv">
                                                    <a type="button" data-toggle="modal" data-target="#modal${imgrv.id}">
                                                        <img src="<c:url value='/resource/image/reviews/'/>${imgrv.img}" class="img-thumbnail image-review" alt="Cinque Terre">
                                                    </a>
                                                    <!-- Modal -->
                                                    <div class="modal fade" id="modal${imgrv.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalCenterTitle">View image</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div class="container-fluid">
                                                                        <img src="<c:url value='/resource/image/reviews/'/>${imgrv.img}" class="img-thumbnail col-md-12" alt="Cinque Terre">
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <small>Date: ${imgrv.date_create}</small>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>

                                            </div>
                                        </div> 
                                    </c:if>
                                </c:forEach>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>



