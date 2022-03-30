package cn.controller;

import cn.entity.Note;
import cn.entity.User;
import cn.service.NoteService;
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

/**
 * Created by 53191 on 2018/12/20.
 */


@Controller
@RequestMapping("/note")
public class NoteController {
    @Autowired
    private NoteService noteService;

    @RequestMapping("getAllNote")
    public String getAllNote(@RequestParam(value = "rname",required=false)  String rname,Integer pageIndex, Model model){
        if(pageIndex==null||pageIndex<0){
            pageIndex=1;
        }
        Integer pageSize= Const.pageSize;
        PageInfo<Note> pageInfo=noteService.getAllNote(rname,pageIndex,pageSize);
        List<Note> notes=pageInfo.getList();
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("notes",notes);
        return "managers/note";
    }


    @RequestMapping("delete")
    @ResponseBody
    public int deleteByPrimaryKey(Integer id){
        int con=noteService.deleteByPrimaryKey(id);
        return con;
    }

    @RequestMapping("getNote")
    public String getNote(@RequestParam(value = "rname",required=false)  String rname, Model model){
        List<Note> notes=noteService.getNote(rname);
        model.addAttribute("notes",notes);
        return "Note";
    }
    
    @RequestMapping("toAdd")
    public String toAdd(){
        return "addNote";
    }

    @RequestMapping("doadd")
    public String insertSelective(HttpSession session, Note note){
        String name=((User)session.getAttribute("user")).getName();
        note.setRname(name);
        note.setUtime(Const.getCurrentTime());
        note.setIsdel(0);
        int con=noteService.insertSelective(note);
        if(con>0){
            return "redirect:"+ Const.ROOT01+"note/getNote";
        }else {
            return null;
        }
    }
}
