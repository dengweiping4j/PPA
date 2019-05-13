package com.wq.mapper;

import com.wq.entity.Policy;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("policyMapper")
public interface PolicyMapper {
    int deleteByPrimaryKey(String[] pkid);

    int insert(Policy record);

    int updateByPrimaryKey(Policy record);

    List<Map<String, Object>> getPolicyList();
}