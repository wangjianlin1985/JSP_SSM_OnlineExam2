package com.xhu.serviceImp;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhu.dao.PaperMapper;
import com.xhu.dao.ShortanswerMapper;
import com.xhu.dao.TexamMapper;
import com.xhu.entity.Shortanswer;
import com.xhu.entity.Texam;
import com.xhu.service.TeaxmService;

@Service
public class TexamServiceImp implements TeaxmService {

	@Autowired
	private TexamMapper exam;

	@Autowired
	private PaperMapper paper;
	@Autowired
	private ShortanswerMapper shortanswer;

	@Override
	public Texam getPaperId(String stuid,String papername) {

		return exam.selectpaperid(stuid,papername);
	}

	@Override
	public int getPaperTime(int paperid) {

		return paper.getpapertime(paperid);
	}

	@Override
	public int insertShortAnswer(String stuid, String shortanswer, int score, String stuname, String papername) {
		// TODO Auto-generated method stub
		return exam.insertShortAnswer(stuid, shortanswer, score, stuname, papername);
	}

	@Override
	public int updateExamStatu(String stuid,String papername) {
		// TODO Auto-generated method stub
		return exam.updateExamStatu(stuid,papername);
	}

	// ��ô���ѧ���б�
	@Override
	public HashMap<String, Object> getShortAnswer(Shortanswer sh) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		sh.setPage(sh.getRows() * (sh.getPage() - 1));
		map.put("total", shortanswer.searchShrotanswerCount(sh));
		map.put("rows", shortanswer.getShortAnswer(sh));
		return map;
	}

	@Override
	public int upDateAllScore(String score, String stuid, int obscore,String papername) {
		int num = 0;
		String[] str = {};
		str = score.split(",");
		List<String> list = Arrays.asList(str);
		for (int i = 0; i < list.size(); i++) {
			num += Integer.parseInt(list.get(i).trim());
		}
		num += obscore;
		//�����״̬
		shortanswer.updatestatu(stuid,papername);
		return exam.updateAllscore(num, stuid,papername);
	}
}
