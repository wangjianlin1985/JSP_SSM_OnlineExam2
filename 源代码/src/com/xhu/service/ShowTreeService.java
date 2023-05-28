package com.xhu.service;

import java.util.HashMap;
import java.util.List;

import com.xhu.entity.Node;
import com.xhu.entity.Permission;
import com.xhu.entity.User;

public interface ShowTreeService {

	public List<Node> createPerTree();

	public int insert(String[] ss,String name);

	public HashMap<String, Object> selectUser(User s);

	public int saverole(String username,int rolename);

	public int addpermission(Permission p);

	public int sss();


}
