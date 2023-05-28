package com.xhu.serviceImp;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhu.dao.QuestionMapper;
import com.xhu.dao.QuestionPaperMapper;
import com.xhu.entity.Question;
import com.xhu.service.QuestionService;

@Service
public class QuestionServiceImp implements QuestionService {

	@Autowired
	private QuestionMapper questionmapper;

	@Autowired
	private QuestionPaperMapper qp;

	@Override
	public HashMap<String, Object> searchQueston(Question q) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		q.setPage(q.getRows() * (q.getPage() - 1));
		// List<Question> list = questionmapper.searchQuestion(q);
		// TODO Auto-generated method stub
		map.put("total", questionmapper.searchCount(q));
		map.put("rows", questionmapper.searchQuestion(q));
		return map;
	}

	// 添加题目
	@Override
	public int insertService(Question q) {
		return questionmapper.insertSelective(q);
	}

	// 修改题目
	@Override
	public int update(Question q) {

		return questionmapper.updateByPrimaryKeySelective(q);
	}

	@Override
	public boolean delservice(String iddarr) {
		String[] str = {};
		str = iddarr.split(",");
		List<String> list = Arrays.asList(str);
		int num = questionmapper.del(list);
		if (num > 0) {
			return true;
		}
		return false;
	}

	@Override
	public int getshortnum(int paperid) {
		return qp.selectnum(paperid);
	}

	@Override
	public int checkqid(int qid) {
		return questionmapper.checkQid(qid);
	}
}
