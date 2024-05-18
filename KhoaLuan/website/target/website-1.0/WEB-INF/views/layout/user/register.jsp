<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<c:url value='/resource/image/baner/register.jpg'/>">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Register</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>Đăng ký tài khoản ${ttt}</h4>
                <c:url value="/register" var="action" />
                <form:form id="form-register" action="${action}" method="post" enctype="multipart/form-data" modelAttribute="user" acceptCharset="UTF-8">
                    <div class="row">
                        <div class="col-lg-12 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <form:input type="email" path="email"/>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <form:input type="text" path="phone"/>
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Mật khẩu:<span>*</span></p>
                                <form:input type="password" path="password"/>
                            </div>
                            <div class="checkout__input">
                                <p>Nhập lại mật khẩu:<span>*</span></p>
                                <form:input type="password" path="confirmPassword"/>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Tên<span>*</span></p>
                                        <form:input type="text" path="ten"/>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Họ<span>*</span></p>
                                        <form:input type="text" path="ho"/>
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Giới thiệu:<span>*</span></p>
                                <form:input type="text" path="gioithieu"/>
                            </div>
                            <div class="checkout__input">
                                <p>Địa chỉ:<span>*</span></p>
                                <form:input type="text" placeholder="Địa chỉ" class="checkout__input__add" path="address"/>
                            </div>
                            <div class="checkout__input">
                                <p>Ghi chú:<span>*</span></p>
                                <form:input type="text" path="ghichu"/>
                            </div>
                            
                            <div class="checkout__input">
                                <p>Hình ảnh<span>*</span></p>
                                <input type="file" name="img"/>
                            </div>
                            <button type="submit" class="site-btn">REGISTER</button>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
<script>
    $().ready(function() {
        
	$("#form-register").validate({
		rules: {
                    "email":{
                        required: true,
                        email:true
                    },
                    "password":{
                        required: true,
                        minlength: 6
                    },
                    "phone":{
                        required:true
                    }, 
                    "address":"required",
                    "ten":"required",
                    "ho":"required",
                    "gioithieu":"required",
                    "img":"required"
		},
                messages:{
                    "email":{
                        required:"<strong>Cảnh báo!</strong> Không để trống email!",
                        email:"<strong>Cảnh báo!</strong> Không đúng định dạng email!"
                    },
                    "password":{
                        required:"<strong>Cảnh báo!</strong> Phải nhập mật khẩu!",
                        minlength: "<strong>Cảnh báo!</strong> Mật khẩu phải hơn 6 chữ số!"
                    },
                    "phone":{
                        required:"<strong>Cảnh báo!</strong> Phải nhập số điện thoại!"
                    },
                    "address":"<strong>Cảnh báo!</strong> Không thể để trống địa chỉ!",
                    "ten":"<strong>Cảnh báo!</strong> Không thể để trống tên!",
                    "ho":"<strong>Cảnh báo!</strong> Không thể để trống họ!",
                    "gioithieu":"<strong>Cảnh báo!</strong> Không thể để trống giới thiệu!",
                    "img":"<strong>Cảnh báo!</strong> Phải có hình ảnh user!"
                }
	});
    });
</script>