package cn.controller;

import cn.entity.Firm;
import cn.entity.Reply;
import cn.entity.User;
import cn.service.ReplyService;
import cn.tool.Const;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/reply")
public class ReplyController {

    @Autowired
    private ReplyService replyService;

    @RequestMapping("getAllReply")
    public String getAllReply(@RequestParam(value = "rname",required=false)  String rname,Integer pageIndex, Model model){
        if(pageIndex==null||pageIndex<0){
            pageIndex=1;
        }
        Integer pageSize= Const.pageSize;
        PageInfo<Reply> pageInfo=replyService.getAllReply(rname,pageIndex,pageSize);
        List<Reply> replys=pageInfo.getList();
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("replys",replys);
        return "managers/reply";
    }

    @RequestMapping("delete")
    @ResponseBody
    public int deleteByPrimaryKey(Integer id){
        int con=replyService.deleteByPrimaryKey(id);
        return con;
    }

    @RequestMapping("doadd")
    public String insertSelective(HttpSession session, Reply reply){
        String name=((Firm)session.getAttribute("user")).getName();
        reply.setRname(name);
        reply.setFtime(Const.getCurrentTime());
        int con=replyService.insertSelective(reply);
        if(con>0){
            return "redirect:"+ Const.ROOT01+"note/getNote";
        }else {
            return null;
        }
    }

    @RequestMapping("addReply")
    public String addReply(Integer nid,Model model){
        model.addAttribute("nid",nid);
        return "addReply";
    }

    @RequestMapping("getNoteReply")
    public String getNoteReply(HttpSession session,Model model){
        String name=((User)session.getAttribute("user")).getName();
        List<Reply> replys=replyService.getNoteReply(name);
        model.addAttribute("replys",replys);
        return "Reply";
    }

}
