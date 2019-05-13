package com.wq.mapper;

import com.wq.entity.Person;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository("personMapper")
public interface PersonMapper {
    int deleteByPrimaryKey(String[] pkid);

    int insert(Person person);

    int updateByPrimaryKey(Person person);

    int updateSelect(Map<String, Object> map);
}