<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="<c:url value='/resource/image/baner/register.jpg'/>">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Reset password</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->
<section class="checkout spad">
    <div class="container">
        <div class="checkout__form">
            <h4>Reset password</h4>
            <c:choose>
                <c:when test="${status}">
                    <form action="" method="post">
                        <div class="row">
                            <div class="col-lg-12 col-md-6">
                                <div class="checkout__input">
                                    <h5>Reset account <b>${email}</b></h5>

                                </div>
                                <div class="checkout__input">
                                    <p>Nhập mật khẩu mới:<span>*</span></p>
                                    <input type="password" name="password" required placeholder="Nhập password">
                                </div>
                                <div class="checkout__input">
                                    <p>Nhập lại mật khẩu mới:<span>*</span></p>
                                    <input type="password" name="repassword" required placeholder="Nhập lại password">
                                </div>
                                <button type="submit" class="site-btn">CHANGE PASSWORD</button>
                            </div>
                        </div>
                    </form>
                </c:when>
                <c:when test="${!status}">
                    <p>Đường dẫn hết hạn! Vui lòng thực hiện lại thao tác reset password!</p>
                </c:when>
                <c:otherwise>
                    <p>ERR! Thông báo cho quản trị!</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</section>
<!-- Checkout Section End -->
