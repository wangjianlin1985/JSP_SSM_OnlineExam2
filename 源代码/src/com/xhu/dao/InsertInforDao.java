package com.xhu.dao;

import org.apache.ibatis.annotations.Param;

public interface InsertInforDao {
	public int insertMsg(@Param("title")String title,@Param("context") String context,@Param("day") String day);
}
