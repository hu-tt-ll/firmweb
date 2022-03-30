package cn.service.impl;

import cn.dao.NoticeMapper;
import cn.entity.Notice;
import cn.service.NoticeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("noticeservice")
public class NoticeServiceImpl implements NoticeService{
    @Autowired
    NoticeMapper noticeMapper;


 
    public PageInfo<Notice> getAllNotice(String title, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Notice> list=noticeMapper.getAllNotice(title);
        PageInfo<Notice> pageInfo=new PageInfo<Notice>(list);
        return pageInfo;
    }


    public List<Notice> getNotice(String title) {
        return noticeMapper.getAllNotice(title);
    }

   
    public int insertSelective(Notice record) {
        return noticeMapper.insertSelective(record);
    }

  
    public int updateByPrimaryKeySelective(Notice record) {
        return noticeMapper.updateByPrimaryKeySelective(record);
    }

   
    public int deleteByPrimaryKey(Integer id) {
        return noticeMapper.deleteByPrimaryKey(id);
    }

 
    public Notice selectByPrimaryKey(Integer id) {
        return noticeMapper.selectByPrimaryKey(id);
    }
}
