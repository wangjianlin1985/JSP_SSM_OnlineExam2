package com.xhu.serviceImp;

import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhu.dao.PaperMapper;
import com.xhu.dao.QuestionPaperMapper;
import com.xhu.entity.Paper;
import com.xhu.entity.QuestionPaper;
import com.xhu.service.PaperService;

@Service
public class PaperServiceImpl implements PaperService {

	@Autowired
	PaperMapper paperMapper;

	@Autowired
	QuestionPaperMapper qprelMapper;

	@Override
	public HashMap<String, Object> searchPaper(Paper q) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 计算页面
		q.setPage(q.getRows() * (q.getPage() - 1));
		//List<Paper> list = paperMapper.searchPaper(q);
		map.put("total", paperMapper.searchCount());
		map.put("rows", paperMapper.searchPaper(q));
		return map;
	}

	@Override
	public List<QuestionPaper> showPaper(int id) {
		// TODO Auto-generated method stub
		return qprelMapper.showPaper(id);
	}

	@Override
	public void insertPaper(String name, int time, int score, Date createTime) {
		Paper paper = new Paper();
		paper.setPaperName(name);
		paper.setPaperTime(time);
		paper.setAllscore(score);
		paper.setCreateTime(createTime);
		paperMapper.insert(paper);
	}

	@Override
	public void insertpid(String pid, String qid) {
		String[] str = {};
		str = pid.split(",");
		List<String> list = Arrays.asList(str);
		for (int i = 0; i < list.size(); i++) {
			qprelMapper.insertpid(list.get(i), qid);
		}
	}

	@Override
	public Paper getid(String name) {
		return paperMapper.selectByPrimaryKey(name);
	}

	@Override
	public boolean delservice(String iddarr) {
		String[] str = {};
		str = iddarr.split(",");
		List<String> list = Arrays.asList(str);
		int num1 = paperMapper.delqp(list);
		int num = paperMapper.del(list);
		if (num != 0 && num1 != 0) {
			return true;
		}
		return false;
	}

	// 检查试卷名是否重复
	@Override
	public int checkpapername(String name) {

		return paperMapper.checkname(name);
	}
}
