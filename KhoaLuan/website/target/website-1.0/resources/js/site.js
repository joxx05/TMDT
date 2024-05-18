var sl=1;
$(document).ready(function () {
    setTimeout(function(){
        $(".alert").hide(600);
    }, 5000);
    
    var i = 1;
    $('#btn-add-type').click(function (e) { 
        i++;
        sl++;
        $('#form-append>div').append('<div class="type'+i+'"><input type="button" class="site-btn btn-del-type" onclick="deltype('+i+')" value="X"/><div class="form-group"><div class="checkout__input"><p>Tên loại:<span>*</span></p><input type="text" name="nametype[]"/></div><div class="checkout__input"><p>Mô tả:<span>*</span></p><input type="text" name="motatype[]"/></div><div class="checkout__input"><p>Giá:<span>*</span></p><input type="text" name="price[]"/></div><div class="checkout__input"><p>Ghi chú:<span>*</span></p><input type="text" name="ghichutype[]"/></div></div><hr></div>');
        $('.type'+i).hide();
        $('.type'+i).show(1000);
    });
    $('#boxsearch-inshop').keyup(function (e) { 
        var keysearch=removeAccents($(this).val().trim().toLocaleLowerCase());
        var url=$('#url-search-in-shop').val();
        var idshop=$('#id-shop').val();
       
        $.ajax({
            type: "POST",
            url: url,
            dataType: 'html',
            data: {
                keysearch:keysearch,
                idshop:idshop
            },
            success: function(response) {
                $('.shoping__cart__table').html(response);
            }
        });
    });
    $('#result-search').hide();
    $('#boxsearch').keyup(function (e) { 
        var keysearch=removeAccents($(this).val().trim().toLocaleLowerCase());
        if(keysearch===null||keysearch===""){
            $('#result-search').hide(1000);
            return;
        }
        var url=$('#url-search').val();
        $.ajax({
            type: "POST",
            url: url,
            dataType: 'html',
            data: {
                keysearch:keysearch
            },
            success: function(response) {
                $('#result-search>div').html(response);
                $('#result-search').show(1000);
            }
        });
    });
    $('#boxsearch').focusout(function(){
        $('#result-search').hide(1000);
    });
    $('.addcart').click(function (){
        var idtype=$(this).attr('id');
        var url=$('#url-addcart').val();
        $.ajax({
            type: "POST",
            url: url,
            dataType: 'text',
            data: {
                idtype:idtype,
                soluong:1
            },
            success: function(response) {
                if(response==1||response=='1'){
                    alert('Thêm sản phẩm vào giỏ hàng thành công!');
                }else{
                    alert('Bạn phải đăng nhập trước!');
                }
                
            }
        });
    });
    $('.add-cart').click(function (){
        var idtype=$(this).attr('id');
        var url=$('#url-addcart').val();
        var soluong=$('.qty-'+idtype).val();
        $.ajax({
            type: "POST",
            url: url,
            dataType: 'text',
            data: {
                idtype:idtype,
                soluong:soluong
            },
            success: function(response) {
                if(response==1||response=='1'){
                    alert('Thêm sản phẩm vào giỏ hàng thành công!');
                }else{
                    alert('Bạn phải đăng nhập trước!');
                }
                
            }
        });
    });
    $('.qty').keyup(function(){
        var url=$('#url-updatecart').val();
        var idcarttype=$(this).attr('id');
        var soluong = $(this).val();
        if(soluong<1){
            $(this).val(1);
            soluong=1;
        }
        $.ajax({
            type: "POST",
            url: url,
            dataType: 'text',
            data: {
                idcarttype:idcarttype,
                soluong:soluong
            },
            success: function(response) {
                var arr= response.split('|');
                $('#tong'+idcarttype).html(format(arr[0],'VND'));
                $('#tonggia').html(format(arr[1],'VND'));
            }
        });
    });
    $('.qtycart').click(function (){
        var url=$('#url-updatecart').val();
        var idcarttype=$(this).attr('id');
        var select='.div'+idcarttype+'>input';
        var soluong =$(select).val();
        if(soluong<1){
            $(select).val(1);
            soluong=1;
        }
        $.ajax({
            type: "POST",
            url: url,
            dataType: 'text',
            data: {
                idcarttype:idcarttype,
                soluong:soluong
            },
            success: function(response) {
                var arr= response.split('|');
                $('#tong'+idcarttype).html(format(arr[0],'VND'));
                $('#tonggia').html(format(arr[1],'VND'));
            }
        });
        
    });
});
function removeAccents(str) {
  return str.normalize('NFD')
            .replace(/[\u0300-\u036f]/g, '')
            .replace(/đ/g, 'd').replace(/Đ/g, 'D');
}
function deltype(c){
    sl--;
    $('.type'+c).remove();
}
function format(n, currency) {
    const VND = new Intl.NumberFormat('vi-VN', {style: 'currency',currency: 'VND'});
    n=parseInt(n);
   
  return  VND.format(n);
}