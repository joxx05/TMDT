<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
<c:set var="i" value="${1}"/>
<c:forEach items="${products}" var="item">
    <tr>
        <th scope="row">${i}</th>
        <td>${item.ten}</td>
        <td>${item.storeOfProduct.ten}</td>
        <td>${item.types.size()}</td>
        <td id="bagde-status${item.id}">
            <c:if test="${item.status}"><span class="badge bg-success">Enable</span></c:if>
            <c:if test="${!item.status}"><span class="badge bg-danger">Disable</span></c:if>
            </td>
            <td class="row">
                <div class="col">
                    <button class="btn btn-primary btn-disable-product" for="${item.id}"><c:if test="${!item.status}">Enable</c:if><c:if test="${item.status}">Disable</c:if></button>
                </div>
                <div class="col">
                        <a href="${baseURL}/product/${item.id}" class="btn btn-primary" target="_blank">Detail</a>
            </div>
        </td>
    </tr>
    <c:set var="i" value="${i+1}"/>                 
</c:forEach>
<script>
    $(document).ready(function () {
        $('.btn-disable-product').click(function () {
            var btn = $(this);
            var id = $(this).attr('for');
            $.ajax({
                type: 'post',
                url: "http://localhost:8080/website/admin/product/status",
                dataType: 'html',
                data: {
                    id: id
                },
                success: function (response) {
                    if (btn.html() == "Enable") {
                        btn.html("Disable");
                        $('#bagde-status' + id).html('<span class="badge bg-success">Enable</span>');
                    } else {
                        btn.html("Enable");
                        $('#bagde-status' + id).html('<span class="badge bg-danger">Disable</span>');
                    }
                }
            });
        });
    });
</script>
