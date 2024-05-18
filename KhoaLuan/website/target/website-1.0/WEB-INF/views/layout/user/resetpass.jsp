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
                <c:url value="/resetpassword" var="action" />
                <form action="${action}" method="post">
                    <div class="row">
                        <div class="col-lg-12 col-md-6">
                            
                            <div class="checkout__input">
                                <p>Tài khoản:<span>*</span></p>
                                <input type="email" name="email" required placeholder="Email">
                            </div>
                            <button type="submit" class="site-btn">RESET PASSWORD</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->