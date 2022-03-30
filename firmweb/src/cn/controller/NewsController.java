package cn.controller;

import cn.entity.Firm;
import cn.entity.News;
import cn.service.NewsService;
import cn.tool.Const;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;


@Controller
@RequestMapping("/news")
public class NewsController {
    @Autowired
    private NewsService newsService;

    @RequestMapping("getAllNews")
    public String getAllNews(@RequestParam(value = "title",required=false)  String title, Integer pageIndex,Model model){
        if(pageIndex==null||pageIndex<0){
            pageIndex=1;
        }
        Integer pageSize=Const.pageSize;
        PageInfo<News> pageInfo=newsService.getAllNews(title,pageIndex,pageSize);
        List<News> newss=pageInfo.getList();
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("newss",newss);
        return "managers/news";
    }

    @RequestMapping("doadd")
    public String insertSelective(HttpServletRequest request, News news, @RequestParam("file")MultipartFile file){
        //如果文件不为空，写入上传路径
        if (!file.isEmpty()){
            String path=request.getSession().getServletContext().getRealPath("managers/images/");
            //上传文件名
            String filename=file.getOriginalFilename();
            //将上传文件保存到一个目标文件当中
            try {
                file.transferTo(new File(path+File.separator+filename));
            } catch (IOException e) {
                e.printStackTrace();
            }
            news.setPhoto(filename);
            news.setNtime(Const.getCurrentTime());
        }
        int con=newsService.insertSelective(news);
        if(con>0){
            return "redirect:"+ Const.ROOT01+"news/getAllNews";
        }else {
            return null;
        }
    }

    @RequestMapping("toupdate")
    @ResponseBody
    public News selectByPrimaryKey(Integer id){
        News news=newsService.selectByPrimaryKey(id);
        if(news!=null){
            return news;
        }else{
            return null;
        }
    }


    @RequestMapping("doupdate")
    public String updateByPrimaryKeySelective(HttpServletRequest request,@RequestParam("file")MultipartFile file,News news){
        //如果文件不为空，写入上传路径
        if (!file.isEmpty()){
            String path=request.getSession().getServletContext().getRealPath("managers/images/");
            //上传文件名
            String filename=file.getOriginalFilename();
            //将上传文件保存到一个目标文件当中
            try {
                file.transferTo(new File(path+File.separator+filename));
            } catch (IOException e) {
                e.printStackTrace();
            }
            news.setPhoto(filename);
            news.setNtime(Const.getCurrentTime());
        }
        int con=newsService.updateByPrimaryKeySelective(news);
        if(con>0){
            return "redirect:"+ Const.ROOT01+"news/getAllNews";
        }else {
            return null;
        }
    }

    @RequestMapping("delete")
    @ResponseBody
    public int deleteByPrimaryKey(Integer id){
        int con=newsService.deleteByPrimaryKey(id);
        return con;
    }


    @RequestMapping("getNews")
    public String getNews(@RequestParam(value = "title",required=false)  String title, Integer pageNum,Model model){
        if(pageNum==null||pageNum<0){
            pageNum=1;
        }
        Integer pageSize=Const.pageSize;
        PageInfo<News> pageInfo=newsService.getNews(title,pageNum,pageSize);
        List<News> newss=pageInfo.getList();
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("newss",newss);
        return "news";
    }

}
