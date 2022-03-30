package cn.service.impl;

import cn.dao.ReplyMapper;
import cn.entity.Reply;
import cn.service.ReplyService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 53191 on 2018/12/20.
 */

@Service("replyservice")
public class ReplyServiceImpl implements ReplyService {
    @Autowired
    ReplyMapper replyMapper;



    public PageInfo<Reply> getAllReply(String rname, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Reply> list=replyMapper.getAllReply(rname);
        PageInfo<Reply> pageInfo=new PageInfo<Reply>(list);
        return pageInfo;
    }

   
    public int deleteByPrimaryKey(Integer id) {
        return replyMapper.deleteByPrimaryKey(id);
    }



    public int insertSelective(Reply record) {
        return replyMapper.insertSelective(record);
    }

   
    public List<Reply> getNoteReply(String nname) {
        return replyMapper.getNoteReply(nname);
    }
}
