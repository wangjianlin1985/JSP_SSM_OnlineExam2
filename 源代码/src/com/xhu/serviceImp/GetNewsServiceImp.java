package com.xhu.serviceImp;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhu.dao.NewsInforDao;
import com.xhu.entity.News;
import com.xhu.service.GetNewsService;

@Service
public class GetNewsServiceImp implements GetNewsService {
	@Autowired
	private NewsInforDao nInfor;
	
	@Override
	public HashMap<String, Object> searchNews(News n) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		//获取数据库对应的页面首条记录地址
		//System.out.println(n.getRows()+" "+n.getPage());
		n.setPage(n.getRows()*(n.getPage()-1));
		map.put("total", nInfor.searchCount(n));
		map.put("rows", nInfor.searchNews(n));
		
		//System.out.println(nInfor.searchCount(n));
		//System.out.println(nInfor.searchNews(n));
		return map;
	}

}
