package com.xhu.service;

import java.util.HashMap;
import java.util.List;

import com.xhu.entity.Teacher;
import com.xhu.entity.Texam;
import com.xhu.entity.User;

public interface ExamService {
    HashMap<String, Object> searchExams(Texam e);
    HashMap<String, Object> searchExams2(Texam e);
    public void delBats(Texam e);
    public void saveExam(Texam e);
    public void updateExam(Texam e);
    public void insertExam(Texam e,List<String> list);
    User getUserIdByUsername(String username);
    Teacher getTeacherIdByUserId(Integer account_id );
}
