package cn.controller;

import cn.entity.Firm;
import cn.entity.Notice;
import cn.entity.Post;
import cn.entity.User;
import cn.service.FirmService;
import cn.service.NoticeService;
import cn.service.PostService;
import cn.service.UserService;
import cn.tool.Const;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;


@Controller
@RequestMapping("/panduan")
public class PanduanController {
    @Autowired
    private UserService userService;

    @Autowired
    private FirmService firmService;

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private PostService postService;

    
    
   
    @RequestMapping("login")
    public void login(String name, String password, Integer role,HttpServletRequest request ,HttpServletResponse response)throws ServletException,IOException{
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session=request.getSession();
        PrintWriter out=response.getWriter();
        User con=null;
        Firm son=null;
        if (role==0){
            con =userService.login(name,password);
            if (con==null){
                out.print("<script>alert('用户名或者密码错误!');location.href='"+Const.ROOT+"user/tologin';</script>");
                return;
            }
            session.setAttribute("user",con);
        }else if (role==1){
            son=firmService.login(name,password);
            if (son==null){
                out.print("<script>alert('用户名或者密码错误!');location.href='"+Const.ROOT+"user/tologin';</script>");
                return;
            }
            session.setAttribute("user",son);
        }else {
            out.print("<script>alert('请选择身份!');location.href='"+Const.ROOT+"user/tologin';</script>");
            return;
        }
        session.setAttribute("role",role);
        out.print("<script>location.href='"+Const.ROOT+"panduan/getNotice';</script>");

    }

    @RequestMapping("logout")
    public String logout(HttpServletRequest request,HttpServletResponse response){
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        session.removeAttribute("role");
        return "redirect:"+ Const.ROOT01+"panduan/getNotice";
    }


    
    //首页信息
    @RequestMapping("getNotice")
    
    public String getNotice(@RequestParam(value = "title",required=false)  String title,@RequestParam(value = "post",required=false)  String post,@RequestParam(value = "firm",required=false)  String firm,Integer pageNum,Model model){
        if(pageNum==null||pageNum<0){
            pageNum=1;
        }
        Integer pageSize=Const.pageSize;
        //
        List<Notice> notices=noticeService.getNotice(title);
        //后台往前台传数据。可以传对象，可以传List，通过el表达式 ${}可以获取到
        model.addAttribute("notices",notices);
        PageInfo<Post> pageInfo=postService.getPostFirm(post,firm,pageNum,pageSize);
        model.addAttribute("pageInfo",pageInfo);
        return "list";
    }


    @RequestMapping("queryPostFirm")
    public String queryPostFirm(@RequestParam(value = "title",required=false)  String title,@RequestParam(value = "post",required=false)  String post,@RequestParam(value = "firm",required=false)  String firm,Integer pageNum,String kd,Integer spc,Model model){
        if(pageNum==null||pageNum<0){
            pageNum=1;
        }
        Integer pageSize=Const.pageSize;
        List<Notice> notices=noticeService.getNotice(title);
        model.addAttribute("notices",notices);
        if (spc!=null && spc==1){
            PageInfo<Post> pageInfo=postService.getPostFirm(kd,firm,pageNum,pageSize);
            model.addAttribute("pageInfo",pageInfo);
        }else {
            PageInfo<Post> pageInfo=postService.getPostFirm(post,kd,pageNum,pageSize);
            model.addAttribute("pageInfo",pageInfo);
        }
        return "list";
    }
}
