package com.xhu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xhu.entity.QuestionPaper;

public interface QuestionPaperMapper {
    int deleteByPrimaryKey(Integer qpId);

    int insert(QuestionPaper record);

    int insertSelective(QuestionPaper record);

    QuestionPaper selectByPrimaryKey(Integer qpId);

    int updateByPrimaryKeySelective(QuestionPaper record);

    int updateByPrimaryKey(QuestionPaper record);
    /**
     * 预览试卷
     * @param p
     * @return
     */
    List<QuestionPaper> showPaper(@Param("id")int id);
    
    void insertpid(@Param("name")String name,@Param("pid")String pid);
    
    //查找有多少道简答题
    int selectnum(@Param("paperid")int paperid);
}