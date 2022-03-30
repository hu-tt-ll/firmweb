package cn.service.impl;

import cn.dao.NewsMapper;
import cn.entity.News;
import cn.service.NewsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 53191 on 2018/12/19.
 */

@Service("newsservice")
public class NewsServiceImpl implements NewsService {
    @Autowired
    NewsMapper newsMapper;


   
    public PageInfo<News> getAllNews(String title, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<News> list=newsMapper.getAllNews(title);
        PageInfo<News> pageInfo=new PageInfo<News>(list);
        return pageInfo;
    }

  
    public int insertSelective(News record) {
        return newsMapper.insertSelective(record);
    }

  
    public News selectByPrimaryKey(Integer id) {
        return newsMapper.selectByPrimaryKey(id);
    }

  
    public int updateByPrimaryKeySelective(News record) {
        return newsMapper.updateByPrimaryKeySelective(record);
    }

   
    public int deleteByPrimaryKey(Integer id) {
        return newsMapper.deleteByPrimaryKey(id);
    }

   
    public PageInfo<News> getNews(String title, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<News> list=newsMapper.getAllNews(title);
        PageInfo<News> pageInfo=new PageInfo<News>(list);
        return pageInfo;
    }


}
