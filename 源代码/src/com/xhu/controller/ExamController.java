package com.xhu.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xhu.entity.QuestionPaper;
import com.xhu.entity.Shortanswer;
import com.xhu.entity.Texam;
import com.xhu.service.ExamService;
import com.xhu.service.PaperService;
import com.xhu.service.QuestionService;
import com.xhu.service.StudentService;
import com.xhu.service.TeaxmService;

//���Կ�����
@Controller
public class ExamController {

	@Autowired
	private TeaxmService exam;

	@Autowired
	PaperService paperService;

	@Autowired
	private QuestionService qservice;

	
	@RequestMapping("startexam.do")
	public String startexam(@RequestParam("papername")String examname,HttpServletRequest re) {
		HttpSession session = re.getSession();
		session.setAttribute("examname", examname);
		return "startexam";
	}

	
	@RequestMapping("exam.do")
	public String exam() {
		return "OnlineExam";
	}

	
	@RequestMapping("getpaperid")
	@ResponseBody
	public HashMap<String, Object> getPaperId(@RequestParam("stuid") String stuid,
			@RequestParam("stuname") String stuname, HttpServletRequest re) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		HttpSession session = re.getSession();
		String examname = (String) session.getAttribute("examname");
		Texam te = exam.getPaperId(stuid,examname);
		map.put("paperid", te.getPaperId());
		map.put("papername", te.getExamName());
		
		session.setAttribute("stuid", stuid);
		session.setAttribute("stuname", stuname);
		return map;
	}

	
	@RequestMapping("getpaper.do")
	public String getpaper(@RequestParam("paperid") int paperid, HttpServletRequest re) {
		HttpSession session = re.getSession();
		session.setAttribute("paperid", paperid);
		int time = exam.getPaperTime(paperid) * 60;
		session.setAttribute("time", time);
		return "OnlineExam";
	}

	
	@RequestMapping("delanswer.do")
	@ResponseBody
	public String delanswer(@RequestParam("arr") String arranswer, @RequestParam("pId") int paperid,
			HttpServletRequest re) {
		
		String shortaw = "";
		int allscore = 0;
		List<QuestionPaper> list = paperService.showPaper(paperid);
		
		List<String> answer = new ArrayList<>();
		
		List<Integer> score = new ArrayList<>();
		
		List<String> shortanswer = new ArrayList<>();
		
		if (arranswer != "") {
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getQ().getqType() != 4) {
					answer.add(list.get(i).getQ().getAnswer());
					score.add(list.get(i).getQ().getScore());
					// System.out.println(list.get(i).getP().getPaperName());
				}
			}

			String[] str = {};
			str = arranswer.split(",");
			List<String> listanswer = Arrays.asList(str);
			for (int i = 0; i < answer.size(); i++) {
				if (answer.get(i).equals(listanswer.get(i))) {
					allscore += score.get(i);// �͹����ܷ�
				}
			}

			
			for (int i = answer.size(); i < listanswer.size(); i++) {
				shortanswer.add(listanswer.get(i));
				shortaw += listanswer.get(i) + "&&";
			}
			
			String papername = list.get(0).getP().getPaperName();
			re.getSession().setAttribute("paperName", papername);
			
			String stuid = (String) re.getSession().getAttribute("stuid");
			
			String stuname = (String) re.getSession().getAttribute("stuname");
			
			exam.insertShortAnswer(stuid, shortaw, allscore, stuname, papername);
			
			exam.updateExamStatu(stuid,papername);
			return "success";
		} else {
			return "erorr";
		}

	}

	
	@RequestMapping("readpaper.do")
	public String readpaper() {
		return "Readpaper";
	}

	
	@RequestMapping("read.do")
	@ResponseBody
	public HashMap<String, Object> read(@RequestParam("papername") String papername, Shortanswer sh,
			@RequestParam("paperid") int paperid,HttpServletRequest re) {
		HttpSession session = re.getSession();
		sh.setPapername(papername);
		int num1 = qservice.getshortnum(paperid);
		String si = String.valueOf(num1);
		//System.out.println(num1);
		session.setAttribute("num", si);
		return exam.getShortAnswer(sh);
	}

	@RequestMapping("doaddscore.do")
	@ResponseBody
	public String doAddScore(@RequestParam("score") String score, @RequestParam("stuid") String stuid,
			@RequestParam("obscore") int obscore,@RequestParam("papername")String papername) {
		int num = exam.upDateAllScore(score, stuid, obscore,papername);
		if(num>0){
			return "success";
		}
		return "eorro";
	}
	@RequestMapping("redo.do")
	public String redirict(){
		return "Examsuccess";
	}
}
