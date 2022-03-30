package cn.service;

import cn.entity.Post;
import com.github.pagehelper.PageInfo;


import java.util.List;

/**
 * Created by 53191 on 2018/12/19.
 */
public interface PostService {
    public PageInfo<Post> getAllPost(Integer audit, Integer pageNum, Integer pageSize);

    int shenhe(Integer id);

    int deleteByPrimaryKey(Integer id);

    public PageInfo<Post> getPostFirm(String post,String firm,Integer pageNum,Integer pageSize);

    public List<Post> getPost(String firm);

    int updateByPrimaryKeySelective(Post record);

    Post selectByPrimaryKey(Integer id);

    int insertSelective(Post record);

}
