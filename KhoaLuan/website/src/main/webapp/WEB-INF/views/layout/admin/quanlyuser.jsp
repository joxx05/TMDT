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
        <div class="col-lg-8"><h3 style="text-align: center"><strong>User manager</strong></h3></div>
        <div class="col-lg-4">
            
                <button type="button" class="site-btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Manage
                </button>
                <jsp:include page="/WEB-INF/views/layout/admin/menuadmin.jsp" />
                
            
        </div>
    </div>
    <hr>
</div>

<div class="container" style="margin-top: 5px">
    <div class="row">
        <input class="form-control" type="hidden" id="id-shop" value="${store.id}">
        <div class="col-lg-6">
            <div class="form-floating mb-3">
                <input type="email" class="form-control" id="inputsearchuser" placeholder="name@example.com">
                <label for="inputsearchuser">Search user for email:</label>
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
                        <th scope="col">Account</th>
                        <th scope="col">Name</th>
                        <th scope="col">Status</th>
                        <th scope="col" style="text-align: center">Control</th>
                    </tr>
                </thead>
                <tbody id="content-quanly-user">
                    <c:set var="i" value="${1}"/>
                    <c:forEach items="${users}" var="item">
                        <c:if test="${item.email!=pageContext.request.userPrincipal.name}">
                            <tr>
                                <th scope="row">${i}</th>
                                <td>${item.email}</td>
                                <td>${item.ho} ${item.ten}</td>
                                <td id="bagde-status${item.id}">
                                    <c:if test="${item.status}"><span class="badge bg-success">Enable</span></c:if>
                                    <c:if test="${!item.status}"><span class="badge bg-danger">Disable</span></c:if>
                                    </td>
                                    <td class="row">
                                        <div class="col">
                                            <div class="form-check">
                                                <input class="form-check-input check-admin" for="${item.id}" type="checkbox" value="" id="flexCheckDefault" <c:forEach items="${item.role}" var="role"><c:if test="${role.ten=='Admin'}">checked</c:if></c:forEach>>
                                                    <label class="form-check-label" for="flexCheckDefault">
                                                        Admin
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <button class="btn btn-primary btn-disable-user" for="${item.id}"><c:if test="${!item.status}">Enable</c:if><c:if test="${item.status}">Disable</c:if></button>
                                        </div>
                                    </td>
                                </tr>
                            <c:set var="i" value="${i+1}"/>
                        </c:if>

                    </c:forEach>
                </tbody>
            </table>

        </div>
    </div>

</section>
