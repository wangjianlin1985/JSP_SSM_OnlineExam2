package com.xhu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xhu.entity.ExamInfor;

public interface ExamDao {
	public List<ExamInfor> selectExam(@Param("account")String account);

	public List<ExamInfor> selectPreExam(String account);
}
