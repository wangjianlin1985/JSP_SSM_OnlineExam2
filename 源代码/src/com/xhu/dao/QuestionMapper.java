package com.xhu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xhu.entity.Question;

public interface QuestionMapper {
    int deleteByPrimaryKey(Integer qId);

    int insert(Question record);

    int insertSelective(Question record);

    Question selectByPrimaryKey(Integer qId);

    int updateByPrimaryKeySelective(Question record);

    int updateByPrimaryKey(Question record);
    //查询题库
    List<Question> searchQuestion(Question q);
    
    int searchCount(Question q);
    //批量删除数据
    int del(List<String > list);
    //验证题号是否重复
    int checkQid(@Param("qid")int qid);
}