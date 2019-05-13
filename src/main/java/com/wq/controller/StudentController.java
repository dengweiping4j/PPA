package com.wq.controller;

import com.wq.common.Result;
import com.wq.common.ResultGenerator;
import com.wq.entity.Student;
import com.wq.service.StudentService;
import net.sf.json.JSONArray;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 学生信息管理Controller类
 */
@Controller
@RequestMapping("/student")
public class StudentController {

    @Resource
    private StudentService studentService;
    @Autowired
    private static final Logger log = Logger.getLogger(StudentController.class);// 日志文件

    /**
     * 获取学院列表Controller
     */
    @RequestMapping(value = "/getDepartmentList", method = RequestMethod.POST)
    @ResponseBody
    public JSONArray getDepartmentList() {
        List<Map<String, Object>> list = studentService.getDepartmentList();
        if (list.size() > 0) {
            JSONArray jsonArray = JSONArray.fromObject(list);
            return jsonArray;
        }
        return null;
    }

    /**
     * 获取专业列表Controller
     */
    @RequestMapping(value = "/getMajorList", method = RequestMethod.POST)
    @ResponseBody
    public JSONArray getMajorList(String departmentKey) {
        List<Map<String, Object>> list = studentService.getMajorList(departmentKey);
        if (list.size() > 0) {
            JSONArray jsonArray = JSONArray.fromObject(list);
            return jsonArray;
        }
        return null;
    }

    /**
     * 获取班级列表Controller
     */
    @RequestMapping(value = "/getClassList", method = RequestMethod.POST)
    @ResponseBody
    public JSONArray getClassList(String majorKey) {
        List<Map<String, Object>> list = studentService.getClassList(majorKey);
        if (list.size() > 0) {
            JSONArray jsonArray = JSONArray.fromObject(list);
            return jsonArray;
        }
        return null;
    }

    /**
     * 添加学生信息
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "addSave", method = RequestMethod.POST)
    @ResponseBody
    public Result save(@RequestBody Student student) throws Exception {
        int resultTotal;
        resultTotal = studentService.addStudent(student);
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
        studentService.deleteStudent(pkidArr);
        return ResultGenerator.genSuccessResult();
    }
}
