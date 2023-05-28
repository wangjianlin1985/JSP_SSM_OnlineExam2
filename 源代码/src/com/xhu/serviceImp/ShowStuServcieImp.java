package com.xhu.serviceImp;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhu.dao.ShowStuMapper;
import com.xhu.entity.Student;
import com.xhu.service.ShowStuService;
@Service
public class ShowStuServcieImp implements ShowStuService {
	@Autowired
	private ShowStuMapper mapper;
	@Override
	public HashMap<String, Object> selectAllStu(Student s) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		//System.out.println(s.getPage());
		s.setPage(s.getRows()*(s.getPage()-1));
		//System.out.println(s.getPage());
		map.put("total", mapper.searchCount(s));
		map.put("rows", mapper.selectStu(s));
		System.out.println(mapper.selectStu(s));
		return map;
	}
	@Override
	public HashMap<String, Object> selectStudents(Student s) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println(s.getPage());
		s.setPage(s.getRows()*(s.getPage()-1));
		System.out.println(s.getPage());
		map.put("total", mapper.searchCounts(s));
		map.put("rows", mapper.selectStudents(s));
		return map;
	}
	@Override
	public HashMap<String, Object> select(Student s) {
		HashMap<String, Object> map = new HashMap<String, Object>();
//		if(s.getTexam().getExam_score()==""){
//			
//		}
		s.setPage(s.getRows()*(s.getPage()-1));
		map.put("total", mapper.Counts(s));
		map.put("rows", mapper.Students(s));
		return map;
	}
	@Override
	public int del(String exam_name) {
		int r = mapper.del(exam_name);
		return r;
	}

}
