package cn.controller;

import cn.entity.Firm;
import cn.entity.Post;
import cn.service.PostService;
import cn.tool.Const;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/post")
public class PostController {

    @Autowired
    private PostService postService;

    @RequestMapping("getAllPost")
    public String getAllPost(@RequestParam(value = "audit",required=false) Integer audit,Integer pageIndex, Model model){
        if(pageIndex==null||pageIndex<0){
            pageIndex=1;
        }
        Integer pageSize=Const.pageSize;
        PageInfo<Post> pageInfo=postService.getAllPost(audit,pageIndex,pageSize);
        List<Post> posts=pageInfo.getList();
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("posts",posts);
        return "managers/post";
    }

    @RequestMapping("update/{id}")
    public String shenhe(@PathVariable("id")  int id){
        int con=postService.shenhe(id);
        if(con>0){
            return "redirect:"+ Const.ROOT01+"post/getAllPost";
        }else {
            return null;
        }
    }

    @RequestMapping("delete")
    @ResponseBody
    public int deleteByPrimaryKey(Integer id){
        int con=postService.deleteByPrimaryKey(id);
        return con;
    }

    @RequestMapping("getPost")
    public String getPost(HttpSession session, Model model){
        String firm=((Firm)session.getAttribute("user")).getFirm();
        List<Post> posts=postService.getPost(firm);
        model.addAttribute("posts",posts);
        return "positions";
    }

    @RequestMapping("toupdate")
    public String selectByPrimaryKey(Integer id, Model model){
        Post post=postService.selectByPrimaryKey(id);
        model.addAttribute("post",post);
        if(post!=null){
            return "create";
        }else{
            return "create";
        }
    }

    @RequestMapping("toadd")
    public String toadd(){
        
            return "addcreate";
        
    }
    
    @RequestMapping("doupdate")
    public String updateByPrimaryKeySelective(Post post){
        int con=postService.updateByPrimaryKeySelective(post);
        if(con>0){
            return "redirect:"+ Const.ROOT01+"post/getPost";
        }else {
            return null;
        }
    }

    @RequestMapping("doadd")
    public String insertSelective(HttpSession session,Post post){
        String firm=((Firm)session.getAttribute("user")).getFirm();
        post.setFname(firm);
        post.setAudit(0);
        post.setIsdel(0);
        int con=postService.insertSelective(post);
        if(con>0){
            return "redirect:"+ Const.ROOT01+"post/getPost";
        }else {
            return null;
        }
    }

    @RequestMapping("dodelete")
    public String deleteByKey(Integer id){
        int con=postService.deleteByPrimaryKey(id);
        if(con>0){
            return "redirect:"+ Const.ROOT01+"post/getPost";
        }else {
            return null;
        }
    }
}
