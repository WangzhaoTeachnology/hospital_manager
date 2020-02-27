package com.chinasoft.hospital_manager.domain;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * Created by Jack on 2019/12/26 14:54
 */
public class Admin {

    private  Integer id;
    private  String username;
    private  String password;
    private  String name;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private   String birthday;
    private  int sex;
    private  int count;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String  lastime;
    private String remark;
    private  Role role;

    public Admin() {
    }

    public Admin(Integer id, String username, String password, String name, String birthday, int sex, int count, String lastime, String remark) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.birthday = birthday;
        this.sex = sex;
        this.count = count;
        this.lastime = lastime;
        this.remark = remark;
    }

    public Admin(String username, String password, String name, String birthday, int sex, int count, String lastime, String remark) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.birthday = birthday;
        this.sex = sex;
        this.count = count;
        this.lastime = lastime;
        this.remark = remark;
    }

    public Admin(Integer id, String username, String password, String name, String birthday, int sex, int count, String lastime, String remark, Role role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.birthday = birthday;
        this.sex = sex;
        this.count = count;
        this.lastime = lastime;
        this.remark = remark;
        this.role = role;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
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
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getLastime() {
        return lastime;
    }

    public void setLastime(String lastime) {
        this.lastime = lastime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", birthday='" + birthday + '\'' +
                ", sex=" + sex +
                ", count=" + count +
                ", lastime='" + lastime + '\'' +
                ", remark='" + remark + '\'' +
                ", role=" + role +
                '}';
    }
}
