package com.xhu.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.xhu.entity.Paper;
import com.xhu.entity.QuestionPaper;

public interface PaperService {

	HashMap<String, Object> searchPaper(Paper q);

	List<QuestionPaper> showPaper(int id);

	public void insertPaper(String name, int time, int score,Date createtime);

	Paper getid(String name);

	void insertpid(String pid, String qid);
	public boolean delservice(String iddarr);
	//����Ծ����Ƿ��ظ�
	public int checkpapername(String name);
}
