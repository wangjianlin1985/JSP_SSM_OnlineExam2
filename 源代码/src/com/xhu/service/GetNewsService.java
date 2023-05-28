package com.xhu.service;

import java.util.HashMap;

import com.xhu.entity.News;

public interface GetNewsService {
	public HashMap<String, Object>  searchNews(News n);
}
