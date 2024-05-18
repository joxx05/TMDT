/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.repository;

import com.hodacnguyen.pojo.Role;
import java.util.List;

/**
 *
 * @author CaNoc
 */
public interface RoleRepo {
    public void add(Role t);
    public List<Role> list();
    public void update(Role t);
    public Role getById(int id);
    public void delete(int id);
    public Role getByTen(String Role);
}
