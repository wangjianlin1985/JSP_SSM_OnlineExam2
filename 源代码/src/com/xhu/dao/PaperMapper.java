package com.xhu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xhu.entity.Paper;

public interface PaperMapper {
    int deleteByPrimaryKey(Integer paperId);

    int insert(Paper record);

    int insertSelective(Paper record);

    Paper selectByPrimaryKey(@Param("name")String name);

    int updateByPrimaryKeySelective(Paper record);

    int updateByPrimaryKey(Paper record);
    
    /**
     * 分页查询
     * @param q
     * @return
     */
    List<Paper> searchPaper(Paper p);
    /**
     * 查询总条数
     * @param q
     * @return
     */
    int  searchCount();
    int del(List<String > list);
    //删除中间表信息
    int delqp(List<String> list);
    //查询试卷名是否重复
    public int checkname(@Param("papername")String name);
    //获取考试时间
    public int getpapertime(@Param("paperid")int paperid);
}