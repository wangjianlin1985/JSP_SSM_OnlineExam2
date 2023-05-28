package com.xhu.service;

import java.util.HashMap;
import java.util.List;

import com.xhu.entity.Shortanswer;
import com.xhu.entity.Texam;

public interface TeaxmService {

	// ����Ծ�id
	public Texam getPaperId(String stuid,String papername);

	// ��ȡ����ʱ��
	public int getPaperTime(int paperid);
	//�����
	public int insertShortAnswer(String stuid, String shortanswer, int score,String stuname,String papername);
	//���¿���״̬
	int updateExamStatu(String stuid,String papername);
	//��ȡ������
	HashMap<String, Object> getShortAnswer(Shortanswer sh);
	//�����ܳɼ�
	int upDateAllScore(String score,String stuid,int obscore,String papername);
	//�����ľ�״̬
}
