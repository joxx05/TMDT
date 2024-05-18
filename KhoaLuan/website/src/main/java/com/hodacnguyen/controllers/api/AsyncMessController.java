package com.hodacnguyen.controllers.api;

import com.hodacnguyen.pojo.Message;
import com.hodacnguyen.service.MessageService;
import com.hodacnguyen.service.StoreService;
import com.hodacnguyen.service.UserService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author cumy1
 */
@RestController
public class AsyncMessController {
    @Autowired
    private MessageService messageService;
    @Autowired
    private UserService userService;
    @Autowired
    private StoreService storeService;
    @GetMapping("api/mess/{user1}/{user2}")
    public ResponseEntity<List<Message>> listProducts(@PathVariable(name = "user1")String user1,@PathVariable(name = "user2")String user2){
        com.hodacnguyen.pojo.User u1= userService.getUsers(user1).get(0);
        com.hodacnguyen.pojo.User u2= userService.getUsers(user2).get(0);
        List<Message> mess=this.messageService.list(u1.getId(),u2.getId());
        return new ResponseEntity<>(mess,HttpStatus.OK);
    }
    @GetMapping("api/realtimeloadmess/{user1}/{user2}")
    public ResponseEntity<Message> loadMess(@AuthenticationPrincipal User user,@PathVariable(name = "user1")int user1,@PathVariable(name = "user2")int user2){
        com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        Message mess=this.messageService.getbyid(user1,user2);
        if(mess.getOutcoming()==t.getId()){
            this.messageService.update(mess);
            return new ResponseEntity<>(mess,HttpStatus.OK);
        }
        return null;
    }
    @GetMapping("api/realtimecheckmess")
    public ResponseEntity<Message> loadMess(@AuthenticationPrincipal User user){
        if(user==null){
            return null;
        }
        com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        Message mess=this.messageService.getbyid(t.getId());
        return new ResponseEntity<>(mess,HttpStatus.OK);
    }
    @PostMapping("api/mess/send")
    @ResponseStatus(value = HttpStatus.CREATED)
    public void sendMess(@RequestParam("incoming")int incoming,@RequestParam("outcoming")int outcoming,@RequestParam("content")String content){
        Message t = new Message();
        t.setIncoming(incoming);
        t.setOutcoming(outcoming);
        t.setContent(content);
        this.messageService.add(t);
    }
    @PostMapping("api/mess/getstatus")
    public ResponseEntity<Map<String,Object>> getinout(@AuthenticationPrincipal User user,@RequestParam("idstore")int idstore){
        Map<String,Object> map = new HashMap<>();
        com.hodacnguyen.pojo.User t= userService.getUsers(user.getUsername()).get(0);
        map.put("incoming", String.valueOf(t.getId()));
        com.hodacnguyen.pojo.User e=storeService.getById(idstore).getUser();
        map.put("outcoming", String.valueOf(e.getId()));
        return ResponseEntity.ok(map);
    }
    
}
