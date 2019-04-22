package com.controller;

import com.alibaba.fastjson.JSON;
import com.pojo.Page;
import com.pojo.Teacher;
import com.pojo.User;
import com.service.TeacherService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private TeacherService teacherService;

    //学生管理
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
    public Object addUser(User user) {
        userService.insert(user);
        return user;
    }

    @RequestMapping("/editUser")
    @ResponseBody
    public Object editUser(User user) {
        userService.update(user);
        return user;
    }

    @RequestMapping("/addUserList")
    public String addUserList() { 
        return "adduser";
    }

    @RequestMapping("/editUserList")
    @ResponseBody
    public Object editUserList(User user) {
        return userService.selectById(user.getId());
    }

    //教师管理

    @RequestMapping("/teacherList")
    public String teacherList(){
        return "teacher_list";
    }

    @RequestMapping("/teacherPage")
    public String teacherPage(Model model){
        List list = teacherService.selectList();
        model.addAttribute("list",list);
        return "teacher_list";
    }

}
