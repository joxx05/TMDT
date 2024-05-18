/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service.Impl;

import com.hodacnguyen.pojo.Cart;
import com.hodacnguyen.pojo.Role;
import com.hodacnguyen.pojo.Store;
import com.hodacnguyen.pojo.User;
import com.hodacnguyen.repository.CartRepo;
import com.hodacnguyen.repository.RoleRepo;
import com.hodacnguyen.repository.UserRepo;
import com.hodacnguyen.service.UserService;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


@Service("userDetailsService")
public class UserServiceImpl implements UserService{
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private RoleRepo roleRepo;
    @Autowired
    private CartRepo cartRepo;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    @Override
    public void add(User t) {
        t.setStatus(true);
        String pass = t.getPassword();
        t.setPassword(this.passwordEncoder.encode(pass));
        //addcart
        Cart cart = new Cart();
        this.cartRepo.add(cart);
        t.setCart(cart);
        this.userRepo.add(t);
        //addrole
        Set<Role> roles=new HashSet<>();
        Role role =this.roleRepo.getByTen("User");
        roles.add(role);
        t.setRole(roles);
        this.roleRepo.update(role);
        this.userRepo.update(t);
    }
    @Override
    public boolean changePass(User t , String pass){
        t.setPassword(this.passwordEncoder.encode(pass));
        this.userRepo.update(t);
        return true;
    }

    @Override
    public List<User> list() {
        return this.userRepo.list();
    }

    @Override
    public void update(User t) {
        this.userRepo.update(t);
    }

    @Override
    public User getById(int id) {
        return this.userRepo.getById(id);
    }

    @Override
    public void delete(int id) {
        this.userRepo.delete(id);
    }
    
    @Override
    public List<User> getUsers(String email) {
        return this.userRepo.getUsers(email);
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        List<User> users = this.userRepo.getUsers(email);
        if(users.isEmpty()){
            throw new UsernameNotFoundException("Không tồn tại user này!");
        }
            
        User u = users.get(0);
        Set<GrantedAuthority> auth = new HashSet<>();
        for(Role role : u.getRole()){
            auth.add(new SimpleGrantedAuthority(role.getTen()));
        }
        return new org.springframework.security.core.userdetails.User(u.getEmail(),u.getPassword(),auth);
    }

    @Override
    public Set<Store> getStores(User t) {
        return this.userRepo.getStores(t);
    }

    @Override
    public List<User> searchUsers(String key) {
        return this.userRepo.searchUsers(key);
    }

    
}
