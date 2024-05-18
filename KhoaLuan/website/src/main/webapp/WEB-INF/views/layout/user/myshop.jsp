<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section class="breadcrumb-section set-bg" data-setbg="<c:url value='/resource/image/baner/bannermyshop.jpg'/>" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>My Shop</h2>
                </div>
            </div>
        </div>
    </div>
</section>
    <div class="container" style="margin-top: 5px">
        <div class="row">
            <div class="col-lg-4 col-md-5">                      
            </div>
            <div class="col-lg-4 col-md-4">
            </div>
            <div class="col-lg-4 col-md-3">
                <div class="filter__option">
                    <a href="<c:url value="/myshop/create"/>" class="site-btn">Create new shop</a>
                </div>
            </div>
        </div>
    </div>
<div class="row">
    <c:if test="${stores!=null}">
        <c:forEach items="${stores}" var="store">
            <div class="col-lg-4 col-md-6 col-sm-6 shadow-lg p-3 mb-5 bg-white rounded">
                <div class="product__item">
                    <div class="product__item__text">
                        <h6>${store.ten}</h6>
                        <h5>${store.mota}</h5>
                        <c:if test="${store.status}"><a href="<c:url value="/myshop/detail/${store.id}"/>" class="site-btn">Xem</a></c:if>
                        <c:if test="${!store.status}"><h5 style="color: red">Shop đã bị khóa, liên hệ admin để mở khóa store của bạn!</h5></c:if>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:if>
    
</div>
<c:if test="${stores==null}">
    <div class="container h-25">
        <h3>Bạn chưa có shop của mình, hãy tạo shop ngay!</h3>
    </div>
</c:if>