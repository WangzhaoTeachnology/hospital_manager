package com.chinasoft.hospital_manager.domain;


import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * Created by Jack on 2020/1/29 14:56
 */
public class Doctor {
    private  Integer id;
    private String realname;
    private String name;
    private String password;
    private  String url;
    private String sex;
    private String strength;
    private int status;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String birthday;
    private String school;
    private String profession;
    private String job;
    private  Department department;//这个字段暂时无效
    private String prat;
    private Offices offices;
    private Role role;
    private Appoint_category appoint_category;
    private List<Work> works;

    public Doctor() {
    }

    public Doctor(Integer id, String realname, String name, String password, String url, String sex, String strength, int status, String birthday, String school, String profession, String job, Department department, String prat, Offices offices, Role role, List<Work> works) {
        this.id = id;
        this.realname = realname;
        this.name = name;
        this.password = password;
        this.url = url;
        this.sex = sex;
        this.strength = strength;
        this.status = status;
        this.birthday = birthday;
        this.school = school;
        this.profession = profession;
        this.job = job;
        this.department = department;
        this.prat = prat;
        this.offices = offices;
        this.role = role;
        this.works = works;
    }

    public Doctor(String realname, String name, String password, String url, String sex, String strength, int status, String birthday, String school, String profession, String job, Department department, String prat, Offices offices, Role role, List<Work> works) {
        this.realname = realname;
        this.name = name;
        this.password = password;
        this.url = url;
        this.sex = sex;
        this.strength = strength;
        this.status = status;
        this.birthday = birthday;
        this.school = school;
        this.profession = profession;
        this.job = job;
        this.department = department;
        this.prat = prat;
        this.offices = offices;
        this.role = role;
        this.works = works;
    }

    public Doctor(Integer id, String realname, String name, String password, String url, String sex, String strength, int status, String birthday, String school, String profession, String job, Department department, String prat, Offices offices, Role role, Appoint_category appoint_category, List<Work> works) {
        this.id = id;
        this.realname = realname;
        this.name = name;
        this.password = password;
        this.url = url;
        this.sex = sex;
        this.strength = strength;
        this.status = status;
        this.birthday = birthday;
        this.school = school;
        this.profession = profession;
        this.job = job;
        this.department = department;
        this.prat = prat;
        this.offices = offices;
        this.role = role;
        this.appoint_category = appoint_category;
        this.works = works;
    }


    public Appoint_category getAppoint_category() {
        return appoint_category;
    }

    public void setAppoint_category(Appoint_category appoint_category) {
        this.appoint_category = appoint_category;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getStrength() {
        return strength;
    }

    public void setStrength(String strength) {
        this.strength = strength;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public String getPrat() {
        return prat;
    }

    public void setPrat(String prat) {
        this.prat = prat;
    }

    public Offices getOffices() {
        return offices;
    }

    public void setOffices(Offices offices) {
        this.offices = offices;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public List<Work> getWorks() {
        return works;
    }

    public void setWorks(List<Work> works) {
        this.works = works;
    }
    @Override
    public String toString() {
        return "Doctor{" +
                "id=" + id +
                ", realname='" + realname + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", url='" + url + '\'' +
                ", sex='" + sex + '\'' +
                ", strength='" + strength + '\'' +
                ", status=" + status +
                ", birthday=" + birthday +
                ", school='" + school + '\'' +
                ", profession='" + profession + '\'' +
                ", job='" + job + '\'' +
                ", department=" + department +
                ", prat='" + prat + '\'' +
                ", offices=" + offices +
                ", role=" + role +
                ", appoint_category=" + appoint_category +
                ", works=" + works +
                '}';
    }


}
