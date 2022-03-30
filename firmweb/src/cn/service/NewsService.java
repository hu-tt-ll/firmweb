package cn.service;

import cn.entity.News;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by 53191 on 2018/12/19.
 */
public interface NewsService {

    public PageInfo<News> getAllNews(String title, Integer pageNum, Integer pageSize);

    int insertSelective(News record);

    News selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(News record);

    int deleteByPrimaryKey(Integer id);

    public PageInfo<News> getNews(String title, Integer pageNum, Integer pageSize);
}
