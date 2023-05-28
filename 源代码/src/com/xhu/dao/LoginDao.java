package com.xhu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xhu.entity.SelectInfor;
import com.xhu.entity.User;

public interface LoginDao {
	public User selectByUsername(@Param("username")String username);
	
	public int insertUser(@Param("username")String username,@Param("password")String password,@Param("email")String email);
	public int insertstudent(@Param("cnUser")String cnUser,@Param("stuID")String stuID,@Param("clazzID")int clazzID,@Param("departmentID")int departmentID,@Param("username")String username);
	public int searchRoleID(@Param("role")String role);
	public int searchUserID(@Param("userID")String username);
	public int insertUserRole(@Param("roleID") int roleID,@Param("userID")int userID);
	
	
	public List<SelectInfor> searchClazz();
	public List<SelectInfor> searchDepartment();
	
	
	public int searchClazzId(@Param("clazzName")String clazzName);
	public int searchDeparId(@Param("department")String department);

	public int updateCode(@Param("username")String username, @Param("randomCode")String randomCode);

	public int updatePassword(@Param("username")String username, @Param("newPassword")String newPassword);

}
