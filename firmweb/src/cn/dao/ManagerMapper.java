package cn.dao;

import cn.entity.Manager;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ManagerMapper {
    public int deleteByPrimaryKey(Integer id);

    int insert(Manager record);

    int insertSelective(Manager record);

    Manager selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Manager record);

    int updateByPrimaryKey(Manager record);

    public Manager getLoginManager(String username);

    public List<Manager> getAllManager(@Param("username") String username);

    public List<Manager> select();

}