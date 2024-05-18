/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

/**
 *
 * @author CaNoc
 */
@Entity
@Table(name="product")
public class Product implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @NotNull(message = "Không được bỏ trống!")
    private String ten;
    @NotNull(message = "Không được bỏ trống!")
    private String mota;
    private String ghichu;
    @NotNull(message = "Không được bỏ trống!")
    private String soluong;
    private int view;
    private double rating;
    private boolean status;
    //cac gia tri de thong ke ko nam trong data 
    @Transient
    private String groupBy;
    @Transient
    private int doanhThu;
    //
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="id_store")
    private Store storeOfProduct;
    @JsonIgnore
    @OneToMany(mappedBy = "product",fetch = FetchType.LAZY)
    private Set<Review> reviews;
    @JsonIgnore
    @OneToMany(mappedBy = "product",fetch = FetchType.LAZY)
    private Set<Type> types;
    @OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
    private Set<ImgProduct> imgProducts;
    @JsonIgnore
    @ManyToMany(mappedBy = "products",fetch = FetchType.LAZY)
    private Set<Tag> tags;
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
     * @return the reviews
     */
    public Set<Review> getReviews() {
        return reviews;
    }

    /**
     * @param reviews the reviews to set
     */
    public void setReviews(Set<Review> reviews) {
        this.reviews = reviews;
    }

    /**
     * @return the types
     */
    public Set<Type> getTypes() {
        return types;
    }

    /**
     * @param types the types to set
     */
    public void setTypes(Set<Type> types) {
        this.types = types;
    }

    /**
     * @return the tags
     */
    public Set<Tag> getTags() {
        return tags;
    }

    /**
     * @param tags the tags to set
     */
    public void setTags(Set<Tag> tags) {
        this.tags = tags;
    }

    /**
     * @return the soluong
     */
    public String getSoluong() {
        return soluong;
    }

    /**
     * @param soluong the soluong to set
     */
    public void setSoluong(String soluong) {
        this.soluong = soluong;
    }

    /**
     * @return the imgProducts
     */
    public Set<ImgProduct> getImgProducts() {
        return imgProducts;
    }

    /**
     * @param imgProducts the imgProducts to set
     */
    public void setImgProducts(Set<ImgProduct> imgProducts) {
        this.imgProducts = imgProducts;
    }

    /**
     * @return the storeOfProduct
     */
    public Store getStoreOfProduct() {
        return storeOfProduct;
    }

    /**
     * @param storeOfProduct the storeOfProduct to set
     */
    public void setStoreOfProduct(Store storeOfProduct) {
        this.storeOfProduct = storeOfProduct;
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
     * @return the view
     */
    public int getView() {
        return view;
    }

    /**
     * @param view the view to set
     */
    public void setView(int view) {
        this.view = view;
    }

    /**
     * @return the rating
     */
    public double getRating() {
        return rating;
    }

    /**
     * @param rating the rating to set
     */
    public void setRating(double rating) {
        this.rating = rating;
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

    /**
     * @return the status
     */
    public boolean isStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(boolean status) {
        this.status = status;
    }

    

}
