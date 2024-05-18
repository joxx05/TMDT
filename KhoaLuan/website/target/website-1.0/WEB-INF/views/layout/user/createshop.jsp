<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section class="breadcrumb-section set-bg" data-setbg="<c:url value='/resource/image/baner/bannermyshop.jpg'/>" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Create Shop</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>Tạo shop mới</h4>
                <c:url value="/myshop/create" var="action" />
                <form:form id="form-create-shop" action="${action}" method="post" modelAttribute="store">
                    <div class="row">
                        <div class="col-lg-12 col-md-6">
                            <div class="checkout__input">
                                <p>Tên shop:<span>*</span></p>
                                <form:input type="text" path="ten"/>
                            </div>
                            <div class="checkout__input">
                                <p>Mô tả:<span>*</span></p>
                                <form:input type="text" path="mota"/>
                            </div>
                            <div class="checkout__input">
                                <p>Phone:<span>*</span></p>
                                <form:input type="text" path="phone"/>
                            </div>
                            <div class="checkout__input">
                                <p>Địa chỉ:<span>*</span></p>
                                <form:input type="text" placeholder="Địa chỉ" class="checkout__input__add" path="address"/>
                            </div>
                            <div class="checkout__input">
                                <p>Ghi chú:</p>
                                <form:input type="text" path="ghichu"/>
                            </div>
                            <button type="submit" class="site-btn">Create</button>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
</section>
<script>
    $().ready(function() {
        
	$("#form-create-shop").validate({
		rules: {
                    "ten":"required",
                    "mota":"required",
                    "phone":{
                        required:true
                    }, 
                    "address":"required"
		},
                messages:{
                    "ten":"<strong>Cảnh báo!</strong> Phải nhập tên của cửa hàng!",
                    "mota":"<strong>Cảnh báo!</strong> Phải mô tả đầy đủ thông tin cửa hàng!",
                    "phone":{
                        required:"<strong>Cảnh báo!</strong> Phải nhập số điện thoại!"
                    },
                    "address":"<strong>Cảnh báo!</strong> Cửa hàng phải có địa chỉ!"
                    
                }
	});
    });
</script>