
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<table>
    <thead>
        <tr>
            <th class="shoping__product">Sản phẩm</th>
            <th>Số lượng</th>
            <th>Control</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${products}" var="product">
            <tr>
                <td class="shoping__cart__item">
                    <img src="img/cart/cart-1.jpg" alt="">
                    <h5>${product.ten}</h5>
                </td>
                <td class="shoping__cart__quantity">
                    <div class="quantity">
                        <div class="pro-qty">
                            <input type="text" value="${product.soluong}">
                        </div>
                    </div>
                </td>
                <td>
                    <a href="<c:url value="/myshop/detail/${idstore}/product/${product.id}"/>" class="primary-btn">EDIT</a>
                </td>
            </tr>
        </c:forEach>

    </tbody>
</table>
