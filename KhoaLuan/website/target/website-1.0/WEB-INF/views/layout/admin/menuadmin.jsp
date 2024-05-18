<%-- 
    Document   : menuadmin
    Created on : May 9, 2024, 2:34:20 PM
    Author     : Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
<div class="dropdown-menu">
    <a class="dropdown-item" href="${baseURL}/admin/user">Quản lý user</a>
    <a class="dropdown-item" href="${baseURL}/admin/store">Quản lý store</a>
    <a class="dropdown-item" href="${baseURL}/admin/product">Quản lý product</a>
    <a class="dropdown-item" href="${baseURL}/admin/statistic/product">Thống kê doanh thu theo sản phẩm</a>
    <a class="dropdown-item" href="${baseURL}/admin/statistic/type">Thống kê doanh thu theo loại sản phẩm</a> 
    <a class="dropdown-item" href="${baseURL}/admin/reviews">Quản lý bình luận sản phẩm</a>
</div>
