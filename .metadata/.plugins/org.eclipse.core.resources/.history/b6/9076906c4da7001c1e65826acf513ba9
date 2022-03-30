package cn.controller;

import cn.service.impl.ManagerServiceImpl;
import cn.tool.Const;
import com.github.pagehelper.PageInfo;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.entity.Manager;
import cn.service.ManagerService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class ManagerController {
	@Autowired
	private ManagerService managerService;
	 @RequestMapping("getManagerById")
    public String getManagerById(Integer id,Model model){
  	    Manager manager=managerService.getManagerById(id);
  	    model.addAttribute("manager", manager);
  	    return "MyJsp";
    }

	@RequestMapping("login")
	public  String login(Manager manager){
		Manager m=managerService.login(manager.getUsername(),manager.getPassword());
		if (m==null){
			return "managers/login";
		}else {
			return "redirect:"+Const.ROOT01+"admin/select";
		}
	}
	@RequestMapping("logout")
	public  String logout(){
		return "redirect:"+Const.ROOT01+"managers/login.jsp";
		
	}
	
	@RequestMapping("select")
	public  String select(String username,Integer pageIndex, Model model){
		if (username==null && username==""){
			username = "";
		}
		if(pageIndex==null||pageIndex<0){
			pageIndex=1;
		}
		Integer pageSize=Const.pageSize;
		PageInfo<Manager> pageInfo=managerService.getAllManager(username,pageIndex,pageSize);
		List<Manager> managers=pageInfo.getList();
		model.addAttribute("managers",managers);
		model.addAttribute("pageInfo",pageInfo);
		return "managers/index";
	}
	
	@RequestMapping("delete")
	@ResponseBody
	public int deleteByPrimaryKey(Integer id){
		int con=managerService.deleteByPrimaryKey(id);
//		Map<String,Integer> map=new HashMap<String, Integer>();
//		map.put("con",con);
		return con;
	}

	@RequestMapping("toupdate")
	@ResponseBody
	public Manager selectByPrimaryKey(Integer id){
		Manager manager=managerService.getManagerById(id);
		if(manager!=null){
			return manager;
		}else{
			return null;
		}
	}

	@RequestMapping("doupdate")
	public String updateByPrimaryKeySelective(Manager manager){
		int con=managerService.updateByPrimaryKeySelective(manager);
		if(con>0){
			return "redirect:"+ Const.ROOT01+"admin/select";
		}else {
			return null;
		}
	}

	@RequestMapping("doadd")
	public String insertSelective(Manager manager){
		int con=managerService.insertSelective(manager);
		if(con>0){
			return "redirect:"+ Const.ROOT01+"admin/select";
		}else {
			return null;
		}
	}
}
