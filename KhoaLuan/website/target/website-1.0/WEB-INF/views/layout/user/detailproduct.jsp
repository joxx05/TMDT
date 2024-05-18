<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section class="breadcrumb-section set-bg" data-setbg="<c:url value='/resource/image/baner/bannermyshop.jpg'/>" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Chỉnh sửa sản phẩm</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="checkout spad">
    <div class="container">
        <div class="checkout__form">
            <h4>Cập nhật sản phẩm ${product.ten}</h4>
            <c:url value="/myshop/detail/${idshop}/product/${product.id}" var="action" />
            <form:form id="form-update-product" action="${action}" method="post" enctype="multipart/form-data" modelAttribute="product" acceptCharset="UTF-8">
                <div class="row">
                    <div class="col-lg-12 col-md-6">
                        <c:forEach items="${product.imgProducts}" var="item">
                            <div class="type-1">
                                <div class="form-group">
                                    <div class="checkout__input">
                                        <p>Hình ảnh:<span>*</span></p>
                                        <input type="text" name="" value="${item.img}"/>
                                    </div>
                                </div>
                                <hr>
                            </div>
                        </c:forEach>
                        <div class="checkout__input">
                            <form:input type="hidden"   path="id"/>
                            <c:set var="store" value="${product.storeOfProduct}"/>
                            <p>Tên sản phẩm:<span>*</span></p>
                            <form:input type="text"   path="ten"/>
                        </div>
                        <div class="checkout__input">
                            <p>Mô tả:<span>*</span></p>
                            <form:input type="text"  path="mota"/>
                        </div>
                        <div class="checkout__input">
                            <p>Số lượng:<span>*</span></p>
                            <form:input type="number"  path="soluong"/>
                        </div>
                        <div class="checkout__input">
                            <p>Ghi chú:<span>*</span></p>
                            <form:input type="text"  path="ghichu"/>
                        </div>
                        <div class="checkout__input">
                            <p>Hình ảnh:<span>*</span></p>
                            <input class='fileInput' type="file" name="img[]" multiple="multiple"/>
                        </div>
                        <c:set var="tags" value="" />
                        <c:forEach items="${product.tags}" var="item">
                            <c:set var="tags" value="${item.ten},${tags}" />
                        </c:forEach>
                        <div class="checkout__input">
                            <p>Tag của sản phẩm:<span>*</span></p>
                            <input type="text" value="${tags}" data-role="tagsinput" name="tag">
                        </div>
                        <div id="form-append">
                            <div>
                                <c:forEach items="${product.types}" var="item">
                                    <div class="type-1">
                                        <div class="form-group">
                                            <div class="checkout__input">
                                                <p>Tên loại:<span>*</span></p>
                                                <input type="text" name="nametype[]" value="${item.ten}"/>
                                            </div>
                                            <div class="checkout__input">
                                                <p>Mô tả:<span>*</span></p>
                                                <input type="text" name="motatype[]" value="${item.mota}"/>
                                            </div>
                                            <div class="checkout__input">
                                                <p>Giá:<span>*</span></p>
                                                <input type="text" name="price[]" value="${item.price}"/>
                                            </div>
                                            <div class="checkout__input">
                                                <p>Ghi chú:<span>*</span></p>
                                                <input type="text" name="ghichutype[]" value="${item.ghichu}"/>
                                            </div>
                                        </div>
                                        <hr>
                                    </div>
                                </c:forEach>
                                <button type="button" id="btn-add-type" class="site-btn">Add type</button>
                                <button type="submit" class="site-btn">Update product</button>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
            </section>

<script>
    $().ready(function() {
        
	$("#form-update-product").validate({
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