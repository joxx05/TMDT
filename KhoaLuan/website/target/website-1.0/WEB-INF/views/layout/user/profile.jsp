<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
<section class="breadcrumb-section set-bg" data-setbg="<c:url value='/resource/image/baner/profilebanner.jpg'/>" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
    <div class="container" >
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Thông tin user</font></font></h2>
                    
                </div>
            </div>
        </div>
    </div>
</section>
<section>
        <div class="container emp-profile shadow p-3 mb-5 bg-body rounded">
        <div>
            <div class="row">
                <div class="col-md-4">
                    <div class="profile-img">
                        <img src="<c:url value='/resource/image/user/'/>${user.image}" alt=""/> 
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="profile-head">
                        <h5>
                            Quyền hạn
                        </h5>
                        <h6>
                            <c:forEach items="${user.role}" var="item">
                                <span class="badge badge-primary">${item.ten}</span>
                            </c:forEach>
                        </h6>
                        <p class="proile-rating">SỐ CỬA HÀNG ĐANG HOẠT ĐỘNG : <span>${user.stores.size()}</span></p>
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Thông tin cá nhân</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Giới thiệu</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2">
                    <a href="${baseURL}/profile/edit" class="btn btn-primary">Edit Profile</a>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">

                </div>
                <div class="col-md-8">
                    <div class="tab-content profile-tab" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Tên: </label>
                                </div>
                                <div class="col-md-6">
                                    <p>${user.ten}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Họ:</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${user.ho}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Email</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${user.email}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Phone</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${user.phone}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Address:</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${user.address}</p>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <div>
                                <label>Giới thiệu</label>
                            </div>
                            <div>
                                <p>${user.gioithieu}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>           
    </div>
</section>
<section>
    <div class="container emp-profile shadow p-3 mb-5 bg-body rounded">
        <h4><strong>Change password</strong></h4>
        <c:url value="${baseURL}/profile" var="action" />
        <form action="${action}" method="post" enctype="multipart/form-data" acceptCharset="UTF-8">
            <div class="mb-3">
              <label for="exampleInputPassword1" class="form-label">Mật khẩu:</label>
              <input type="password" class="form-control" name="newpass">
            </div>
            <div class="mb-3">
              <label for="exampleInputPassword1" class="form-label">Nhập lại mật khẩu:</label>
              <input type="password" class="form-control" name="newpass2">
            </div>
            <button type="submit" class="btn btn-primary">Thay đổi</button>
        </form>
    </div>
</section>
<style>
    .emp-profile{
    padding: 3%;
    margin-top: 3%;
    margin-bottom: 3%;
    border-radius: 0.5rem;
    background: #fff;
}
.profile-img{
    text-align: center;
}
.profile-img img{
    width: 70%;
    height: 100%;
}
.profile-img .file {
    position: relative;
    overflow: hidden;
    margin-top: -20%;
    width: 70%;
    border: none;
    border-radius: 0;
    font-size: 15px;
    background: #212529b8;
}
.profile-img .file input {
    position: absolute;
    opacity: 0;
    right: 0;
    top: 0;
}
.profile-head h5{
    color: #333;
}
.profile-head h6{
    color: #0062cc;
}
.profile-edit-btn{
    border: none;
    border-radius: 1.5rem;
    width: 70%;
    padding: 2%;
    font-weight: 600;
    color: #6c757d;
    cursor: pointer;
}
.proile-rating{
    font-size: 12px;
    color: #818182;
    margin-top: 5%;
}
.proile-rating span{
    color: #495057;
    font-size: 15px;
    font-weight: 600;
}
.profile-head .nav-tabs{
    margin-bottom:5%;
}
.profile-head .nav-tabs .nav-link{
    font-weight:600;
    border: none;
}
.profile-head .nav-tabs .nav-link.active{
    border: none;
    border-bottom:2px solid #0062cc;
}
.profile-work{
    padding: 14%;
    margin-top: -15%;
}
.profile-work p{
    font-size: 12px;
    color: #818182;
    font-weight: 600;
    margin-top: 10%;
}
.profile-work a{
    text-decoration: none;
    color: #495057;
    font-weight: 600;
    font-size: 14px;
}
.profile-work ul{
    list-style: none;
}
.profile-tab label{
    font-weight: 600;
}
.profile-tab p{
    font-weight: 600;
    color: #0062cc;
}
</style>
