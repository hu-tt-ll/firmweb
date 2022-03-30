package cn.entity;

public class News {
    private Integer id;

    private String title;

    private String photo;

    private String content;

    private String ntime;

    private Integer isdel;

    public News(Integer id, String title, String photo, String content, String ntime, Integer isdel) {
        this.id = id;
        this.title = title;
        this.photo = photo;
        this.content = content;
        this.ntime = ntime;
        this.isdel = isdel;
    }

    public News() {
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

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo == null ? null : photo.trim();
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