/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author CaNoc
 */
@Entity
@Table(name = "bill")
public class Bill implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JoinColumn(name = "id_user")
    private User user;
    private String code_pay;
    private Boolean is_pay;
    private Date date;
    @JsonIgnore
    @ManyToMany
    @JoinTable(
            name = "pro_bill",
            joinColumns = {
                @JoinColumn(name="id_bill")
            },
            inverseJoinColumns = {
                @JoinColumn(name="id_promotion")
            }
    )
    private Set<Promotion> promotions;
    
    @JsonIgnore
    @OneToMany(mappedBy = "bill")
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
     * @return the user
     */
    public User getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(User user) {
        this.user = user;
    }

    /**
     * @return the code_pay
     */
    public String getCode_pay() {
        return code_pay;
    }

    /**
     * @param code_pay the code_pay to set
     */
    public void setCode_pay(String code_pay) {
        this.code_pay = code_pay;
    }


    /**
     * @return the is_pay
     */
    public Boolean getIs_pay() {
        return is_pay;
    }

    /**
     * @param is_pay the is_pay to set
     */
    public void setIs_pay(Boolean is_pay) {
        this.is_pay = is_pay;
    }

    /**
     * @return the promotions
     */
    public Set<Promotion> getPromotions() {
        return promotions;
    }

    /**
     * @param promotions the promotions to set
     */
    public void setPromotions(Set<Promotion> promotions) {
        this.promotions = promotions;
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
     * @return the date
     */
    public Date getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(Date date) {
        this.date = date;
    }
}
