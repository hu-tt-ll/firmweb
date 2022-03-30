package cn.entity;

public class Note {
    private Integer id;

    private String rname;

    private String unote;

    private String utime;

    private Integer isdel;

    public Note(Integer id, String rname, String unote, String utime, Integer isdel) {
        this.id = id;
        this.rname = rname;
        this.unote = unote;
        this.utime = utime;
        this.isdel = isdel;
    }

    public Note() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname == null ? null : rname.trim();
    }

    public String getUnote() {
        return unote;
    }

    public void setUnote(String unote) {
        this.unote = unote == null ? null : unote.trim();
    }

    public String getUtime() {
        return utime;
    }

    public void setUtime(String utime) {
        this.utime = utime == null ? null : utime.trim();
    }

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }
}