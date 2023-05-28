package com.xhu.service;

import java.util.List;

import com.xhu.entity.SelectInfor;
import com.xhu.entity.User;

public interface LoginService {
	public User selectByUsername(String username);
	
	public int insertUser(String username,String password,String cnUser,String email,int clazz,int department,String role);
	
	public List<SelectInfor> getClazzInfor();
	public List<SelectInfor> getDepartmentInfor();
	
	public int updateCode(String randomCode,String username);
	public int updatePassword(String username, String newPassword);
}
