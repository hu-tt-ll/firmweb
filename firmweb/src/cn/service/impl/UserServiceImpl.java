package cn.service.impl;

import cn.dao.UserMapper;
import cn.entity.User;
import cn.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 53191 on 2018/12/18.
 */

@Service("userservice")
public class UserServiceImpl implements UserService{
    @Autowired
    UserMapper userMapper;



    public PageInfo<User> getAllUser(Integer audit, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<User> list=userMapper.getAllUser(audit);
        PageInfo<User> pageInfo=new PageInfo<User>(list);
        return pageInfo;
    }

 
    public int deleteByPrimaryKey(Integer id) {
        return userMapper.deleteByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(User record) {
        return userMapper.updateByPrimaryKeySelective(record);
    }

  
    public int shenhe(Integer id) {
        return userMapper.shenhe(id);
    }

    public int insertSelective(User record) {
        return userMapper.insertSelective(record);
    }

    public User login(String username, String password) {
        User user=userMapper.getLoginUser(username);
        if(null != user){
            if(!user.getPassword().equals(password)) {
                user = null;
            }
        }
        return user;
    }

 
    public User selectByPrimaryKey(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }


	@Override
	public boolean getuser(String username) {
		boolean flag=false;
		 User user=userMapper.getLoginUser(username);
	        if(null != user){
	        	flag=true;
	        }
		return flag;
	}


}
