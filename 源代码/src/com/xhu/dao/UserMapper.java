package com.xhu.dao;

import org.apache.ibatis.annotations.Param;

import com.xhu.entity.Student;
import com.xhu.entity.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    //根据username查找学生id
    User selectUserIdByUsername(@Param("username")String username);
}