/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.repository;

import com.hodacnguyen.pojo.Store;
import com.hodacnguyen.pojo.User;
import java.util.List;
import java.util.Set;

/**
 *
 * @author CaNoc
 */
public interface UserRepo {
    public void add(User t);
    public List<User> list();
    public void update(User t);
    public User getById(int id);
    public void delete(int id);
    public List<User> getUsers(String email);
    public Set<Store> getStores(User t);
    public List<User> searchUsers(String key);
}
