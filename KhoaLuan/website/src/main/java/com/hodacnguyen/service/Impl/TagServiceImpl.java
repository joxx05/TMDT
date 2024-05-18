/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service.Impl;

import com.hodacnguyen.pojo.Tag;
import com.hodacnguyen.repository.TagRepo;
import com.hodacnguyen.service.TagService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author CaNoc
 */
@Service
public class TagServiceImpl implements TagService{
    @Autowired
    private TagRepo tagRepo;
    @Override
    public void add(Tag t) {
        this.tagRepo.add(t);
    }

    @Override
    public List<Tag> list(int page, int offset) {
        return this.tagRepo.list(page, offset);
    }

    @Override
    public void update(Tag t) {
        this.tagRepo.update(t);
    }

    @Override
    public Tag getById(int id) {
        return this.tagRepo.getById(id);
    }

    @Override
    public void delete(int id) {
        this.tagRepo.delete(id);
    }

    @Override
    public Tag addOrGet(Tag t) {
        return this.tagRepo.addOrGet(t);
    }
    
}
