package com.xhu.service;

import java.util.HashMap;

import com.xhu.entity.Student;

public interface ShowStuService {

	public HashMap<String, Object> selectAllStu(Student s);

	public HashMap<String, Object> selectStudents(Student s);

	public HashMap<String, Object> select(Student s);

	public int del(String exam_name);

}
