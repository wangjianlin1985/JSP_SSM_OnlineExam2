package com.xhu.service;

import java.util.List;

import com.xhu.entity.ExamInfor;

public interface ExamInforService {
	public List<ExamInfor> selectExam(String account);
	public List<ExamInfor> selectPreExam(String account);
}
