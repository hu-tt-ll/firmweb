package cn.dao;

import cn.entity.Firm;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FirmMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Firm record);

    int insertSelective(Firm record);

    Firm selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Firm record);

    int updateByPrimaryKey(Firm record);

    public List<Firm> getAllFirm(@Param("audit") Integer audit);

    int shenhe(Integer id);

    public Firm getLoginFirm(String firmid);
}