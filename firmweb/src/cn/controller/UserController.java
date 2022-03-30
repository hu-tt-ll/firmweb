package cn.controller;

import cn.entity.User;
import cn.service.UserService;
import cn.tool.Const;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by 53191 on 2018/12/18.
 */

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("getAllUser")
    public String getAllUser(@RequestParam(value = "audit",required=false) Integer audit,Integer pageIndex,Model model){
        if(pageIndex==null||pageIndex<0){
            pageIndex=1;
        }
        Integer pageSize=Const.pageSize;
        PageInfo<User> pageInfo=userService.getAllUser(audit,pageIndex,pageSize);
        List<User> users=pageInfo.getList();
        model.addAttribute("users",users);
        model.addAttribute("pageInfo",pageInfo);
        return "managers/user";
    }

    @RequestMapping("update/{id}")
    public String updateByPrimaryKeySelective(@PathVariable("id")  int id){
        int con=userService.shenhe(id);
        if(con>0){
            return "redirect:"+ Const.ROOT01+"user/getAllUser";
        }else {
            return null;
        }
    }
    
    @RequestMapping("tologin")
    public String tologin(){
       return "login";
    }

    @RequestMapping("delete")
    @ResponseBody
    public int deleteByPrimaryKey(Integer id){
        int con=userService.deleteByPrimaryKey(id);
        return con;
    }

    @RequestMapping("doadd")
    public String insertSelective(@RequestParam("file") MultipartFile file, User user,HttpServletRequest request){
        //如果文件不为空，写入上传路径
        if (!file.isEmpty()){
            String path=request.getSession().getServletContext().getRealPath("/document");
            //上传文件名
            String filename=file.getOriginalFilename();
            //将上传文件保存到一个目标文件当中
            try {
                file.transferTo(new File(path+File.separator+filename));
            } catch (IOException e) {
                e.printStackTrace();
            }
            user.setResume(filename);
            user.setAudit(0);
            user.setIsdel(0);
        }
        int con=userService.insertSelective(user);
        if(con>0){
            return "redirect:"+ Const.ROOT01+"user/tologin";
        }else {
            return null;
        }
    }

    @RequestMapping("exists")
    @ResponseBody
    public boolean exists(String username){
    	return userService.getuser(username);
    }
    
    @RequestMapping("login")
    public  String login(User user){
        User m=userService.login(user.getUsername(),user.getPassword());
        if (m==null){
            return "redirect:"+Const.ROOT01+"user/tologin";
        }else {
            return "redirect:"+Const.ROOT01+"panduan/getNotice";
        }
    }


    @RequestMapping("toupdate")
    public String selectByPrimaryKey(Integer id,Model model){
        User user=userService.selectByPrimaryKey(id);
        if(user!=null){
        	 model.addAttribute(user);
            return "jianli";
        }else{
        	return "jianli";
        }
    }

    @RequestMapping("doupdate")
    public String updateByPrimaryKeySelective(User user){
        int con=userService.updateByPrimaryKeySelective(user);
        if(con>0){
            return "redirect:"+ Const.ROOT01+"panduan/getNotice";
        }else {
            return null;
        }
    }

    @RequestMapping("jianli")
    public String updatejianli(@RequestParam("file") MultipartFile file, User user,HttpServletRequest request){
        //如果文件不为空，写入上传路径
        if (!file.isEmpty()){
            String path=request.getSession().getServletContext().getRealPath("/document");
            //上传文件名
            String filename=file.getOriginalFilename();
            //将上传文件保存到一个目标文件当中
            try {
                file.transferTo(new File(path+File.separator+filename));
            } catch (IOException e) {
                e.printStackTrace();
            }
            user.setResume(filename);
            user.setAudit(1);
            user.setIsdel(0);
        }
        int con=userService.updateByPrimaryKeySelective(user);
        if(con>0){
            return "redirect:"+ Const.ROOT01+"panduan/getNotice";
        }else {
            return null;
        }
    }

}
