<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:if test = "${param.error != null}">
    <div class="alert alert-warning alert-dismissible fade show" role="alert">
        <strong>Cảnh báo!</strong> Lỗi xác thực!
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
<c:if test = "${statusMess == 0}">
    <div class="alert alert-warning alert-dismissible fade show" role="alert">
        <strong>Cảnh báo!</strong> ${message}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
<c:if test = "${statusMess == 1}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>Thành công!</strong> ${message}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
<c:if test = "${param.accessDenied != null}">
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <strong>Lỗi!</strong> Bạn không có quyền truy cập!
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
<style>
    .alert{
        position: fixed;
        top: 0%;
        left: 50%;
        transform: translate(-50%, 0%);
    }
</style>