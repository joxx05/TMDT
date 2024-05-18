/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service.Impl;

import com.hodacnguyen.pojo.Role;
import com.hodacnguyen.repository.RoleRepo;
import com.hodacnguyen.service.RoleService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author CaNoc
 */
@Service
public class RoleServiceImpl implements RoleService{
    @Autowired
    private RoleRepo roleRepo; 
    @Override
    public void add(Role t) {
        this.roleRepo.add(t);
    }

    @Override
    public List<Role> list() {
        return this.roleRepo.list();
    }

    @Override
    public void update(Role t) {
        this.roleRepo.update(t);
    }

    @Override
    public Role getById(int id) {
        return this.roleRepo.getById(id);
    }

    @Override
    public void delete(int id) {
        this.roleRepo.delete(id);
    }
    @Override
    public Role getByTen(String Role){
        return this.roleRepo.getByTen(Role);
    }
}
