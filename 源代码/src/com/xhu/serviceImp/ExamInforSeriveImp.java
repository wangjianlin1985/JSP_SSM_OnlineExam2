package com.xhu.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhu.dao.ExamDao;
import com.xhu.entity.ExamInfor;
import com.xhu.service.ExamInforService;

@Service
public class ExamInforSeriveImp implements ExamInforService {
	@Autowired
	private ExamDao eDao;
	
	
	@Override
	public List<ExamInfor> selectExam(String account) {
		List<ExamInfor> list = eDao.selectExam(account);
		return list;
	}


	@Override
	public List<ExamInfor> selectPreExam(String account) {
		List<ExamInfor> list = eDao.selectPreExam(account);
		return list;
	}

}
