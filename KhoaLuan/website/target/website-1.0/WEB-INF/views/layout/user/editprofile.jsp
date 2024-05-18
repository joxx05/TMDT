<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
<section class="breadcrumb-section set-bg" data-setbg="<c:url value='/resource/image/baner/profilebanner.jpg'/>" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
    <div class="container" >
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Edit Profile</font></font></h2>
                    
                </div>
            </div>
        </div>
    </div>
</section>
<section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>Chỉnh sửa thông tin</h4>
                <c:url value="${baseURL}/profile/edit" var="action" />
                <form:form action="${action}" method="post" enctype="multipart/form-data" modelAttribute="user" acceptCharset="UTF-8">
                    <div class="row">
                        <div class="col-lg-12 col-md-6">
                            <div class="row">
                                <input type="hidden" name="id" value="${user.id}"/>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="email" readonly value="${user.email}" />
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <form:input type="text" path="phone"/>
                                    </div>
                                </div>
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
                            <button type="submit" class="site-btn">Update</button>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </section>
