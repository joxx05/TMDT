<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
<ul class="list-group">
    <c:forEach items="${products}" var="product">
            
        <li class="list-group link2">
            <a href="${baseURL}/product/${product.id}">
                ${product.ten}
            </a>
        </li>
    </c:forEach>
</ul>
