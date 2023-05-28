package com.xhu.dao;

import java.util.LinkedList;

import org.apache.ibatis.annotations.Param;

import com.xhu.entity.Node;

//import ch.qos.logback.classic.net.SyslogAppender;

public interface PermissionMapper {

	public LinkedList<Node> searchPer(@Param("username")String username);
}
