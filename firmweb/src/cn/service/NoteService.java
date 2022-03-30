package cn.service;

import cn.entity.Note;
import com.github.pagehelper.PageInfo;


import java.util.List;

/**
 * Created by 53191 on 2018/12/19.
 */
public interface NoteService {

    public PageInfo<Note> getAllNote(String rname, Integer pageNum, Integer pageSize);

    int deleteByPrimaryKey(Integer id);

    public List<Note> getNote(String rname);

    int insertSelective(Note record);
}
