package com.chinasoft.hospital_manager.domain;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * Created by Jack on 2019/12/22 3:54
 */
public class User {
    private  Integer id;
    private String name;
    private  String username;
    private  String password;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String birthday;
    private  Integer sex;
    private  String profession;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private String datetime;
    private  String job;
    private  String school;
    private  Role role;

    private Department department;
    public User() {
    }

    public User(Integer id, String name, String username, String password, String birthday, Integer sex, String profession, String datetime, String job, Role role) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.password = password;
        this.birthday = birthday;
        this.sex = sex;
        this.profession = profession;
        this.datetime = datetime;
        this.job = job;
        this.role = role;
    }

    public User(String name, String username, String password, String birthday, Integer sex, String profession, String datetime, String job, Role role) {
        this.name = name;
        this.username = username;
        this.password = password;
        this.birthday = birthday;
        this.sex = sex;
        this.profession = profession;
        this.datetime = datetime;
        this.job = job;
        this.role = role;
    }


    public User(Integer id, String name, String username, String password, String birthday, Integer sex, String profession, String datetime, String job, Role role, Department department) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.password = password;
        this.birthday = birthday;
        this.sex = sex;
        this.profession = profession;
        this.datetime = datetime;
        this.job = job;
        this.role = role;
        this.department = department;
    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUername() {
        return username;
    }

    public void setUername(String uername) {
        this.username = uername;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", birthday=" + birthday +
                ", sex=" + sex +
                ", profession='" + profession + '\'' +
                ", datetime=" + datetime +
                ", job='" + job + '\'' +
                ", role=" + role +
                ", department=" + department +
                '}';
    }
}
