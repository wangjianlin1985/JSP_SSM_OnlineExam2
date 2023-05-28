package com.xhu.dao;

import com.xhu.entity.QuestionType;

public interface QuestionTypeMapper {
    int deleteByPrimaryKey(Integer questionTypeId);

    int insert(QuestionType record);

    int insertSelective(QuestionType record);

    QuestionType selectByPrimaryKey(Integer questionTypeId);

    int updateByPrimaryKeySelective(QuestionType record);

    int updateByPrimaryKey(QuestionType record);
}