
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
<section class="breadcrumb-section set-bg" data-setbg="<c:url value='/resource/image/baner/bannerbill.jpg'/>" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
    <div class="container" >
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Thông tin đơn hàng</font></font></h2>
                    
                </div>
            </div>
        </div>
    </div>
</section>
<section>
    <div class="container" style="margin-top: 30px;margin-bottom: 20px">
        <div class="card">
            <div class="card-header">
                Ngày tạo đơn hàng:
                <strong>${bill.date}</strong> 
                <span class="float-right"> <strong>Trạng thái:</strong>
                    <c:if test="${bill.is_pay==true}"><span class="badge badge-success">Đã thanh toán</span></c:if>
                    <c:if test="${bill.is_pay==false}"><span class="badge badge-secondary">Chưa thanh toán</span></c:if>
                </span>

            </div>
            <div class="card-body">
                <div class="row mb-4">
                    <div class="col-sm-6">
                        <div>
                            <strong>Mã đơn: ${bill.id}</strong>
                        </div>
                        <div>
                            <strong>Mã thanh toán: <c:if test="${bill.code_pay==null}">Chưa có</c:if>${bill.code_pay}</strong>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <h6 class="mb-3">Thông tin người nhận:</h6>
                        <div>
                            <strong>${bill.user.ho} ${bill.user.ten}</strong>
                        </div>
                        <div>Địa chỉ: ${bill.user.address}</div>
                        <div>Email: ${bill.user.email}</div>
                        <div>Phone: ${bill.user.phone}</div>
                    </div>



                </div>

                <div class="table-responsive-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th class="center">#</th>
                                <th>Sản phẩm</th>
                                <th>Loại</th>

                                <th class="right">Giá</th>
                                <th class="center">Số lượng</th>
                                <th class="right">Tổng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="tongcong" value="${0}" />
                            <c:set var="i" value="${1}" />
                            <c:forEach items="${bill.billTypes}" var="item">
                                <tr>
                                <td class="center">${i}</td>
                                <td class="left strong">${item.type.product.ten}</td>
                                <td class="left">${item.type.ten}</td>
                                <td class="right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.type.price}" /> ₫</td>
                                <td class="center">${item.soluong}</td>
                                <c:set var="tong" value="${item.soluong*item.type.price}" />
                                <c:set var="tongcong" value="${tongcong+tong}"/>
                                <td class="right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${tong}" /> ₫</td>
                                <c:if test="${bill.is_pay==true&&item.isreview==false}"><td class="right"><a href="${baseURL}/product/review/${item.id}" class="site-btn">Đánh giá</a></td></c:if>
                            </tr>
                            <c:set var="i" value="${i+1}" />
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-sm-5">
                        <c:if test="${bill.is_pay==false}"><a href="${baseURL}/bill/detail/pay/${bill.id}" class="site-btn">Thanh toán</a></c:if>
                        
                    </div>

                    <div class="col-lg-4 col-sm-5 ml-auto">
                        <table class="table table-clear">
                            <tbody>
                                <tr>
                                    <td class="left">
                                        <strong>Subtotal</strong>
                                    </td>
                                    <td class="right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${tongcong}" /> ₫</td>
                                </tr>
                                
                            </tbody>
                        </table>

                    </div>

                </div>

            </div>
        </div>
    </div>
</section>
