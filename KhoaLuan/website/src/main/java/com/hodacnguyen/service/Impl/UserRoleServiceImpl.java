/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service.Impl;

import com.hodacnguyen.pojo.UserRole;
import com.hodacnguyen.repository.UserRoleRepo;
import com.hodacnguyen.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserRoleServiceImpl implements UserRoleService{
    @Autowired
    private UserRoleRepo userRoleRepo;
    @Override
    public void add(UserRole t) {
        this.userRoleRepo.add(t);
    }

    @Override
    public void delete(int iduser, int idrole) {
        this.userRoleRepo.delete(iduser, idrole);
    }
    
}
