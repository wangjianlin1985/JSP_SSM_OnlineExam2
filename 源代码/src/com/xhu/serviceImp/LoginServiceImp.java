package com.xhu.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.xhu.dao.LoginDao;
import com.xhu.entity.SelectInfor;
import com.xhu.entity.User;
import com.xhu.exception.InsertException;
import com.xhu.service.LoginService;

@Service

public class LoginServiceImp implements LoginService{
	@Autowired
	private LoginDao loginDao;

	@Override
	public User selectByUsername(String username) {
		return loginDao.selectByUsername(username);
	}
	
	//注册、事务回滚
	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW,timeout=2)
	public int insertUser(String username, String password, String cnUser,String email, int clazz, int department,String role) {
		int insertNum = 0;
		int insertUserNum = 0;
		int insertStudentNum = 0;
		String randomID = (int)(Math.random()*90000+10000)+"";      //自动生成学号     0<=Math.random()<0  10000~99999  random*(b-a+1)+a
		try {
			try {
				insertNum = loginDao.insertUser(username, password,email);
			} catch (Exception e) {
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();    //手动回滚
				throw new InsertException("账号已被注册");
			}
			if(insertNum>0){
				int roleID = loginDao.searchRoleID(role);
				int UserID = loginDao.searchUserID(username);
				try {
					insertUserNum = loginDao.insertUserRole(roleID, UserID);                   //账户分配角色
				} catch (Exception e) {
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();    //手动回滚
					throw new InsertException("操作失败");
				}
				try {
					insertStudentNum = loginDao.insertstudent(cnUser,randomID,clazz, department, username);    //账户关联学生信息
				} catch (Exception e) {
					insertStudentNum = -1;
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();    //手动回滚
					throw new InsertException("操作失败，请重新操作");
				}
			}
		} catch (Exception e) {
		}finally {
			return insertStudentNum;  //向controller层返回操作信息;
		}
		
		
//		try{
//		insertNum = loginDao.insertUser(username, password);  //添加账户信息
//		if(insertNum>0){
//			int roleID = loginDao.searchRoleID(role);
//			int UserID = loginDao.searchUserID(username);
//			
//			insertUserNum = loginDao.insertUserRole(roleID, UserID);  //账户分配角色
//			
//			insertStudentNum = loginDao.insertstudent(cnUser,randomID,clazz, department, username); //账户关联学生信息
//		}
//		return insertStudentNum;
//	}catch(Exception e){
//		//捕获异常，回滚
//		//throw new InsertException("插入异常");  
//		TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();    //手动回滚
//	}
//	finally {
//		System.out.println(insertNum);
//		return insertStudentNum;   //返回信息不完善
//	}
		
	}

	
	
	@Override
	public List<SelectInfor> getClazzInfor() {
		List<SelectInfor>  list = loginDao.searchClazz();
		return list;
	}

	@Override
	public List<SelectInfor> getDepartmentInfor() {
		List<SelectInfor> list = loginDao.searchDepartment();
		return list;
	}

	@Override
	public int updateCode(String randomCode, String username) {
		return loginDao.updateCode(username,randomCode);
	}

	@Override
	public int updatePassword(String username, String newPassword) {
		return loginDao.updatePassword(username,newPassword);
	}

	
}
