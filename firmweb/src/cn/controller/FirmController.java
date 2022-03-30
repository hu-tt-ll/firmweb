package cn.controller;

import cn.entity.Firm;
import cn.service.FirmService;
import cn.tool.Const;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by 53191 on 2018/12/18.
 */


@Controller
@RequestMapping("/firm")
public class FirmController {
    @Autowired
    private FirmService firmService;

    @RequestMapping("getAllFirm")
    public String getAllFirm(@RequestParam(value = "audit",required=false) Integer audit,Integer pageIndex, Model model){
        if(pageIndex==null||pageIndex<0){
            pageIndex=1;
        }
        Integer pageSize=Const.pageSize;
        PageInfo<Firm> pageInfo=firmService.getAllFirm(audit,pageIndex,pageSize);
        List<Firm> firms=pageInfo.getList();
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("firms",firms);
        return "managers/firm";
    }

    @RequestMapping("update/{id}")
    public String shenhe(@PathVariable("id")  int id){
        int con=firmService.shenhe(id);
        if(con>0){
            return "redirect:"+ Const.ROOT01+"firm/getAllFirm";
        }else {
            return null;
        }
    }

    @RequestMapping("delete")
    @ResponseBody
    public int deleteByPrimaryKey(Integer id){
        int con=firmService.deleteByPrimaryKey(id);
        return con;
    }

    @RequestMapping("doadd")
    public String insertSelective(Firm firm){
        firm.setAudit(0);
        firm.setIsdel(0);
        int con=firmService.insertSelective(firm);
        if(con>0){
            return "redirect:"+ Const.ROOT01+"user/tologin";
        }else {
            return null;
        }
    }

    @RequestMapping("login")
    public  String login(Firm firm){
        Firm m=firmService.login(firm.getFirmid(),firm.getPassword());
        if (m==null){
            return "redirect:"+Const.ROOT01+"user/tologin";
        }else {
            return "redirect:"+Const.ROOT01+"panduan/getNotice";
        }
    }
}
