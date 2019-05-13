package com.wq.mapper;

import com.wq.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("userMapper")
public interface UserMapper {

    /**
     * 登录
     *
     * @param user
     * @return
     */
    User login(User user);

    /**
     * 实体修改
     *
     * @param user
     * @return
     */
    int updateUser(User user);

    /**
     * 添加用户
     *
     * @param user
     * @return
     */
    int addUser(User user);

    /**
     * 删除用户
     *
     * @param pkid
     * @return
     */
    int deleteByPrimaryKey(String[] pkid);
}
