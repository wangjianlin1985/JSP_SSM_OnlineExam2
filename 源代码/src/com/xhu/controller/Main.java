package com.xhu.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xhu.dao.InsertInforDao;
import com.xhu.entity.ExamInfor;
import com.xhu.entity.News;
import com.xhu.entity.User;
import com.xhu.serviceImp.ExamInforSeriveImp;
import com.xhu.serviceImp.GetNewsServiceImp;
import com.xhu.serviceImp.UpdateInforServiceImp;

@Controller
@RequestMapping("/main")
public class Main {
	@Autowired
	private GetNewsServiceImp getNews;
	@Autowired
	private ExamInforSeriveImp eInfor;
	@Autowired
	private UpdateInforServiceImp updateInfor;
	@Autowired
	private InsertInforDao insertMsg;

	@RequestMapping("/studentPage")
	public String studentPage() {
		return "main";
	}

	@RequestMapping("/teacherPage")
	public String teacherPage() {
		return "main";
	}

	@RequestMapping("/adminPage")
	public String adminPage() {
		return "main";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/getNews")
	@ResponseBody
	public HashMap<String, Object> searchQuestion(News n) {
		return getNews.searchNews(n);
	}

	@RequestMapping("logout")
	public ModelAndView logOut(HttpServletRequest request) {
		request.getSession().invalidate();
		ModelAndView model = new ModelAndView("login");
		// model.addObject(attributeName, attributeValue);
		return model;
	}

	@RequestMapping("/selectExam")
	@ResponseBody
	public List<ExamInfor> selectExam(@RequestParam("account") String account) {
		List<ExamInfor> list = eInfor.selectExam(account);
		return list;
	}

	@RequestMapping("/selectPreExam")
	@ResponseBody
	public List<ExamInfor> selectPreExam(@RequestParam("account2") String account) {
		List<ExamInfor> list = eInfor.selectPreExam(account);

		return list;
	}

	@RequestMapping("/doUpdate")
	@ResponseBody
	public String doUpdate(@RequestParam("username") String username, @RequestParam("cnUser") String cnUser,
			@RequestParam("email") String email, @RequestParam("updatePass") String updatePass) {
		if (cnUser == "" && email == "" && updatePass == "") {
			return "noOperate";
		}

		User user = new User();
		user.setUsername(username);
		if (cnUser != "" && cnUser != null) { // 不能用 || 判断 因为如果后台传来的值是 "" ,
												// 执行cnUser!=""为假，就会
			user.setCnUser(cnUser); // 接着执行cnUser!=null,为真，假||真 就为真 ,
									// 就会执行if里面的语句，把""传进去。
		}
		if (email != "" && email != null) {
			user.setEmail(email);
		}
		if (updatePass != "" && updatePass != null) {
			user.setPassword(updatePass);
		}

		int number = updateInfor.updateInfor(user);
		if (number > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	@RequestMapping("/doTest")
	@ResponseBody
	public String doTest(@RequestParam("examName") String examName, @RequestParam("examTime") String examTime) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		String day = df.format(new Date());
		if (day.equals(examTime)) {
			return "yes";
		} else {
			return "no";
		}
	}

	@RequestMapping("/insertMsg")
	@ResponseBody
	public String insertMsg(@RequestParam("title") String title, @RequestParam("newContext") String newContext) {
		// SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd
		// HH:mm:ss");//设置日期格式
		// System.out.println(df.format(new Date()));// new Date()为获取当前系统时间

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		String day = df.format(new Date());

		int record = insertMsg.insertMsg(title, newContext, day);
		if (record > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
}
