package cn.dao;

import cn.entity.Post;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PostMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Post record);

    int insertSelective(Post record);

    Post selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Post record);

    int updateByPrimaryKey(Post record);

    public List<Post> getAllPost(@Param("audit") Integer audit);

    int shenhe(Integer id);

    public List<Post> getPostFirm(@Param("post") String post,@Param("firm") String firm);

    public List<Post> getPost(String firm);
}