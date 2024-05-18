/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service;

import com.hodacnguyen.pojo.UserRole;

/**
 *
 * @author cumy1
 */
public interface UserRoleService {
    public void add(UserRole t);
    public void delete(int iduser, int idrole);
}
