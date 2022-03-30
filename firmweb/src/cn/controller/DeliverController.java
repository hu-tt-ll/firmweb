package cn.controller;

import cn.entity.Deliver;
import cn.entity.Firm;
import cn.entity.Post;
import cn.entity.User;
import cn.service.DeliverService;
import cn.service.FirmService;
import cn.service.PostService;
import cn.tool.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/deliver")
public class DeliverController {

    @Autowired
    private DeliverService deliverService;



    @RequestMapping("doadd")
    public String insertSelective(Deliver deliver){
        deliver.setResult("未通过");
        deliver.setAudit(0);
        deliver.setIsdel(0);
        int con=deliverService.insertSelective(deliver);
        if(con>0){
            return "redirect:"+ Const.ROOT01+"panduan/getNotice";
        }else {
            return null;
        }
    }

    @RequestMapping("getDeliver")
    public String getDeliver(HttpSession session,Model model){
    	Object obj=session.getAttribute("user");
    	if(obj!=null){
	        String firm=((Firm)obj).getFirm();
	        List<Deliver> delivers=deliverService.getDeliver(firm);
	        model.addAttribute("delivers",delivers);
    	}
        return "toudi";
    }

    @RequestMapping("doupdate")
    public String updateByPrimaryKeySelective(Deliver deliver){
        deliver.setAudit(1);
        deliver.setResult("已通过");
        int con=deliverService.updateByPrimaryKeySelective(deliver);
        if(con>0){
            return "redirect:"+ Const.ROOT01+"deliver/getDeliver";
        }else {
            return null;
        }
    }

    @RequestMapping("getUserDeliver")
    public String getUserDeliver(HttpSession session,Model model){
        Integer user=((User)session.getAttribute("user")).getId();
        List<Deliver> delivers=deliverService.getUserDeliver(user);
        model.addAttribute("delivers",delivers);
        return "liebiao";
    }
}
