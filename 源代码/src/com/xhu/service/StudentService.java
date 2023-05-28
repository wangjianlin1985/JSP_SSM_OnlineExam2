package com.xhu.service;

import java.util.List;

import com.xhu.entity.Student;


public interface StudentService {
    List<String> getStudentService(String teacherid);
    Student getStudentByUsername(String username); 
}
