package com.xhu.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xhu.entity.Paper;
import com.xhu.entity.QuestionPaper;
import com.xhu.service.PaperService;

@Controller
public class PaperController {

	@Autowired
	PaperService paperService;

	@RequestMapping(value = "paperPage.do")
	public String paperPage() {
		return "paper";
	}

	@RequestMapping(value = "searchPaper.do")
	@ResponseBody
	public HashMap<String, Object> searchPaper(Paper p) {
		return paperService.searchPaper(p);
	}

	/**
	 * 预览试卷
	 * 
	 * @param p
	 * @returnsaveExam.do
	 */
	@RequestMapping(value = "showPaper.do")
	@ResponseBody
	public List<QuestionPaper> showPaper(@RequestParam("pId") int pId) {
		return paperService.showPaper(pId);
	}

	// 生成试卷
	@RequestMapping(value = "createPaper.do")
	@ResponseBody
	public String createPaper(@RequestParam("type") String type, @RequestParam("data") String data,
			@RequestParam("qname") String qname, @RequestParam("qTime") int qTime, @RequestParam("score") int score,
			@RequestParam("createTime")Date createTime) {
		//Date createTime = new Date();
		int num =  paperService.checkpapername(qname);
		if(num!=0){
			return "error";
		}
		paperService.insertPaper(qname, qTime, score, createTime);
		Paper paper = paperService.getid(qname);
		// System.out.println(paper.getpId());
		paperService.insertpid(data,paper.getPaperId()+"");
		return "success";
	}
	@RequestMapping("delpaper.do")
	@ResponseBody
	public boolean del(String iddarr) {
		return paperService.delservice(iddarr);
	}
	//检查试卷名称
/*	@RequestMapping("check.do")
	@ResponseBody
	public String check(String name) {
		
		return "success";
	}*/
}
