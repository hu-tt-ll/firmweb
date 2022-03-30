package cn.entity;
//公告栏
public class Notice {
    private Integer id;//编号

    private String title;//公告名

    private String content;//内容

    private String ntime;//发布时间

    private Integer isdel;//删除否

    public Notice(Integer id, String title, String content, String ntime, Integer isdel) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.ntime = ntime;
        this.isdel = isdel;
    }

    public Notice() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getNtime() {
        return ntime;
    }

    public void setNtime(String ntime) {
        this.ntime = ntime == null ? null : ntime.trim();
    }

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }
}