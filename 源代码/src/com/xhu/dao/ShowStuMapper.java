package com.xhu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xhu.entity.Student;

public interface ShowStuMapper {

	public int searchCount(Student s);

	public List<Student> selectStu(Student s);

	public int searchCounts(Student s);

	public List<Student> selectStudents(Student s);

	public int Counts(Student s);

	public List<Student> Students(Student s);

	public int del(@Param("exam_name")String exam_name);

}
