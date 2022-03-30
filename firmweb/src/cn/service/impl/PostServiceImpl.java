package cn.service.impl;

import cn.dao.PostMapper;
import cn.entity.Post;
import cn.service.PostService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 53191 on 2018/12/19.
 */
@Service("postservice")
public class PostServiceImpl implements PostService {

    @Autowired
    PostMapper postMapper;


  
    public PageInfo<Post> getAllPost(Integer audit, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Post> list=postMapper.getAllPost(audit);
        PageInfo<Post> pageInfo=new PageInfo<Post>(list);
        return pageInfo;
    }

 
    public int shenhe(Integer id) {
        return postMapper.shenhe(id);
    }

  
    public int deleteByPrimaryKey(Integer id) {
        return postMapper.deleteByPrimaryKey(id);
    }

 
    public PageInfo<Post> getPostFirm(String post,String firm,Integer pageNum,Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Post> list = postMapper.getPostFirm(post,firm);
        PageInfo<Post> pageInfo=new PageInfo<Post>(list);
        return  pageInfo;
    }

    public List<Post> getPost(String firm) {
        return postMapper.getPost(firm);
    }

 
    public int updateByPrimaryKeySelective(Post record) {
        return postMapper.updateByPrimaryKeySelective(record);
    }


    public Post selectByPrimaryKey(Integer id) {
        return postMapper.selectByPrimaryKey(id);
    }

  
    public int insertSelective(Post record) {
        return postMapper.insertSelective(record);
    }
}
