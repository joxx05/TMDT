/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.controllers.api;

import com.hodacnguyen.pojo.Bill;
import com.hodacnguyen.pojo.Product;
import com.hodacnguyen.pojo.Type;
import com.hodacnguyen.service.BillService;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ApiStatisticalController {
    @Autowired
    private BillService billService;
    @PostMapping("api/statistic/product")
    public ResponseEntity<List<Product>> listProducts(@RequestParam("idshop") int idshop,@RequestParam("mindate") String minDate, @RequestParam("maxdate") String maxDate,@RequestParam("type") int type) throws ParseException{
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date min = df.parse(minDate);
        Date max = df.parse(maxDate);
        List<Product> products=this.billService.statisticalProduct(idshop, min, max, type);
        return new ResponseEntity<>(products,HttpStatus.OK);
    }
    @PostMapping("api/statistic/type")
    public ResponseEntity<List<Type>> listType(@RequestParam("idshop") int idshop,@RequestParam("mindate") String minDate, @RequestParam("maxdate") String maxDate,@RequestParam("type") int type) throws ParseException{
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date min = df.parse(minDate);
        Date max = df.parse(maxDate);
        List<Type> types=this.billService.statisticalType(idshop, min, max, type);
        return new ResponseEntity<>(types,HttpStatus.OK);
    }
    @GetMapping("api/statis/bill")
    public ResponseEntity<List<Bill>> listBills(){
        List<Bill> products=this.billService.list( new Date(1695360000), new Date());
        return new ResponseEntity<>(products,HttpStatus.OK);
    }
}
