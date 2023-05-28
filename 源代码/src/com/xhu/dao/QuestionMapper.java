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
    //��ѯ���
    List<Question> searchQuestion(Question q);
    
    int searchCount(Question q);
    //����ɾ������
    int del(List<String > list);
    //��֤����Ƿ��ظ�
    int checkQid(@Param("qid")int qid);
}