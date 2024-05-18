/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service;

import com.hodacnguyen.pojo.Tag;
import java.util.List;

/**
 *
 * @author CaNoc
 */
public interface TagService {
    public void add(Tag t);
    public List<Tag> list(int page, int offset);
    public void update(Tag t);
    public Tag getById(int id);
    public void delete(int id);
    public Tag addOrGet(Tag t);
}
