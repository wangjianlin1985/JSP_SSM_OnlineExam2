package com.xhu.dao;

import java.util.LinkedList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xhu.entity.Node;
import com.xhu.entity.Permission;
import com.xhu.entity.User;

public interface DistributePermMapper {

	public LinkedList<Node> searchPer();

	public int insert(@Param("sname") String sname,@Param("name")String name);

	public List<User> selectUser(User s);

	public int saverole(@Param("username")String username,@Param("roleid")int rolename);

	public int searchCount(User s);

	public List<String> selectP(@Param("name")String name);

	public int addpermission(Permission p);

	public int sss();


}
