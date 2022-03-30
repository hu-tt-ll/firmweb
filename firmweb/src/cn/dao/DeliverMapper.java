package cn.dao;

import cn.entity.Deliver;

import java.util.List;

public interface DeliverMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Deliver record);

    int insertSelective(Deliver record);

    Deliver selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Deliver record);

    int updateByPrimaryKey(Deliver record);

    public List<Deliver> getDeliver(String firm);

    public List<Deliver> getUserDeliver(Integer id);
}