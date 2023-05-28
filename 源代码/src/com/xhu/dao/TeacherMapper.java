package com.xhu.dao;

import org.apache.ibatis.annotations.Param;

import com.xhu.entity.Teacher;
import com.xhu.entity.User;

public interface TeacherMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Teacher record);

    int insertSelective(Teacher record);

    Teacher selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Teacher record);

    int updateByPrimaryKey(Teacher record);
  //����userid���ҽ�ʦid
    Teacher selectTeacherIdByUserId(@Param("account_id")Integer account_id);
}