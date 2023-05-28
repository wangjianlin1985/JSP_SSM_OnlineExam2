package com.xhu.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xhu.entity.Node;
import com.xhu.entity.Permission;
import com.xhu.entity.User;
import com.xhu.service.ShowTreeService;

@Controller
@Transactional
public class PermissionController {
	@Autowired
	private ShowTreeService service;
	@RequestMapping("distributeperm.do")
	public String distributeperm(){
		return "distributeperm";
	}
	@RequestMapping("usermanage.do")
	public String usermanage(){
		return "usermanage";
	}
	@RequestMapping("addone.do")
	public String addone(){
		return "addone";
	}
	@RequestMapping("power.do")
	@ResponseBody
	public List<Node> power(){
		return service.createPerTree();
	}
	@RequestMapping("selectUser.do")
	@ResponseBody
	public HashMap<String, Object> selectUser(User s){
		
		return service.selectUser(s);
	}
	@RequestMapping("sss.do")
	@ResponseBody
	public int sss(){
		return service.sss();
	}
	@RequestMapping("adds.do")
	@ResponseBody
	public String add(Permission p){
		int r = service.addpermission(p);
		if(r>0){
			return "success";
		}else{
			return "failed";
		}
		
	}
	@RequestMapping("insert.do")
	@ResponseBody
	public String insert(HttpServletRequest request,@RequestParam("name")String name){
		String[] ss = request.getParameterValues("arr[]");
		int r = service.insert(ss,name);
		if(r>0){
			return "success";
		}else{
			return "failed";
		}
	}
	@RequestMapping(method = RequestMethod.POST,value="saverole.do")
	@ResponseBody
	public String saverole(@RequestParam(value="user")String username,@RequestParam(value="roleid")String rolename){
		int roleid=Integer.parseInt(rolename);
		int r=service.saverole(username,roleid);
		if(r>0){
			return "success";
		}else{
			return "failed";
		}
	}
}
