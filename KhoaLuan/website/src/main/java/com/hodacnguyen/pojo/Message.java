/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "message")
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private int incoming;
    private int outcoming;
    private String content;
    @JsonIgnore
    private Boolean is_load;

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
     * @return the incoming
     */
    public int getIncoming() {
        return incoming;
    }

    /**
     * @param incoming the incoming to set
     */
    public void setIncoming(int incoming) {
        this.incoming = incoming;
    }

    /**
     * @return the outcoming
     */
    public int getOutcoming() {
        return outcoming;
    }

    /**
     * @param outcoming the outcoming to set
     */
    public void setOutcoming(int outcoming) {
        this.outcoming = outcoming;
    }

    /**
     * @return the content
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content the content to set
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * @return the is_load
     */
    public Boolean getIs_load() {
        return is_load;
    }

    /**
     * @param is_load the is_load to set
     */
    public void setIs_load(Boolean is_load) {
        this.is_load = is_load;
    }
}
