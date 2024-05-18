
/* global google */

google.charts.load('current', {'packages':['corechart']});
//google.charts.setOnLoadCallback(drawChart);
google.charts.load('current', {'packages':['table']});
//google.charts.setOnLoadCallback(drawTable);
$(document).ready(function () {
    $('#statistic-product').click(function (){
        var idshop= $('#id-shop').val();
        var minDate=$('#mindate-statistic-product').val().toString();
        var maxDate=$('#maxdate-statistic-product').val().toString();
        var type=$('#type-statis').val();
        $.ajax({
            type: 'post',
            url:"http://localhost:8080/website/api/statistic/product",
            dataType: 'json',
            data:{
                idshop:idshop,
                mindate:minDate,
                maxdate:maxDate,
                type:type
            },
            success: function (response) {
                $('.nodata').hide(500);
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Tên sản phẩm');
                data.addColumn('number', 'Doanh thu');
                data.addColumn('string', 'Thống kê theo');
                var type = $('#type-statis').val();
                var groupname="";
                if(type == 0){
                    groupname="Tháng";
                }
                if(type == 2){
                    groupname="Quý";
                }
                if(type == 1){
                    groupname="Năm";
                }
                var arr = [[groupname, "Doanh thu"]];
                for(var i=0;i<response.length;i++){
                    var doanhthu = response[i]["doanhThu"];
                    var group =response[i]["groupBy"];
                    data.addRow([response[i]["ten"],doanhthu,group]);
                    var flag=true;
                    for(var j=0;j<arr.length;j++){
                        if(arr[j][0]==group){
                            arr[j][1]+=doanhthu;
                            flag=false;
                            break;
                        }
                    }
                    if(flag){
                        arr.push([response[i]["groupBy"],response[i]["doanhThu"]]);
                    }
                    
                    
                }
                
                google.charts.setOnLoadCallback(drawChart(data));  
                google.charts.setOnLoadCallback(drawTable(data));
                google.charts.setOnLoadCallback(drawColChart(arr,groupname));
                arr.shift();
                $('#table-content').html("Thống kê doanh thu theo "+groupname );
                google.charts.setOnLoadCallback(drawTableDoanhThu(arr));
            }
        });
    });
    $('#statistic-type').click(function (){
        var idshop= $('#id-shop').val();
        var minDate=$('#mindate-statistic-product').val().toString();
        var maxDate=$('#maxdate-statistic-product').val().toString();
        var type=$('#type-statis').val();
        $.ajax({
            type: 'post',
            url:"http://localhost:8080/website/api/statistic/type",
            dataType: 'json',
            data:{
                idshop:idshop,
                mindate:minDate,
                maxdate:maxDate,
                type:type
            },
            success: function (response) {
                $('.nodata').hide(500);
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Tên sản phẩm');
                data.addColumn('string', 'Loại sản phẩm');
                data.addColumn('string', 'Thống kê theo');
                data.addColumn('number', 'Doanh thu');
                var datapie = new google.visualization.DataTable();
                datapie.addColumn('string', 'Tên loại sản phẩm');
                datapie.addColumn('number', 'Doanh thu');
                var type = $('#type-statis').val();
                var groupname="";
                if(type == 0){
                    groupname="Tháng";
                }
                if(type == 2){
                    groupname="Quý";
                }
                if(type == 1){
                    groupname="Năm";
                }
                var arr = [[groupname, "Doanh thu"]];
                for(var i=0;i<response.length;i++){
                    var tensp =response[i]["product"]["ten"];
                    var tenloai =response[i].ten;
                    var doanhthu = response[i]["doanhThu"];
                    var group =response[i]["groupBy"];
                    data.addRow([tensp,tenloai,group,doanhthu]);
                    datapie.addRow([tensp+" - "+tenloai,doanhthu]);
                    
                    var flag=true;
                    for(var j=0;j<arr.length;j++){
                        if(arr[j][0]==group){
                            arr[j][1]+=doanhthu;
                            flag=false;
                            break;
                        }
                    }
                    if(flag){
                        arr.push([response[i]["groupBy"],response[i]["doanhThu"]]);
                    }
                    
                    
                }
                
                google.charts.setOnLoadCallback(drawChart(datapie));  
                google.charts.setOnLoadCallback(drawTable(data));
                google.charts.setOnLoadCallback(drawColChart(arr,groupname));
                arr.shift();
                $('#table-content').html("Thống kê doanh thu theo "+groupname );
                google.charts.setOnLoadCallback(drawTableDoanhThu(arr));
            }
        });
    });
});
function drawColChart(arr,name) {
      var data = google.visualization.arrayToDataTable(arr);

      var options = {
        title: "Thống kê doanh thu theo "+name,
        width: 600,
        height: 400,
        bar: {groupWidth: "95%"},
        legend: { position: "none" }
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(data, options);
  }
function drawChart(data) {

    // Set chart options
    var options = {'title':'Biểu đồ tròn thống kê',
                   'width':600,
                   'height':500};

    // Instantiate and draw our chart, passing in some options.
    var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
    chart.draw(data, options);
}


 function drawTable(data) {
//    var data = new google.visualization.DataTable();
//    data.addColumn('string', 'Name');
//    data.addColumn('number', 'Salary');
//    data.addColumn('boolean', 'Full Time Employee');
//    data.addRows([
//        ['Mike',  {v: 10000, f: '$10,000'}, true],
//        ['Jim',   {v:8000,   f: '$8,000'},  false],
//        ['Alice', {v: 12500, f: '$12,500'}, true],
//        ['Bob',   {v: 7000,  f: '$7,000'},  true]
//    ]);
    var table = new google.visualization.Table(document.getElementById('table_div'));

    table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
 }
 function drawTableDoanhThu(arr) {
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Name');
    data.addColumn('number', 'Doanh thu');
    data.addRows(arr);
    var table = new google.visualization.Table(document.getElementById('table_divdt'));

    table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
 }
