package cn.service.impl;

import cn.dao.NoteMapper;
import cn.entity.Note;
import cn.service.NoteService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 53191 on 2018/12/19.
 */

@Service("noteservice")
public class NoteServiceImpl implements NoteService {
    @Autowired
    NoteMapper noteMapper;


  
    public PageInfo<Note> getAllNote(String rname, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Note> list=noteMapper.getAllNote(rname);
        PageInfo<Note> pageInfo=new PageInfo<Note>(list);
        return pageInfo;
    }


    public int deleteByPrimaryKey(Integer id) {
        return noteMapper.deleteByPrimaryKey(id);
    }

  
    public List<Note> getNote(String rname) {
        return noteMapper.getAllNote(rname);
    }

   
    public int insertSelective(Note record) {
        return noteMapper.insertSelective(record);
    }
}
