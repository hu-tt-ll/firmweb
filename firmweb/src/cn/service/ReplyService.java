package cn.service;

import cn.entity.Reply;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 53191 on 2018/12/20.
 */
public interface ReplyService {

    public PageInfo<Reply> getAllReply(String rname, Integer pageNum, Integer pageSize);

    int deleteByPrimaryKey(Integer id);


    int insertSelective(Reply record);

    public List<Reply> getNoteReply(String nname);
}
