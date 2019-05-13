package com.wq.service;

import com.wq.entity.Policy;

import java.util.List;
import java.util.Map;

public interface PolicyService {

    /*
     　　* @Description 新增
     　　* @param person
     　　* @return int
     　　* @throws
     　　* @author dengweiping
     　　* @date 2019/5/11 16:18
     　　*/
    int addSave(Policy policy);

    /*
  　　* @Description 修改
  　　* @param person
  　　* @return int
  　　* @throws
  　　* @author dengweiping
  　　* @date 2019/5/11 16:18
  　　*/
    int update(Policy policy);

    /*
    　　* @Description 删除
    　　* @param pkids
    　　* @return int
    　　* @throws
    　　* @author dengweiping
    　　* @date 2019/5/11 16:18
    　　*/
    int delete(String[] pkids);

    /**
     * 获取扶贫政策列表
     */
    List<Map<String, Object>> getPolicyList();
}
