package com.xhu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xhu.entity.SelectInfor;
import com.xhu.entity.User;
import com.xhu.serviceImp.LoginServiceImp;
import com.xhu.util.SendEmail;
@Controller
@RequestMapping("/login")
public class Login {
	private static String changeStatus="nullInfor";
	@Autowired
	private LoginServiceImp loginService;
	
	@RequestMapping("/index")
	public String login(){
		return "login";
	}
	
	@RequestMapping("doLogin")
	@ResponseBody
	//public String doLogin(@RequestParam("username") String username,@RequestParam("password") String password,@RequestParam("code") String code,@RequestParam("role") String role){
	public String doLpgin(HttpServletRequest http){
		HttpSession session = http.getSession();
		String getCode = (String) session.getAttribute("randCheckCode");
		String code = http.getParameter("code").trim();
		String username = http.getParameter("username").trim();
		String password = http.getParameter("password").trim();
		String role = http.getParameter("role").trim();
		
		if(username==null||username==""||password==null||password==""){
			return "wrong";
		}
		
		if(!getCode.trim().equalsIgnoreCase(code)){
			return "wrongCode";
		}
		
		User user = loginService.selectByUsername(username);
		
		if(user==null){
			return "wrong";
		}
		
		session.setAttribute("username", user.getUsername());
		
		if(!user.getPassword().equals(password)){
			return "wrong";
		}
		System.out.println(user.getRole());
		if(user.getRole().equals("admin")){
			return "admin";
		}else{
			if(user.getRole().equals(role)){
				return role;
			}else if(!user.getRole().equals(role)){
				return "wrong";
			}
		}
		return "success";
	}
	
	
	@RequestMapping("/doregist")
	@ResponseBody
	public String doRegist(HttpServletRequest http){
		String username = http.getParameter("username");
		String cnUser = http.getParameter("cnUser");
		String email = http.getParameter("email");
		String password = http.getParameter("password");
		int clazz = Integer.parseInt(http.getParameter("clazz"));
		int department = Integer.parseInt(http.getParameter("department"));
		int num = loginService.insertUser(username, password, cnUser,email, clazz, department,"student");
		if(num>0){
			return "success";
		}
		else if(num==0){
			return "fail";
		}
		else{
			return "doAgin";
		}
	}
	
	@RequestMapping("/getInfor1")
	@ResponseBody
	public List<SelectInfor> getInfor1(){
		List<SelectInfor> list = loginService.getClazzInfor();
		return list;
	}
	@RequestMapping("/getInfor2")
	@ResponseBody
	public List<SelectInfor> getInfor2(){
		List<SelectInfor> list = loginService.getDepartmentInfor();
		return list;
	}
	
	@RequestMapping("/doChange")
	@ResponseBody
	public String doChange(HttpServletRequest http,@RequestParam("changeUser") String username,@RequestParam("changeCode")String code){
		HttpSession session = http.getSession();
		String getCode = (String) session.getAttribute("randCheckCode");
		if(!getCode.equalsIgnoreCase(code)){
			return "wrongCode";
		}
		User user = loginService.selectByUsername(username);
		if(user==null){
			return "noUser";
		}else{
			return "success";
		}
	}
	
