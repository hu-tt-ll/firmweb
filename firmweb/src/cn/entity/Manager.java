package cn.entity;

import java.io.Serializable;

public class Manager implements Serializable{
    private Integer id;

    private String username;

    private String password;

    private Integer isdel;

    public Manager(Integer id, String username, String password, Integer isdel) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.isdel = isdel;
    }

    public Manager() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }
}