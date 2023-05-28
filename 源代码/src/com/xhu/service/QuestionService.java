package com.xhu.service;

import java.util.HashMap;

import com.xhu.entity.Question;

public interface QuestionService {

	HashMap<String,Object> searchQueston(Question q);

	public int insertService(Question q);
	
	public int update(Question q);
	
	boolean delservice(String iddarr);
	
	int getshortnum(int paperid);
	
	int checkqid(int qid);
}
