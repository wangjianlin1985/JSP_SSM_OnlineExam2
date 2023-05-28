package com.xhu.serviceImp;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhu.dao.StudentMapper;
import com.xhu.entity.Student;
import com.xhu.service.StudentService;
@Service
public class StudentServiceImp implements StudentService {
 @Autowired
 StudentMapper studentMapper;
 //ͨ����ʦid��ѧ��id

	@Override
	public List<String> getStudentService(String teacherid) {
	List<Student>  student=	studentMapper.getStudent(teacherid);
	List<String> stuidlist = new ArrayList<>();
	for(int i=0;i<student.size();i++){
		stuidlist.add(student.get(i).getStuId());
	}
		return stuidlist;
	}

	@Override
	public Student getStudentByUsername(String username) {
		Student student=studentMapper.selectStudentByUsername(username);
		return student;
	}

}
