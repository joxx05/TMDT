 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author CaNoc
 */
@Entity
@Table(name = "type")
public class Type implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @ManyToOne
    @JoinColumn(name = "id_product")
    private Product product;
    
    private String ten;
    private String mota;
    private int price;
    private String ghichu;
    
    //cac gia tri de thong ke ko nam trong data 
    @Transient
    private String groupBy;
    @Transient
    private int doanhThu;
    //
    
    @JsonIgnore
    @OneToMany(mappedBy = "type")
    private Set<CartType> cartTypes;
    @JsonIgnore
    @OneToMany(mappedBy = "type")
    private Set<BillType> billTypes;
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the product
     */
    public Product getProduct() {
        return product;
    }

    /**
     * @param product the product to set
     */
    public void setProduct(Product product) {
        this.product = product;
    }

    /**
     * @return the ten
     */
    public String getTen() {
        return ten;
    }

    /**
     * @param ten the ten to set
     */
    public void setTen(String ten) {
        this.ten = ten;
    }

    /**
     * @return the mota
     */
    public String getMota() {
        return mota;
    }

    /**
     * @param mota the mota to set
     */
    public void setMota(String mota) {
        this.mota = mota;
    }

    /**
     * @return the price
     */
    public int getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(int price) {
        this.price = price;
    }

    /**
     * @return the ghichu
     */
    public String getGhichu() {
        return ghichu;
    }

    /**
     * @param ghichu the ghichu to set
     */
    public void setGhichu(String ghichu) {
        this.ghichu = ghichu;
    }

    /**
     * @return the cartTypes
     */
    public Set<CartType> getCartTypes() {
        return cartTypes;
    }

    /**
     * @param cartTypes the cartTypes to set
     */
    public void setCartTypes(Set<CartType> cartTypes) {
        this.cartTypes = cartTypes;
    }


    /**
     * @return the billTypes
     */
    public Set<BillType> getBillTypes() {
        return billTypes;
    }

    /**
     * @param billTypes the billTypes to set
     */
    public void setBillTypes(Set<BillType> billTypes) {
        this.billTypes = billTypes;
    }

    /**
     * @return the groupBy
     */
    public String getGroupBy() {
        return groupBy;
    }

    /**
     * @param groupBy the groupBy to set
     */
    public void setGroupBy(String groupBy) {
        this.groupBy = groupBy;
    }

    /**
     * @return the doanhThu
     */
    public int getDoanhThu() {
        return doanhThu;
    }

    /**
     * @param doanhThu the doanhThu to set
     */
    public void setDoanhThu(int doanhThu) {
        this.doanhThu = doanhThu;
    }
}
