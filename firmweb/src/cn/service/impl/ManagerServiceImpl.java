package cn.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.dao.ManagerMapper;
import cn.entity.Manager;
import cn.service.ManagerService;

import java.util.List;

@Service("managerService")
public class ManagerServiceImpl implements ManagerService{
	@Autowired
	ManagerMapper managerMapper;
	public Manager getManagerById(Integer id){
		Manager manager=managerMapper.selectByPrimaryKey(id);
		return manager;
	}


	public Manager login(String username, String password) {
		Manager manager=managerMapper.getLoginManager(username);
		if(null != manager){
			if(!manager.getPassword().equals(password))
				manager = null;
		}
		return manager;
	}

	public PageInfo<Manager> getAllManager(String username, Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum,pageSize);
		List<Manager> list=managerMapper.getAllManager(username);
		PageInfo<Manager> pageInfo=new PageInfo<Manager>(list);
		return pageInfo;
	}

	public List<Manager> select() {
		return managerMapper.select();
	}

	
	public int deleteByPrimaryKey(Integer id) {
		return managerMapper.deleteByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(Manager record) {
		return managerMapper.updateByPrimaryKeySelective(record);
	}

	
	public int insertSelective(Manager record) {
		return managerMapper.insertSelective(record);
	}

	
	public int insert(Manager record) {
		return managerMapper.insert(record);
	}
}
