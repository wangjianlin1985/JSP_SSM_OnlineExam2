package com.xhu.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xhu.entity.Node;
import com.xhu.entity.Question;
import com.xhu.service.QuestionService;
import com.xhu.service.TreeService;
@Controller
public class QuestionController {
	@Autowired
	private QuestionService service;

	@Autowired
	private TreeService treeService;
	@RequestMapping("main.do")
	public String mainView() {
		return "main";
	}

	@RequestMapping("questionPage.do")
	public String questionView() {
		return "question";
	}
	
	
	@RequestMapping(method = RequestMethod.GET, value = "createPreTree.do")
	@ResponseBody
	public List<Node> createPreTree(@RequestParam("username")String username) {
		return treeService.createPerTree(username);
	}
	
	
	// ������Ŀ
	@RequestMapping(value = "question.do")
	@ResponseBody
	public HashMap<String, Object> getSearchQuestion(Question q) {
		// System.out.println(q);
		return service.searchQueston(q);
	}

	// �����Ŀ
	@RequestMapping("add.do")
	@ResponseBody
	public String addQuestion(Question q) {
		int qid = q.getqId();
		int check = service.checkqid(qid);
		q.setQuestionCreateTime(new Date());
		if (check==0) {
			service.insertService(q);
			return "success";
		} else {
			return "error";
		}
	}

	// ������Ŀ
	@RequestMapping("update.do")
	@ResponseBody
	public String update(Question q) {
		service.update(q);
		System.out.println(q.getqId());
		return "success";

	}

	// ɾ����Ŀ
	@RequestMapping("delall.do")
	@ResponseBody
	public boolean del(String iddarr) {
		return service.delservice(iddarr);
	}

}
