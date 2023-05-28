package com.xhu.dao;

import com.xhu.entity.Difficulty;

public interface DifficultyMapper {

	int deleteByPrimaryKey(Integer id);

    int insert(Difficulty record);

    int insertSelective(Difficulty record);

    Difficulty selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Difficulty record);

    int updateByPrimaryKey(Difficulty record);
}