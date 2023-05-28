package com.xhu.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xhu.entity.Student;
import com.xhu.entity.Teacher;
import com.xhu.service.ShowStuService;

@Controller
public class StuManageController {
	@Autowired
	private ShowStuService service;
	@RequestMapping("searchstu.do")
	public String searchstu(HttpServletRequest request){
		return "searchstu";
	}
	@RequestMapping("selectStudent.do")
	public String selectStudent(){
		return "selectStudent";
	}
	@RequestMapping("search.do")
	public String search(){
		return "search";
	}
	@RequestMapping(method = RequestMethod.POST,value="selectAllStu.do")
	@ResponseBody
	public HashMap<String, Object> selectAllStu(Student s){
		
		return service.selectAllStu(s);
	}
	@RequestMapping(method = RequestMethod.POST,value="select.do")
	@ResponseBody
	public HashMap<String, Object> select(HttpSession session,HttpServletRequest request,Student s){
		String username = (String) session.getAttribute("username");
		s.setAccount(username);
		System.out.println(s);
		String clazzname = request.getParameter("clazz.clazz_name");
		if(clazzname==""){
			s.setClazz(null);
		}
		System.out.println(s);
		return service.select(s);
	}
	@RequestMapping(value="del.do")
	@ResponseBody
	public String del(@RequestParam("examName")String exam_name){
		int r = service.del(exam_name);
		if(r>0){
			return "success";
		}else{
			return "failed";
		}
		
	}
	@RequestMapping(method = RequestMethod.POST,value="selectStudents.do")
	@ResponseBody
	public HashMap<String, Object> selectStudents(Student s,HttpServletRequest re){
		HttpSession session = re.getSession();
		String username = (String) session.getAttribute("username");
		System.out.println(username);
		Teacher t =new Teacher();
		t.setTeacher_name(username);
		s.setTeacher(t);
		return service.selectStudents(s);
	}
	
}
