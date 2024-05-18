/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/Gruntfile.js to edit this template
 */
var flag = false;
$(document).ready(function (){
    $.ajaxSetup({cache:false});
    
    $('#view-chat').hide();
    $('#btn-close-chat').click(function (){
        $('#view-chat').hide(800);
    });
    $('#chat-start').click(function (){
        _outcoming=$('#id-email').val();
        loadhistory();
        $('#view-chat').show(1000);
        setImageOutcoming(_outcoming);
        $('#name-outcoming').html(_outcoming);
        console.log(_outcoming);
        /*$.ajax({
            type: 'POST',
            url:"http://localhost:8080/website/api/mess/getstatus",
            data:{
                idstore:idstore
            },
            dataType: 'json',
            success: function (response) {
                _incoming=response['incoming'];
                _outcoming=response['outcoming'];
                //loadstart();
            }
        });*/
    });
});
function loadhistory(){
    $('#list-content-chat').html("");
    $.ajax({
        type: 'GET',
        url:"http://localhost:8080/website/api/mess/"+_incoming+"/"+_outcoming,
        dataType: 'json',
        success: function (response) {
            
            for (var i=0;i< response.length;i++) {
                if(response[i]['incoming']==idCurrentUser){
                    $('#list-content-chat').append('<div class="chat1"><p class="incoming">'+response[i]['content']+'</p></div>');
                }else{
                    $('#list-content-chat').append('<div class="chat"><p class="outcoming">'+response[i]['content']+'</p></div>');
                    
                }
            }
            setImageOutcoming(_outcoming);
            
            $('#view-chat').show(1000);
        }
    });
}

function setImageOutcoming(email){
    $.ajax({
            type: 'GET',
            url:"http://localhost:8080/website/api/user/byemail/"+email,
            dataType: 'json',
            success: function (response) {
                $('#img-outcoming').attr('src','/website/resource/image/user/'+response['image']);
            }
        });
}