<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<section class="breadcrumb-section set-bg" data-setbg="<c:url value='/resource/image/baner/bannermyshop.jpg'/>" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Administrator</h2>
                </div>
            </div>
        </div>
    </div>
</section>
                
<div class="container" style="margin-top:20px;margin-bottom: 20px">
    <div class="row">
        <div class="col-lg-8"><h3 style="text-align: center"><strong>Store manager</strong></h3></div>
        <div class="col-lg-4">
            <div class="btn-group">
                <button type="button" class="site-btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Manage
                </button>
                <jsp:include page="/WEB-INF/views/layout/admin/menuadmin.jsp" />
                
             </div>
        </div>
    </div>
    <hr>
</div>

<div class="container" style="margin-top: 5px">
        <div class="row">
            <input class="form-control" type="hidden" id="id-shop" value="">
            <div class="col-lg-6">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="inputsearchstore">
                    <label for="inputsearchstore">Search store:</label>
                </div>
            </div>
            <div class="col-lg-3">
                
            </div>
            <div class="col-lg-3">
                
            </div>
        </div>
    </div>
<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <table class="table">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Store</th>
                    <th scope="col">Owner</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Address</th>
                    <th scope="col">Status</th>
                    <th scope="col">Control</th>
                  </tr>
                </thead>
                <tbody id="content-quanly-store">
                    <c:set var="i" value="${1}"/>
                    <c:forEach items="${stores}" var="item">  
                            <tr>
                                <th scope="row">${i}</th>
                                <td>${item.ten}</td>
                                <td>${item.user.email}</td>
                                <td>${item.phone}</td>
                                <td>${item.address}</td>
                                <td id="bagde-status${item.id}">
                                    <c:if test="${item.status}"><span class="badge bg-success">Enable</span></c:if>
                                    <c:if test="${!item.status}"><span class="badge bg-danger">Disable</span></c:if>
                                </td>
                                <td>
                                    <button class="btn btn-primary btn-disable-store" for="${item.id}"><c:if test="${!item.status}">Enable</c:if><c:if test="${item.status}">Disable</c:if></button>
                                </td>
                            </tr>
                            <c:set var="i" value="${i+1}"/>      
                    </c:forEach>
                </tbody>
            </table>
            
        </div>
    </div>
    
</section>
