package com.wq.service;

import com.wq.entity.Person;

import java.util.List;
import java.util.Map;

public interface PersonService {

    /*
     　　* @Description 新增
     　　* @param person
     　　* @return int
     　　* @throws
     　　* @author dengweiping
     　　* @date 2019/5/11 16:18
     　　*/
    int addSave(Person person);

    /*
  　　* @Description 修改
  　　* @param person
  　　* @return int
  　　* @throws
  　　* @author dengweiping
  　　* @date 2019/5/11 16:18
  　　*/
    int update(Person person);

    /*
    　　* @Description 匹配扶贫政策
    　　* @param [map]
    　　* @return int
    　　* @throws
    　　* @author dengweiping
    　　* @date 2019/5/13 11:08
    　　*/
    int updateSelect(Map<String, Object> map);

    /*
    　　* @Description 删除
    　　* @param pkids
    　　* @return int
    　　* @throws
    　　* @author dengweiping
    　　* @date 2019/5/11 16:18
    　　*/
    int delete(String[] pkids);
}
