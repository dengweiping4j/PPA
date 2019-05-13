package com.wq.controller;

import com.wq.common.Result;
import com.wq.common.ResultGenerator;
import com.wq.entity.User;
import com.wq.service.UserService;
import com.wq.util.MD5Util;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/*
　　* @Description 用户管理Controller类
　　* @author dengweiping
　　* @date 2019/5/10 10:32
　　*/
@Controller
@RequestMapping("/users")
public class UserController {

    @Resource
    private UserService userService;
    private static final Logger log = Logger.getLogger(UserController.class);// 日志文件

    /*
    　　* @Description 登录
    　　* @param [user]
    　　* @return com.wq.common.Result
    　　* @throws
    　　* @author dengweiping
    　　* @date 2019/5/10 10:32
    　　*/
    @RequestMapping(value = "/cookie", method = RequestMethod.POST)
    @ResponseBody
    public Result login(User user) {
        try {
            String MD5pwd = MD5Util.MD5Encode(user.getPassword(), "UTF-8");
            user.setPassword(MD5pwd);
        } catch (Exception e) {
            user.setPassword("");
        }
        User resultUser = userService.login(user);
        log.info("request: user/login , user: " + user.toString());
        if (resultUser == null) {
            return ResultGenerator.genFailResult("账号或密码错误,请重新登录！");
        } else {
            resultUser.setPassword("PASSWORD");
            Map data = new HashMap();
            data.put("currentUser", resultUser);
            return ResultGenerator.genSuccessResult(data);
        }
    }

    /*
    *添加用户
     */
    @RequestMapping(value = "addSave", method = RequestMethod.POST)
    @ResponseBody
    public Result save(@RequestBody User user) throws Exception {
        int resultTotal;
        String MD5pwd = MD5Util.MD5Encode(user.getPassword(), "UTF-8");
        user.setPassword(MD5pwd);
        resultTotal = userService.addUser(user);
        if (resultTotal > 0) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult("FAIL");
        }
    }

    /*
    　　* @Description 修改用户
    　　* @param [user]
    　　* @return com.wq.common.Result
    　　* @throws
    　　* @author dengweiping
    　　* @date 2019/5/10 10:34
    　　*/
    @RequestMapping(value = "updateSave", method = RequestMethod.POST)
    @ResponseBody
    public Result update(@RequestBody User user) throws Exception {
        String MD5pwd = MD5Util.MD5Encode(user.getPassword(), "UTF-8");
        user.setPassword(MD5pwd);
        int resultTotal = userService.updateUser(user);
        if (resultTotal > 0) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult("FAIL");
        }
    }

    /*
    　　* @Description 删除用户
    　　* @param [ids]
    　　* @return com.wq.common.Result
    　　* @throws
    　　* @author dengweiping
    　　* @date 2019/5/10 10:34
    　　*/
    @RequestMapping(value = "/delete/{pkids}", method = RequestMethod.DELETE)
    @ResponseBody
    public Result delete(@PathVariable(value = "pkids") String pkids) throws Exception {
        String[] pkidArr = pkids.split(",");
        userService.deleteUser(pkidArr);
        return ResultGenerator.genSuccessResult();
    }
}