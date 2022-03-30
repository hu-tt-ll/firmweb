package cn.service;

import cn.entity.Notice;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface NoticeService {

    public PageInfo<Notice> getAllNotice(String title, Integer pageNum, Integer pageSize);

    public List<Notice> getNotice(String title);

    int insertSelective(Notice record);

    int updateByPrimaryKeySelective(Notice record);

    int deleteByPrimaryKey(Integer id);

    Notice selectByPrimaryKey(Integer id);
}
