package cn.service.impl;

import cn.dao.DeliverMapper;
import cn.entity.Deliver;
import cn.service.DeliverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 53191 on 2018/12/27.
 */
@Service("deliverService")
public class DeliverServiceImpl implements DeliverService {

    @Autowired
    DeliverMapper deliverMapper;

    
    public int insertSelective(Deliver record) {
        return deliverMapper.insertSelective(record);
    }

   
    public List<Deliver> getDeliver(String firm) {
        return deliverMapper.getDeliver(firm);
    }

   
    public int updateByPrimaryKeySelective(Deliver record) {
        return deliverMapper.updateByPrimaryKeySelective(record);
    }

    
    public List<Deliver> getUserDeliver(Integer id) {
        return deliverMapper.getUserDeliver(id);
    }


}
