<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<script>
    $(document).ready(function(){
       $('.btn-disable-user').click(function(){
            var btn=$(this);
            var id=$(this).attr('for');
            $.ajax({
                type: 'post',
                url:"http://localhost:8080/website/admin/user/status",
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
        $('.check-admin').change(function (){
            var checkbox=$(this);
            var id=$(this).attr('for');
            $.ajax({
                type: 'post',
                url:"http://localhost:8080/website/admin/user/setadmin",
                dataType: 'html',
                data:{
                    id:id
                },
                success: function (response) {
                    alert("Success!");
                }
            });
        });
    });
</script>
