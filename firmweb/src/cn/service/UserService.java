package cn.service;

import cn.entity.User;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface UserService {

    public PageInfo<User> getAllUser(Integer audit, Integer pageNum, Integer pageSize);

    int deleteByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int shenhe(Integer id);

    int insertSelective(User record);

    public User login(String username, String password);
    
    public boolean getuser(String username);

    User selectByPrimaryKey(Integer id);

}