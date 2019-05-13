package com.wq.controller;

import com.wq.common.Result;
import com.wq.common.ResultGenerator;
import com.wq.entity.Person;
import com.wq.service.PersonService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;

/**
 * 学生信息管理Controller类
 */
@Controller
@RequestMapping("/person")
public class PersonController {

    @Resource
    private PersonService personService;
    @Autowired
    private static final Logger log = Logger.getLogger(PersonController.class);// 日志文件

    /**
     * 新增
     */
    @RequestMapping(value = "addSave", method = RequestMethod.POST)
    @ResponseBody
    public Result save(@RequestBody Person person) throws Exception {
        int resultTotal;
        resultTotal = personService.addSave(person);
        if (resultTotal > 0) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult("FAIL");
        }
    }

    /**
     * 修改
     */
    @RequestMapping(value = "updateSave", method = RequestMethod.POST)
    @ResponseBody
    public Result updateSave(@RequestBody Person person) throws Exception {
        int resultTotal;
        resultTotal = personService.update(person);
        if (resultTotal > 0) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult("FAIL");
        }
    }

    /**
     * 匹配扶贫政策
     */
    @RequestMapping(value = "updateSelect", method = RequestMethod.POST)
    @ResponseBody
    public Result updateSelect(@RequestBody Map<String, Object> map) throws Exception {
        int resultTotal;
        resultTotal = personService.updateSelect(map);
        if (resultTotal > 0) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult("FAIL");
        }
    }

    /**
     * 删除
     *
     * @param pkids
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/delete/{pkids}", method = RequestMethod.DELETE)
    @ResponseBody
    public Result delete(@PathVariable(value = "pkids") String pkids) throws Exception {
        String[] pkidArr = pkids.split(",");
        personService.delete(pkidArr);
        return ResultGenerator.genSuccessResult();
    }
}
