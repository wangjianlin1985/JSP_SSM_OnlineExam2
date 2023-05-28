package com.xhu.dao;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xhu.entity.Student;

public interface StudentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
    //根据teacherid获取stuid
    List<Student> getStudent( @Param("teacherid")String teacherid);
    //根据username查找学生id
    Student selectStudentByUsername(@Param("username")String username);
}