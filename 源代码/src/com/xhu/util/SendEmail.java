package com.xhu.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail extends Thread{
	private String email;
	private String username;
	private String randomCode;
	
	
	public SendEmail(String email, String username, String randomCode) {
		super();
		this.email = email;
		this.username = username;
		this.randomCode = randomCode;
	}


	@Override
	public void run() {
		this.sengEmail();
	}
	private void sengEmail() {
		String email = this.email;
		String username =this.username;
		String randomCode = this.randomCode;
		// 收件人电子邮箱
		String to = email;

		// 发件人电子邮箱
		String from = "a823990448@163.com";// hellojulang@163.com

		// 指定发送邮件的主机为
		String host = "smtp.163.com";

		// 获取系统属性
		Properties properties = System.getProperties();

		// 设置邮件服务器
		properties.setProperty("mail.smtp.host", host);

		properties.put("mail.smtp.auth", "true");
		// 获取默认session对象
		Session session = Session.getDefaultInstance(properties, new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("a823990448@163.com", "zlf123456"); // 发件人邮件用户名、密码
			}
		});

		try {
			// 创建默认的 MimeMessage 对象
			MimeMessage message = new MimeMessage(session);

			// Set From: 头部头字段
			message.setFrom(new InternetAddress(from));

			// Set To: 头部头字段
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// Set Subject: 头部头字段
			message.setSubject("修改密码");

			// 设置消息体
			// message.setText("欢迎您注册");
//			message.setContent("<input type=\"text\" id=\"newPassword\"><a href='http://localhost:8080/OnlineExamSystem/login/validate?username=" + username
//					+ "&randomCode=" + randomCode + "&newPassword=$(\"#newPassword\").val().trim()'>修改密码</a>", "text/html;charset=utf-8");
			message.setContent("<a href='http://192.168.2.117:8889/OnlineExamSystem/login/validate?username=" + username
					+ "&randomCode=" + randomCode + "'>点此验证。。。</a>", "text/html;charset=utf-8");

			// 发送消息
			Transport.send(message);
			/*Thread t= new Thread();
			try {
				t.sleep(30000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}

}
