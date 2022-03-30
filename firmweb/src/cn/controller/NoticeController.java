package cn.controller;

import cn.entity.Notice;
import cn.service.NoticeService;
import cn.tool.Const;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
//访问路径
@RequestMapping("/notice")
public class NoticeController {
    @Autowired
    private NoticeService noticeService;

    //跳转到一个jsp页面
    @RequestMapping("getAllNotice")
    
    public String getAllNotice(@RequestParam(value = "title",required=false)  String title,Integer pageIndex, Model model){
        if(pageIndex==null||pageIndex<0){
            pageIndex=1;
        }
        Integer pageSize=Const.pageSize;
        PageInfo<Notice> pageInfo=noticeService.getAllNotice(title,pageIndex,pageSize);
        List<Notice> notices=pageInfo.getList();
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("notices",notices);
        return "managers/notice";
    }

    @RequestMapping("doadd")
    public String insertSelective(Notice notice){
        notice.setNtime(Const.getCurrentTime());
        int con=noticeService.insertSelective(notice);
        if(con>0){
            return "redirect:"+ Const.ROOT01+"notice/getAllNotice";
        }else {
            return null;
        }
    }

    @RequestMapping("toupdate")
    @ResponseBody
    public Notice selectByPrimaryKey(Integer id){
        Notice notice=noticeService.selectByPrimaryKey(id);
        if(notice!=null){
            return notice;
        }else{
            return null;
        }
    }

    @RequestMapping("doupdate")
    public String updateByPrimaryKeySelective(Notice notice){
        notice.setNtime(Const.getCurrentTime());
        int con=noticeService.updateByPrimaryKeySelective(notice);
        if(con>0){
            return "redirect:"+ Const.ROOT01+"notice/getAllNotice";
        }else {
            return null;
        }
    }

    @RequestMapping("delete")
    @ResponseBody
    public int deleteByPrimaryKey(Integer id){
        int con=noticeService.deleteByPrimaryKey(id);
        return con;
    }
}
