package com.xhu.serviceImp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhu.dao.InsertInforDao;
import com.xhu.service.InsertMsgService;


@Service
public class InsertMsgServiceImp implements InsertMsgService {
	@Autowired
	private InsertInforDao insertInfor;

	@Override
	public int insertMsg(String title, String context, String day) {
		return insertInfor.insertMsg(title, context, day);
	}

}
