package com.wq.controller;

import com.wq.common.Result;
import com.wq.common.ResultGenerator;
import com.wq.entity.Policy;
import com.wq.service.PolicyService;
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
@RequestMapping("/policy")
public class PolicyController {

    @Resource
    private PolicyService policyService;
    @Autowired
    private static final Logger log = Logger.getLogger(PolicyController.class);// 日志文件

    /**
     * 新增
     */
    @RequestMapping(value = "addSave", method = RequestMethod.POST)
    @ResponseBody
    public Result save(@RequestBody Policy policy) throws Exception {
        int resultTotal;
        resultTotal = policyService.addSave(policy);
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
    public Result updateSave(@RequestBody Policy policy) throws Exception {
        int resultTotal;
        resultTotal = policyService.update(policy);
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
        policyService.delete(pkidArr);
        return ResultGenerator.genSuccessResult();
    }

    /**
     * 获取学院列表Controller
     */
    @RequestMapping(value = "/getPolicyList", method = RequestMethod.POST)
    @ResponseBody
    public JSONArray getPolicyList() {
        List<Map<String, Object>> list = policyService.getPolicyList();
        if (list.size() > 0) {
            JSONArray jsonArray = JSONArray.fromObject(list);
            return jsonArray;
        }
        return null;
    }
}
