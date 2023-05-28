package com.xhu.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xhu.entity.Student;
import com.xhu.entity.Texam;
import com.xhu.service.ExamService;
import com.xhu.service.StudentService;

@Controller
public class ScoreController {
	@Autowired
	ExamService examService;
	@Autowired
	StudentService studentService;

	
	@RequestMapping(method = RequestMethod.GET, value = "stuScore.do")
	public String studentPage() {

		return "stuScore";
	}

	@RequestMapping(method = RequestMethod.POST, value = "searchStuScore.do")
	@ResponseBody
	public HashMap<String, Object> searchStuScore(Texam e, HttpSession session) {
		String username = (String) session.getAttribute("username");
		// 根据username的值在student表中找到对应的学生id
		Student student = studentService.getStudentByUsername(username);
		String s = student.getStuId();
		e.setStuId(s);
		return examService.searchExams(e);

	}

	@RequestMapping(method = RequestMethod.GET, value = "teacherScore.do")
	public String teacherPage() {

		return "teacherScore";
	}

	@RequestMapping(method = RequestMethod.POST, value = "searchScore.do")
	@ResponseBody
	public HashMap<String, Object> searchScore(Texam e) {
		// System.out.println("-----------------");
		// e.setPaperId(3);
		return examService.searchExams2(e);

	}
}
