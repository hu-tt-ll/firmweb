package cn.service.impl;

import cn.dao.FirmMapper;
import cn.entity.Firm;
import cn.service.FirmService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 53191 on 2018/12/18.
 */
@Service("firmservice")
public class FirmServiceImpl implements FirmService{
    @Autowired
    FirmMapper firmMapper;



    public PageInfo<Firm> getAllFirm(Integer audit, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Firm> list=firmMapper.getAllFirm(audit);
        PageInfo<Firm> pageInfo=new PageInfo<Firm>(list);
        return pageInfo;
    }

    public int shenhe(Integer id) {
        return firmMapper.shenhe(id);
    }

   
    public int deleteByPrimaryKey(Integer id) {
        return firmMapper.deleteByPrimaryKey(id);
    }

    public int insertSelective(Firm record) {
        return firmMapper.insertSelective(record);
    }

  
    public Firm login(String firmid, String password) {
        Firm firm=firmMapper.getLoginFirm(firmid);
        if(null != firm){
            if(!firm.getPassword().equals(password)) {
                firm = null;
            }
        }
        return firm;
    }

  
    public Firm selectByPrimaryKey(Integer id) {
        return firmMapper.selectByPrimaryKey(id);
    }
}
