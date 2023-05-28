package com.xhu.serviceImp;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhu.dao.PermissionMapper;
import com.xhu.entity.Node;
import com.xhu.service.TreeService;
import com.xhu.util.Tree;

@Service
public class TreeServiceImp implements TreeService{
	@Autowired
	private Tree tree;
	@Autowired
	private PermissionMapper permissionmapper;
	@Override
	public List<Node> createPerTree(String username) {
		LinkedList<Node> list = permissionmapper.searchPer(username);
		return tree.createTree(list);
	}
	
	

}
