
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
<section class="breadcrumb-section set-bg" data-setbg="<c:url value='/resource/image/baner/bannerbill.jpg'/>" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
    <div class="container" >
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Đơn hàng của bạn</font></font></h2>
                    
                </div>
            </div>
        </div>
    </div>
</section>
<section>
    <div class="container" style="margin-top: 30px;margin-bottom: 10px">
        <div class="list-group">
            <c:forEach items="${bills}" var="item">
                <a href="${baseURL}/bill/detail/${item.id}" class="list-group-item tag1">
                    <div class="row">
                        <div class="col-4">Mã đơn hàng: ${item.id}</div>
                        <div class="col-4">Thời gian: ${item.date}</div>
                        <div class="col-4">Trạng thái: 
                            <c:if test="${item.is_pay}"><span class="badge badge-success">Đã thanh toán</span></c:if>
                            <c:if test="${!item.is_pay}"><span class="badge badge-secondary">Chưa thanh toán</span></c:if>
                        </div>
                     </div>
                </a>
                
            </c:forEach>
        </div>
    </div>
    
</section>
