package cn.service;

import cn.entity.Manager;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface ManagerService {
    public Manager getManagerById(Integer id);

    public Manager login(String username, String password);

    public PageInfo<Manager> getAllManager(String username,Integer pageNum,Integer pageSize);

    public List<Manager> select();

    public int deleteByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Manager record);

    int insertSelective(Manager record);

    int insert(Manager record);

}
