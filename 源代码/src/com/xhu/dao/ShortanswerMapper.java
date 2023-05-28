package com.xhu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xhu.entity.Shortanswer;

public interface ShortanswerMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Shortanswer record);

	int insertSelective(Shortanswer record);

	Shortanswer selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Shortanswer record);

	int updateByPrimaryKey(Shortanswer record);

	// ��ȡ������
	List<Shortanswer> getShortAnswer(Shortanswer sh);
	//
	int searchShrotanswerCount(Shortanswer sh);
	//�����ľ�״̬
	int updatestatu(@Param("stuid")String stuid,@Param("papername")String papername);
}