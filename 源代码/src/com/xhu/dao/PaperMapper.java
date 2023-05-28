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
     * ��ҳ��ѯ
     * @param q
     * @return
     */
    List<Paper> searchPaper(Paper p);
    /**
     * ��ѯ������
     * @param q
     * @return
     */
    int  searchCount();
    int del(List<String > list);
    //ɾ���м����Ϣ
    int delqp(List<String> list);
    //��ѯ�Ծ����Ƿ��ظ�
    public int checkname(@Param("papername")String name);
    //��ȡ����ʱ��
    public int getpapertime(@Param("paperid")int paperid);
}