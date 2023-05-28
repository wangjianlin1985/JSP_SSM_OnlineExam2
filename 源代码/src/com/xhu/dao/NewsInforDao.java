package com.xhu.dao;

import java.util.List;

import com.xhu.entity.News;

public interface NewsInforDao {
    /**
     * 分页查询
     * @param q
     * @return
     */
    public List<News> searchNews(News n);
    /**
     * 查询总条数
     * @param q
     * @return
     */
    public int searchCount(News n);
}
