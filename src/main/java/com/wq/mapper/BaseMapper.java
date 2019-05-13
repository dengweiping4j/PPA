package com.wq.mapper;

import com.wq.entity.Student;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("baseMapper")
public interface BaseMapper {

    /*
    　　* @Description 查询列表数据
    　　* @param [map]
    　　* @return List<Map<String, Object>>
    　　* @throws
    　　* @author dengweiping
    　　* @date 2019/5/10 13:39
    　　*/
    List<Map<String, Object>> findGridData(Map<String, Object> map);

    /*
    　　* @Description 查询列表数据总条数
    　　* @param [map]
    　　* @return java.lang.Long
    　　* @throws
    　　* @author dengweiping
    　　* @date 2019/5/10 13:40
    　　*/
    Long getGridTotal(Map<String, Object> map);

}