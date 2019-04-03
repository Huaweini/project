package com.controller;

import com.pojo.Page;
import com.pojo.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/all")
    public String list(Model model) {
        List<User> list = userService.selectList(new User());
        model.addAttribute("list", list);
        return "user_list";
    }

    @RequestMapping("/page")
    public String list(Model model, Page<User> page) {
        page = userService.getPageByParam(page,new User());
        model.addAttribute("page", page);
        return "user_list";
    }

    @RequestMapping("/changePage")
    @ResponseBody
    public String chanPage(Model model, Page<User> page) {
        page = userService.getPageByParam(page,new User());
        model.addAttribute("page", page);
        return "user_list";
    }

    @RequestMapping("/addUser")
    @ResponseBody
    public String addUser() {
        return "adduser";
    }


//    @RequestMapping("/toTestPage")
//    public String toTestPage(User u , Model model){
//        for (int i=0;i<=50;i++){
//            String str = Long.toString(new Date().getTime());
//            u.setLoginName(Long.toString(new Date().getTime()));
//            u.setPassword("123456");
//            u.setRealName("华为倪"+str.substring(str.length()-4,str.length()));
//            u.setGroupId(12);
//            userService.insert(u);
//        }
//
//        List<User> list = userService.selectList(new User());
//        model.addAttribute("list", list);
//        return "test_list";
//    }


}
