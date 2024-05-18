<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${isCheck}">
    <section class="breadcrumb-section set-bg" data-setbg="<c:url value='/resource/image/baner/bannermyshop.jpg'/>" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>${store.ten}</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>Thêm sản phẩm</h4>
                <c:url value="/myshop/detail/addproduct/${store.id}" var="action" />
                <form:form id="form-add-product" action="${action}" method="post" enctype="multipart/form-data" modelAttribute="product" acceptCharset="UTF-8">
                    <div class="row">
                        <div class="col-lg-12 col-md-6">
                            <div class="checkout__input">
                                <p>Tên sản phẩm:<span>*</span></p>
                                <form:input type="text" path="ten"/>
                            </div>
                            <div class="checkout__input">
                                <p>Mô tả:<span>*</span></p>
                                <form:input type="text" path="mota"/>
                            </div>
                            <div class="checkout__input">
                                <p>Số lượng:<span>*</span></p>
                                <form:input type="number" path="soluong"/>
                            </div>
                            <div class="checkout__input">
                                <p>Ghi chú:<span>*</span></p>
                                <form:input type="text" path="ghichu"/>
                            </div>
                            <div class="checkout__input">
                                <p>Hình ảnh:<span>*</span></p>
                                <input class='fileInput' type="file" name="img[]" multiple="multiple" />
                            </div>
                            
                            <div class="checkout__input">
                                <p>Thêm tag cho sản phẩm:<span>*</span></p>
                                <input type="text" value="" data-role="tagsinput" name="tag">
                            </div>
                            <div id="form-append">
                                <div>
                                    <div class="type-1">
                                        <div class="form-group">
                                            <div class="checkout__input">
                                                <p>Tên loại:<span>*</span></p>
                                                <input type="text" name="nametype[]"/>
                                            </div>
                                            <div class="checkout__input">
                                                <p>Mô tả:<span>*</span></p>
                                                <input type="text" name="motatype[]"/>
                                            </div>
                                            <div class="checkout__input">
                                                <p>Giá:<span>*</span></p>
                                                <input type="text" name="price[]"/>
                                            </div>
                                            <div class="checkout__input">
                                                <p>Ghi chú:<span>*</span></p>
                                                <input type="text" name="ghichutype[]"/>
                                            </div>
                                        </div>
                                        <hr>
                                    </div>
                                </div>
                            </div>
                            <button type="button" id="btn-add-type" class="site-btn">Add type</button>
                            <button id="btn-submit-add" type="submit" class="site-btn">Add product</button>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </section>
</c:if>
<c:if test="${isCheck==false}">
    <div class="container h-50">
        <br><br>
        <h3>Bạn không có quyền truy cập shop này!</h3>
    </div>
</c:if>
<script>
    $().ready(function() {
        
	$("#form-add-product").validate({
		rules: {
                    "ten":"required",
                    "mota":"required",
                    "soluong":"required", 
                    "img[]":"required",
                    "nametype[]":"required",
                    "motatype[]":"required",
                    "price[]":"required",
                    "tag":"required"
		},
                messages:{
                    "ten":"<strong>Cảnh báo!</strong> Phải nhập tên của sản phẩm!",
                    "mota":"<strong>Cảnh báo!</strong> Phải mô tả đầy đủ thông tin sản phẩm!",
                    "soluong":"<strong>Cảnh báo!</strong> Phải nhập số lượng của sản phẩm!",
                    "img[]":"<strong>Cảnh báo!</strong> Sản phẩm phải có hình ảnh!",
                    "nametype[]":"<strong>Cảnh báo!</strong> Loại sản phẩm phải có tên!",
                    "motatype[]":"<strong>Cảnh báo!</strong> Phải mô tả đầy đủ thông tin loại sản phẩm!",
                    "price[]":"<strong>Cảnh báo!</strong> Phải nhập giá của loại sản phẩm!",
                    "tag":"<strong>Cảnh báo!</strong> Sản phẩm phải có tag!"
                }
	});
    });
</script>