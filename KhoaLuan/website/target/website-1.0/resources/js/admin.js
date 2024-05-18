$(document).ready(function () {
    $('#inputsearchuser').keyup(function(){
        var key=$(this).val();
        $.ajax({
            type: 'post',
            url:"http://localhost:8080/website/admin/user/search",
            dataType: 'html',
            data:{
                key:key
            },
            success: function (response) {
                $('#content-quanly-user').html(response);
            }
        });
    });
    $('#inputsearchproduct').keyup(function(){
        var key=$(this).val();
        $.ajax({
            type: 'post',
            url:"http://localhost:8080/website/admin/product/search",
            dataType: 'html',
            data:{
                key:key
            },
            success: function (response) {
                $('#content-quanly-product').html(response);
            }
        });
    });
    $('#inputsearchstore').keyup(function(){
        var key=$(this).val();
        $.ajax({
            type: 'post',
            url:"http://localhost:8080/website/admin/store/search",
            dataType: 'html',
            data:{
                key:key
            },
            success: function (response) {
                $('#content-quanly-store').html(response);
            }
        });
    });
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
    $('.btn-disable-product').click(function(){
        var btn=$(this);
        var id=$(this).attr('for');
        $.ajax({
            type: 'post',
            url:"http://localhost:8080/website/admin/product/status",
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
