package cn.service;

import cn.entity.Firm;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by 53191 on 2018/12/18.
 */
public interface FirmService {

    public PageInfo<Firm> getAllFirm(Integer audit, Integer pageNum, Integer pageSize);

    int shenhe(Integer id);

    int deleteByPrimaryKey(Integer id);

    int insertSelective(Firm record);

    public Firm login(String firmid, String password);

    Firm selectByPrimaryKey(Integer id);
}
