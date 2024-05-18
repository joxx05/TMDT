<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
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
<script>
    $(document).ready(function (){
        $('.btn-disable-store').click(function(){
            var btn=$(this);
            var id=$(this).attr('for');
            $.ajax({
                type: 'post',
                url:"http://localhost:8080/website/admin/store/status",
                dataType: 'html',
                data:{
                    id:id
                },
                success: function (response) {
                    if(btn.html()=="Enable"){
                        btn.html("Disable");
                        $('#bagde-status'+id).html('<span class="badge bg-success">Enable</span>');
                    }else{
                        btn.html("Enable");
                        $('#bagde-status'+id).html('<span class="badge bg-danger">Disable</span>');
                    }
                }
            }); 
        });
    });
</script>