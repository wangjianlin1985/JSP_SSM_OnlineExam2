package com.xhu.serviceImp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhu.dao.UpdateInforDao;
import com.xhu.entity.User;
import com.xhu.service.UpdateInforService;

@Service
public class UpdateInforServiceImp implements UpdateInforService {
	@Autowired
	private UpdateInforDao upDao;
	
	@Override
	public int updateInfor(User user) {
		int number = 0;
		number = upDao.updateInfor(user);
		return number;
	}
}
