package cn.service;

import cn.entity.Deliver;

import java.util.List;

public interface DeliverService {

    int insertSelective(Deliver record);

    public List<Deliver> getDeliver(String firm);

    int updateByPrimaryKeySelective(Deliver record);

    public List<Deliver> getUserDeliver(Integer id);
}