	@RequestMapping("/sendMessage")
	@ResponseBody
	public List<String> sendMessage(@Param("username") String username) {
		String randomCode = Math.random() + "";
		//查询邮箱
		String email = loginService.selectByUsername(username).getEmail();
//		System.out.println(email);
		
		loginService.updateCode(randomCode, username);
//		System.out.println(changeStatus);
//		System.out.println("---------------");	
		//sengEmail(email, username, randomCode);
//		System.out.println("1--------->"+changeStatus);
		SendEmail se = new SendEmail(email, username, randomCode);
		
//		se.start();  //配合SendEmail类中线程sleep，笨方法
//		try {
//			se.join();  //加入。 一个线程如果执行join语句，那么就有新的线程加入，执行该语句的线程必须要让步给新加入的线程先完成任务，然后才能继续执行。
//		} catch (InterruptedException e) {
//			e.printStackTrace();
//		}
		
		se.start();
		
//		System.out.println(se.isAlive()	);  //测试数据
//		try {
//			se.wait();
//		} catch (InterruptedException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
//		System.out.println(se.isAlive()	);
		
		
		synchronized(Thread.currentThread()){
			try {
				Thread.currentThread().setName(("sendEmailThread"));
//				System.out.println(Thread.currentThread());
				Thread.currentThread().wait(600000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
//		System.out.println("2--------->"+changeStatus);
		List<String> list = new ArrayList();
		list.add(changeStatus);
		list.add(username);
		changeStatus="nullInfor";  
		return list;
	}
	
	@RequestMapping("/validate")
	@ResponseBody
	public String validate(@Param("username") String username, @Param("randomCode") String randomCode) {
		User user = loginService.selectByUsername(username);
		if (user != null) {
			if (user.getRandCode().equals(randomCode)) {
				changeStatus = "success";
				
				Thread thread = new Thread();
//				System.out.println(thread.getName());
				for (Thread t : Thread.getAllStackTraces().keySet()) { //获取线程池中所有的线程，并找到sendEmailThread线程
					if (t.getName().equals("sendEmailThread"))
						thread = t;
					}
//				System.out.println(thread.getName());
				synchronized (thread) {
					thread.notify();
				}

				return "验证成功，请回到页面进行修改";
				
			} else {
				changeStatus = "errorCode";
				return "验证码错误";
			}
		} else {
			changeStatus = "errorUser";
			return "用户错误";
		}
	}
	
	
	@RequestMapping("/updatePass")
	@ResponseBody
	public String updatePass(@RequestParam("newPass")String newPass,@RequestParam("getUserInfor2") String getUserInfor2){
		if(loginService.updatePassword(getUserInfor2, newPass)!=0)
			return "yes";
		else
			return "no";
	}
	
	// 閭欢鍙戦�佺▼搴�
//		private void sengEmail(String email, String username, String randomCode) {
//			System.out.println("111");
//			// 鏀朵欢浜虹數瀛愰偖绠�
//			String to = email;
//
//			// 鍙戜欢浜虹數瀛愰偖绠�
//			String from = "a823990448@163.com";// hellojulang@163.com
//
//			// 鎸囧畾鍙戦�侀偖浠剁殑涓绘満涓�
//			String host = "smtp.163.com";
//
//			// 鑾峰彇绯荤粺灞炴��
//			Properties properties = System.getProperties();
//
//			// 璁剧疆閭欢鏈嶅姟鍣�
//			properties.setProperty("mail.smtp.host", host);
//
//			properties.put("mail.smtp.auth", "true");
//			// 鑾峰彇榛樿session瀵硅薄
//			Session session = Session.getDefaultInstance(properties, new Authenticator() {
//				public PasswordAuthentication getPasswordAuthentication() {
//					return new PasswordAuthentication("a823990448@163.com", "zlf123456"); // 鍙戜欢浜洪偖浠剁敤鎴峰悕銆佸瘑鐮�
//				}
//			});
//
//			try {
//				// 鍒涘缓榛樿鐨� MimeMessage 瀵硅薄
//				MimeMessage message = new MimeMessage(session);
//
//				// Set From: 澶撮儴澶村瓧娈�
//				message.setFrom(new InternetAddress(from));
//
//				// Set To: 澶撮儴澶村瓧娈�
//				message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
//
//				// Set Subject: 澶撮儴澶村瓧娈�
//				message.setSubject("淇敼瀵嗙爜");
//
//				// 璁剧疆娑堟伅浣�
//				// message.setText("娆㈣繋鎮ㄦ敞鍐�");
////				message.setContent("<input type=\"text\" id=\"newPassword\"><a href='http://localhost:8080/OnlineExamSystem/login/validate?username=" + username
////						+ "&randomCode=" + randomCode + "&newPassword=$(\"#newPassword\").val().trim()'>淇敼瀵嗙爜</a>", "text/html;charset=utf-8");
//				message.setContent("<input type=\"text\" id=\"newPassword\"><a href='http://localhost:8080/OnlineExamSystem/login/validate?username=" + username
//						+ "&randomCode=" + randomCode + "&newPassword=123123'>淇敼瀵嗙爜</a>", "text/html;charset=utf-8");
//
//				// 鍙戦�佹秷鎭�
//				Transport.send(message);
//			} catch (MessagingException mex) {
//				mex.printStackTrace();
//			}
//		}
}
