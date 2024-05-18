/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service;

import com.hodacnguyen.pojo.Store;
import com.hodacnguyen.pojo.User;
import java.util.List;
import java.util.Set;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author CaNoc
 */
public interface UserService extends UserDetailsService{
    public void add(User t);
    public List<User> list();
    public void update(User t);
    public User getById(int id);
    public void delete(int id);
    public boolean changePass(User t , String pass);
    public List<User> getUsers(String email);
    public Set<Store> getStores(User t);
    public List<User> searchUsers(String key);
}
