package com.xhu.serviceImp;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhu.dao.TeacherMapper;
import com.xhu.dao.TexamMapper;
import com.xhu.dao.UserMapper;
import com.xhu.entity.Teacher;
import com.xhu.entity.Texam;
import com.xhu.entity.User;
import com.xhu.service.ExamService;
@Service
public class ExamServiceImp implements ExamService {
   @Autowired
   TexamMapper texamMapper;
   @Autowired
   UserMapper userMapper;
   @Autowired
   TeacherMapper teacherMapper;
  
	@Override
	public HashMap<String, Object> searchExams(Texam e) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		//����ҳ��
		e.setPage(e.getRows()*(e.getPage()-1));
		
		map.put("total", texamMapper.searchCount(e));
		map.put("rows", texamMapper.searchExam(e));
		return map;
	}
//ɾ������
	@Override
	public void delBats(Texam e) {
		texamMapper.delBat(e);
		
	}
//���濼��
	@Override
	public void saveExam(Texam e) {
		texamMapper.insert(e);
		
	}
//�޸Ŀ���
	@Override
	public void updateExam(Texam e) {
		texamMapper.updateExam(e);
		
	}
//���ݽ�ʦid����ѧ��id��Ϊ����俼��
	@Override
	public void insertExam(Texam e, List<String> list) {
	for(int i=0;i<list.size();i++) {
		e.setStuId(list.get(i));
		//���ر����ظ�
		if ( texamMapper.rechecking(e).size()==0) {
		texamMapper.insert(e);
	}
	}
	}
//ͨ���Ծ�id�ҵ�������Ϣ
	@Override
	public HashMap<String, Object> searchExams2(Texam e) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		//����ҳ��
		e.setPage(e.getRows()*(e.getPage()-1));
		
		map.put("total", texamMapper.searchCount2(e));
		map.put("rows", texamMapper.searchExam2(e));
		return map;
	}
	
	
	
	
	//根据username找userid
		@Override
		public User getUserIdByUsername(String username) {
			User user=userMapper.selectUserIdByUsername(username);
			System.out.println(user);
			return user;
		}
		//根据accountId找教授id
		@Override
		public Teacher getTeacherIdByUserId(Integer account_id) {
		
		  Teacher teacher=teacherMapper.selectTeacherIdByUserId(account_id);
		
			return teacher;
		}


}
