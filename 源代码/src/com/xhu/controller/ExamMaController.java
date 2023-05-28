package com.xhu.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xhu.entity.Student;
import com.xhu.entity.Teacher;
import com.xhu.entity.Texam;
import com.xhu.entity.User;
import com.xhu.service.ExamService;
import com.xhu.service.StudentService;

@Controller
public class ExamMaController {
	@Autowired
	ExamService examService;
	@Autowired
	StudentService studentService;

	@RequestMapping(method=RequestMethod.GET,value="exam.do")
	public String exam() {
		return "exam";
	}



	@RequestMapping(method=RequestMethod.POST,value="saveExam1.do")
	@ResponseBody
	
	public String addExam(Texam a,HttpSession session){
       
		//获取session中username的值
       String username=(String) session.getAttribute("username");

	//根据username获取accountId
        User user=examService.getUserIdByUsername(username);
         int account_id=user.getId();
 
         //根据accountId获取教师id
         Teacher teacher=examService.getTeacherIdByUserId(account_id);
   
         String teacherId=teacher.getTeacher_id();
       System.out.println(teacherId);
         
	//根据老师id获取学生id list,	
	List<String> list=studentService.getStudentService(teacherId);
	

		try{
			examService.insertExam(a, list);
		
		}catch(Exception e){
			return "error";
		}
		return "success";
		
	}
	
	@RequestMapping(method=RequestMethod.POST,value="delBat.do")
	@ResponseBody
	public String  delBat(Texam a){
		/*System.out.println("---------------------------");
	System.out.println(a.getPaperId());*/
		try{
			examService.delBats(a);
		
		}catch(Exception e){
			return "error";
		}
		return "success";
		
	}
		
	
	
	

	@RequestMapping(method=RequestMethod.POST,value="updateExam.do")
	@ResponseBody
	public String updateExam(Texam a){
	
		try{
			examService.updateExam(a);
		
		}catch(Exception e){
			return "error";
		}
		return "success";
		
	}

	@RequestMapping(method=RequestMethod.GET,value="stuExam.do")
	public String stuExam() {
		return "stuExam";
	}
	@RequestMapping(method=RequestMethod.POST,value="searchStuExam.do ")
	@ResponseBody
	public  HashMap<String, Object> searchExam(Texam e,HttpSession session){
				 	String username=(String) session.getAttribute("username");
					 //根据username的值在student表中找到对应的学生id
					 Student student=studentService.getStudentByUsername(username);
					 String s=student.getStuId();
					 e.setStuId(s);
					return examService.searchExams(e);
				}

}
